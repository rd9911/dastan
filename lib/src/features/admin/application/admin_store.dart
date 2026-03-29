import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/admin/domain/admin_models.dart';
import 'package:dastan/src/features/admin/application/admin_policy_engine.dart';
import 'package:dastan/src/features/admin/application/admin_audit_service.dart';
import 'package:dastan/src/features/admin/data/admin_repository.dart';

/// State for the admin console.
class AdminState {
  final AdminSession? session;
  final List<AdminSearchResult> searchResults;
  final UserOverview? selectedUser;
  final List<Invoice> userInvoices;
  final List<OverrideGrant> userOverrides;
  final List<AbuseSignal> abuseQueue;
  final List<TakedownRequest> pendingTakedowns;
  final List<AdminAction> recentActions;
  final bool isLoading;
  final String? error;

  const AdminState({
    this.session,
    this.searchResults = const [],
    this.selectedUser,
    this.userInvoices = const [],
    this.userOverrides = const [],
    this.abuseQueue = const [],
    this.pendingTakedowns = const [],
    this.recentActions = const [],
    this.isLoading = false,
    this.error,
  });

  AdminState copyWith({
    AdminSession? session,
    List<AdminSearchResult>? searchResults,
    UserOverview? selectedUser,
    List<Invoice>? userInvoices,
    List<OverrideGrant>? userOverrides,
    List<AbuseSignal>? abuseQueue,
    List<TakedownRequest>? pendingTakedowns,
    List<AdminAction>? recentActions,
    bool? isLoading,
    String? error,
  }) {
    return AdminState(
      session: session ?? this.session,
      searchResults: searchResults ?? this.searchResults,
      selectedUser: selectedUser ?? this.selectedUser,
      userInvoices: userInvoices ?? this.userInvoices,
      userOverrides: userOverrides ?? this.userOverrides,
      abuseQueue: abuseQueue ?? this.abuseQueue,
      pendingTakedowns: pendingTakedowns ?? this.pendingTakedowns,
      recentActions: recentActions ?? this.recentActions,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  /// Check if current user can perform an action.
  PolicyDecision can(AdminActionType action, {String? resource}) {
    if (session == null || !session!.isValid) {
      return const PolicyDecision(allowed: false, reason: 'No valid session');
    }
    return AdminPolicyEngine.can(session!.role, action, resource: resource);
  }
}

/// Notifier for admin console state.
class AdminStoreNotifier extends Notifier<AdminState> {
  late AdminRepository _repo;
  late AdminAuditService _auditService;
  late IdempotencyService _idempotencyService;

  @override
  AdminState build() {
    _repo = ref.watch(adminRepositoryProvider);
    _auditService = ref.watch(adminAuditServiceProvider);
    _idempotencyService = ref.watch(idempotencyServiceProvider);
    return const AdminState();
  }

  /// Login with admin session.
  void login(AdminSession session) {
    state = state.copyWith(session: session);
    _auditService.appendAction(
      actorId: session.userId,
      actorEmail: session.email,
      actorRole: session.role,
      actionType: AdminActionType.login,
      resource: 'admin_console',
      reason: 'Admin login',
    );
    _refreshRecentActions();
  }

  /// Logout.
  void logout() {
    if (state.session != null) {
      _auditService.appendAction(
        actorId: state.session!.userId,
        actorEmail: state.session!.email,
        actorRole: state.session!.role,
        actionType: AdminActionType.logout,
        resource: 'admin_console',
        reason: 'Admin logout',
      );
    }
    state = const AdminState();
  }

  /// Universal search.
  Future<void> search(String query) async {
    if (query.length < 2) {
      state = state.copyWith(searchResults: []);
      return;
    }

    state = state.copyWith(isLoading: true);
    try {
      final results = await _repo.search(query);
      state = state.copyWith(searchResults: results, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  /// Select a user to view details.
  Future<void> selectUser(String userId) async {
    final decision = state.can(AdminActionType.viewUser);
    if (!decision.allowed) {
      state = state.copyWith(error: decision.reason);
      return;
    }

    state = state.copyWith(isLoading: true);
    try {
      final user = await _repo.getUserOverview(userId);
      final invoices = await _repo.getUserInvoices(userId);
      final overrides = await _repo.getUserOverrides(userId);

      _auditService.appendAction(
        actorId: state.session!.userId,
        actorEmail: state.session!.email,
        actorRole: state.session!.role,
        actionType: AdminActionType.viewUser,
        resource: 'user:$userId',
        targetId: userId,
        targetType: 'user',
        reason: 'Viewing user details',
      );

      state = state.copyWith(
        selectedUser: user,
        userInvoices: invoices,
        userOverrides: overrides,
        isLoading: false,
      );
      _refreshRecentActions();
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  /// Process a refund.
  Future<RefundResult?> processRefund({
    required String invoiceId,
    required double amount,
    required String reason,
    required String ticketUrl,
    required String idempotencyKey,
  }) async {
    final decision = state.can(AdminActionType.refund);
    if (!decision.allowed) {
      state = state.copyWith(error: decision.reason);
      return null;
    }

    state = state.copyWith(isLoading: true);
    try {
      final idemResult = await _idempotencyService.executeIdempotent(
        key: idempotencyKey,
        actionType: 'refund',
        action: () async {
          final result = await _repo.processRefund(
            invoiceId: invoiceId,
            amount: amount,
            reason: reason,
            ticketUrl: ticketUrl,
          );
          return result.refundId ?? 'failed';
        },
      );

      if (idemResult.isNew) {
        _auditService.appendAction(
          actorId: state.session!.userId,
          actorEmail: state.session!.email,
          actorRole: state.session!.role,
          actionType: AdminActionType.refund,
          resource: 'invoice:$invoiceId',
          targetId: invoiceId,
          targetType: 'invoice',
          reason: reason,
          ticketUrl: ticketUrl,
          details: {'amount': amount, 'mutationId': idemResult.mutationId},
        );
      }

      state = state.copyWith(isLoading: false);
      _refreshRecentActions();

      return RefundResult(
        success: true,
        refundId: idemResult.result,
        amount: amount,
        invoiceId: invoiceId,
      );
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
      return null;
    }
  }

  /// Change user's plan.
  Future<PlanChangeResult?> changePlan({
    required String userId,
    required String newPlanId,
    required bool immediate,
    required String reason,
    required String idempotencyKey,
  }) async {
    final decision = state.can(AdminActionType.changePlan);
    if (!decision.allowed) {
      state = state.copyWith(error: decision.reason);
      return null;
    }

    state = state.copyWith(isLoading: true);
    try {
      final idemResult = await _idempotencyService.executeIdempotent(
        key: idempotencyKey,
        actionType: 'changePlan',
        action: () async {
          final result = await _repo.changePlan(
            userId: userId,
            newPlanId: newPlanId,
            immediate: immediate,
            reason: reason,
          );
          return result.success ? 'success' : 'failed';
        },
      );

      if (idemResult.isNew) {
        _auditService.appendAction(
          actorId: state.session!.userId,
          actorEmail: state.session!.email,
          actorRole: state.session!.role,
          actionType: AdminActionType.changePlan,
          resource: 'user:$userId',
          targetId: userId,
          targetType: 'user',
          reason: reason,
          details: {
            'newPlan': newPlanId,
            'immediate': immediate,
            'mutationId': idemResult.mutationId,
          },
        );
      }

      state = state.copyWith(isLoading: false);
      _refreshRecentActions();

      return PlanChangeResult(
        success: true,
        userId: userId,
        oldPlan: state.selectedUser?.plan ?? 'unknown',
        newPlan: newPlanId,
        effectiveAt: immediate
            ? DateTime.now()
            : DateTime.now().add(const Duration(days: 30)),
      );
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
      return null;
    }
  }

  /// Refresh recent actions from audit log.
  void _refreshRecentActions() {
    final actions = _auditService.getAuditLog(limit: 20);
    state = state.copyWith(recentActions: actions);
  }

  /// Clear error.
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// Clear selected user.
  void clearSelectedUser() {
    state = state.copyWith(
      selectedUser: null,
      userInvoices: [],
      userOverrides: [],
    );
  }
}

/// Provider for the admin store.
final adminStoreNotifierProvider =
    NotifierProvider<AdminStoreNotifier, AdminState>(AdminStoreNotifier.new);
