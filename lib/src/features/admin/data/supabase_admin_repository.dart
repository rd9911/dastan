import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dastan/src/features/admin/domain/admin_models.dart';
import 'package:dastan/src/features/admin/data/admin_repository.dart';

/// Supabase implementation of [AdminRepository].
///
/// Uses Supabase tables for user data, invoices, overrides, and abuse queue.
/// Some operations may require Edge Functions for sensitive operations.
class SupabaseAdminRepository implements AdminRepository {
  final SupabaseClient _client;

  SupabaseAdminRepository(this._client);

  @override
  Future<List<AdminSearchResult>> search(String query, {int limit = 20}) async {
    final results = <AdminSearchResult>[];
    final lowercaseQuery = query.toLowerCase();

    try {
      // Search users via profiles table
      final userResponse = await _client
          .from('profiles')
          .select('id, display_name, email')
          .or(
            'display_name.ilike.%$lowercaseQuery%,email.ilike.%$lowercaseQuery%',
          )
          .limit(limit);

      for (final user in userResponse as List) {
        results.add(
          AdminSearchResult(
            type: 'user',
            id: user['id'],
            title: user['display_name'] ?? 'Unknown',
            subtitle: user['email'] ?? '',
          ),
        );
      }

      // Search itineraries
      final itineraryResponse = await _client
          .from('itineraries')
          .select('id, name, owner_id')
          .ilike('name', '%$lowercaseQuery%')
          .limit(limit);

      for (final itin in itineraryResponse as List) {
        results.add(
          AdminSearchResult(
            type: 'itinerary',
            id: itin['id'],
            title: itin['name'],
            subtitle: 'Owner: ${itin['owner_id']}',
          ),
        );
      }
    } catch (e) {
      print('Admin search error: $e');
    }

    return results.take(limit).toList();
  }

  @override
  Future<UserOverview?> getUserOverview(
    String userId, {
    bool includePii = false,
  }) async {
    try {
      final response = await _client
          .from('profiles')
          .select()
          .eq('id', userId)
          .maybeSingle();

      if (response == null) return null;

      // Get itinerary count
      final itinCount = await _client
          .from('itineraries')
          .select('id')
          .eq('owner_id', userId);

      // Get saved item count
      final savedCount = await _client
          .from('saved_items')
          .select('id')
          .eq('user_id', userId);

      return UserOverview(
        id: userId,
        email: includePii ? (response['email'] ?? '') : '[redacted]',
        name: response['display_name'] ?? 'Unknown',
        plan: response['preferences']?['plan'] ?? 'free',
        createdAt:
            DateTime.tryParse(response['created_at'] ?? '') ?? DateTime.now(),
        itineraryCount: (itinCount as List).length,
        savedItemCount: (savedCount as List).length,
        lastActiveAt: response['updated_at'] != null
            ? DateTime.tryParse(response['updated_at'])
            : null,
        isSuspended: response['is_suspended'] ?? false,
        suspendedReason: response['suspended_reason'],
      );
    } catch (e) {
      print('Error getting user overview: $e');
      return null;
    }
  }

  @override
  Future<List<Invoice>> getUserInvoices(String userId) async {
    // Invoices would typically be stored in a separate billing system
    // For now, check if we have an invoices table
    try {
      final response = await _client
          .from('invoices')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      return (response as List)
          .map(
            (item) => Invoice(
              id: item['id'],
              userId: item['user_id'],
              amount: (item['amount'] as num).toDouble(),
              currency: item['currency'] ?? 'USD',
              status: InvoiceStatus.values.firstWhere(
                (s) => s.name == item['status'],
                orElse: () => InvoiceStatus.pending,
              ),
              createdAt: DateTime.parse(item['created_at']),
              paidAt: item['paid_at'] != null
                  ? DateTime.tryParse(item['paid_at'])
                  : null,
              refundedAt: item['refunded_at'] != null
                  ? DateTime.tryParse(item['refunded_at'])
                  : null,
            ),
          )
          .toList();
    } catch (e) {
      print('Error getting invoices: $e');
      return [];
    }
  }

  @override
  Future<RefundResult> processRefund({
    required String invoiceId,
    required double amount,
    required String reason,
    required String ticketUrl,
  }) async {
    // Refunds typically go through a payment processor via Edge Function
    try {
      final response = await _client.functions.invoke(
        'process-refund',
        body: {
          'invoice_id': invoiceId,
          'amount': amount,
          'reason': reason,
          'ticket_url': ticketUrl,
        },
      );

      final data = response.data as Map<String, dynamic>;
      return RefundResult(
        success: data['success'] ?? false,
        refundId: data['refund_id'],
        amount: amount,
        invoiceId: invoiceId,
        error: data['error'],
      );
    } catch (e) {
      return RefundResult(
        success: false,
        amount: amount,
        invoiceId: invoiceId,
        error: e.toString(),
      );
    }
  }

  @override
  Future<PlanChangeResult> changePlan({
    required String userId,
    required String newPlanId,
    required bool immediate,
    required String reason,
  }) async {
    try {
      // Get current plan
      final profile = await _client
          .from('profiles')
          .select('preferences')
          .eq('id', userId)
          .single();

      final currentPlan = profile['preferences']?['plan'] ?? 'free';

      // Update plan in preferences
      final prefs = (profile['preferences'] as Map<String, dynamic>?) ?? {};
      prefs['plan'] = newPlanId;

      await _client
          .from('profiles')
          .update({
            'preferences': prefs,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', userId);

      return PlanChangeResult(
        success: true,
        userId: userId,
        oldPlan: currentPlan,
        newPlan: newPlanId,
        effectiveAt: immediate
            ? DateTime.now()
            : DateTime.now().add(const Duration(days: 30)),
      );
    } catch (e) {
      return PlanChangeResult(
        success: false,
        userId: userId,
        oldPlan: 'unknown',
        newPlan: newPlanId,
        effectiveAt: DateTime.now(),
        error: e.toString(),
      );
    }
  }

  @override
  Future<List<OverrideGrant>> getUserOverrides(String userId) async {
    try {
      final response = await _client
          .from('override_grants')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      return (response as List)
          .map(
            (item) => OverrideGrant(
              id: item['id'],
              userId: item['user_id'],
              key: item['key'],
              value: item['value'],
              reason: item['reason'] ?? '',
              grantedBy: item['granted_by'] ?? '',
              createdAt: DateTime.parse(item['created_at']),
              expiresAt: item['expires_at'] != null
                  ? DateTime.tryParse(item['expires_at'])
                  : null,
              revokedAt: item['revoked_at'] != null
                  ? DateTime.tryParse(item['revoked_at'])
                  : null,
              revokedBy: item['revoked_by'],
            ),
          )
          .toList();
    } catch (e) {
      print('Error getting overrides: $e');
      return [];
    }
  }

  @override
  Future<OverrideGrant> createOverride(OverrideGrant grant) async {
    final response = await _client
        .from('override_grants')
        .insert({
          'user_id': grant.userId,
          'key': grant.key,
          'value': grant.value,
          'reason': grant.reason,
          'granted_by': grant.grantedBy,
          'expires_at': grant.expiresAt?.toIso8601String(),
        })
        .select()
        .single();

    return OverrideGrant(
      id: response['id'],
      userId: response['user_id'],
      key: response['key'],
      value: response['value'],
      reason: response['reason'] ?? '',
      grantedBy: response['granted_by'] ?? '',
      createdAt: DateTime.parse(response['created_at']),
      expiresAt: response['expires_at'] != null
          ? DateTime.tryParse(response['expires_at'])
          : null,
    );
  }

  @override
  Future<void> revokeOverride(String grantId, String revokedBy) async {
    await _client
        .from('override_grants')
        .update({
          'revoked_at': DateTime.now().toIso8601String(),
          'revoked_by': revokedBy,
        })
        .eq('id', grantId);
  }

  @override
  Future<List<AbuseSignal>> getAbuseQueue({AbuseSeverity? minSeverity}) async {
    try {
      var query = _client
          .from('abuse_signals')
          .select()
          .isFilter('reviewed_at', null)
          .order('detected_at', ascending: false);

      final response = await query;

      var signals = (response as List)
          .map(
            (item) => AbuseSignal(
              id: item['id'],
              userId: item['user_id'],
              type: AbuseType.values.firstWhere(
                (t) => t.name == item['type'],
                orElse: () => AbuseType.other,
              ),
              severity: AbuseSeverity.values.firstWhere(
                (s) => s.name == item['severity'],
                orElse: () => AbuseSeverity.low,
              ),
              description: item['description'] ?? '',
              evidence: item['evidence'],
              detectedAt: DateTime.parse(item['detected_at']),
              reviewedAt: item['reviewed_at'] != null
                  ? DateTime.tryParse(item['reviewed_at'])
                  : null,
              reviewedBy: item['reviewed_by'],
              resolution: item['resolution'] != null
                  ? AbuseResolution.values.firstWhere(
                      (r) => r.name == item['resolution'],
                      orElse: () => AbuseResolution.dismissed,
                    )
                  : null,
            ),
          )
          .toList();

      if (minSeverity != null) {
        final minIndex = AbuseSeverity.values.indexOf(minSeverity);
        signals = signals
            .where((s) => AbuseSeverity.values.indexOf(s.severity) >= minIndex)
            .toList();
      }

      return signals;
    } catch (e) {
      print('Error getting abuse queue: $e');
      return [];
    }
  }

  @override
  Future<TakedownRequest> createTakedownRequest(TakedownRequest request) async {
    final response = await _client
        .from('takedown_requests')
        .insert({
          'target_type': request.targetType,
          'target_id': request.targetId,
          'reason': request.reason,
          'requested_by': request.requestedBy,
        })
        .select()
        .single();

    return TakedownRequest(
      id: response['id'],
      targetType: response['target_type'],
      targetId: response['target_id'],
      reason: response['reason'],
      requestedBy: response['requested_by'],
      requestedAt: DateTime.parse(
        response['requested_at'] ?? response['created_at'],
      ),
    );
  }

  @override
  Future<TakedownRequest> approveTakedown(
    String requestId,
    String approvedBy,
  ) async {
    final response = await _client
        .from('takedown_requests')
        .update({
          'approved_by': approvedBy,
          'approved_at': DateTime.now().toIso8601String(),
        })
        .eq('id', requestId)
        .select()
        .single();

    return TakedownRequest(
      id: response['id'],
      targetType: response['target_type'],
      targetId: response['target_id'],
      reason: response['reason'],
      requestedBy: response['requested_by'],
      requestedAt: DateTime.parse(
        response['requested_at'] ?? response['created_at'],
      ),
      approvedBy: response['approved_by'],
      approvedAt: response['approved_at'] != null
          ? DateTime.tryParse(response['approved_at'])
          : null,
    );
  }
}
