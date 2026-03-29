import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dastan/src/features/offline/domain/offline_manifest.dart';

/// Service for syncing offline bundle metadata with Supabase.
///
/// This enables cross-device awareness of which itineraries are available offline.
class SupabaseBundleService {
  final SupabaseClient _client;

  SupabaseBundleService(this._client);

  /// Fetches bundle metadata for all itineraries the user has offline access to.
  Future<List<BundleMetadata>> fetchUserBundles() async {
    final user = _client.auth.currentUser;
    if (user == null) return [];

    try {
      final response = await _client
          .from('offline_bundle_metadata')
          .select()
          .eq('user_id', user.id)
          .order('created_at', ascending: false);

      return (response as List)
          .map((item) => BundleMetadata.fromJson(item))
          .toList();
    } catch (e) {
      print('Error fetching bundle metadata: $e');
      return [];
    }
  }

  /// Fetches bundle metadata for a specific itinerary.
  Future<BundleMetadata?> fetchBundleForItinerary(String itineraryId) async {
    final user = _client.auth.currentUser;
    if (user == null) return null;

    try {
      final response = await _client
          .from('offline_bundle_metadata')
          .select()
          .eq('user_id', user.id)
          .eq('itinerary_id', itineraryId)
          .maybeSingle();

      if (response == null) return null;
      return BundleMetadata.fromJson(response);
    } catch (e) {
      print('Error fetching bundle: $e');
      return null;
    }
  }

  /// Registers that a bundle has been downloaded on this device.
  Future<void> registerBundle(OfflineBundleManifest manifest) async {
    final user = _client.auth.currentUser;
    if (user == null) return;

    try {
      await _client.from('offline_bundle_metadata').upsert({
        'user_id': user.id,
        'itinerary_id': manifest.itineraryId,
        'version': manifest.version,
        'size_bytes': manifest.metadata['size'] ?? 0,
        'asset_count': manifest.assets.length,
        'created_at': manifest.createdAt.toIso8601String(),
        'updated_at': DateTime.now().toIso8601String(),
      }, onConflict: 'user_id,itinerary_id');
    } catch (e) {
      print('Error registering bundle: $e');
      rethrow;
    }
  }

  /// Removes bundle metadata when an offline bundle is deleted.
  Future<void> unregisterBundle(String itineraryId) async {
    final user = _client.auth.currentUser;
    if (user == null) return;

    try {
      await _client
          .from('offline_bundle_metadata')
          .delete()
          .eq('user_id', user.id)
          .eq('itinerary_id', itineraryId);
    } catch (e) {
      print('Error unregistering bundle: $e');
      rethrow;
    }
  }

  /// Checks if an itinerary has offline content on any device.
  Future<bool> hasOfflineBundle(String itineraryId) async {
    final bundle = await fetchBundleForItinerary(itineraryId);
    return bundle != null;
  }
}

/// Metadata about an offline bundle stored in Supabase.
class BundleMetadata {
  final String userId;
  final String itineraryId;
  final int version;
  final int sizeBytes;
  final int assetCount;
  final DateTime createdAt;
  final DateTime? updatedAt;

  BundleMetadata({
    required this.userId,
    required this.itineraryId,
    required this.version,
    required this.sizeBytes,
    required this.assetCount,
    required this.createdAt,
    this.updatedAt,
  });

  factory BundleMetadata.fromJson(Map<String, dynamic> json) {
    return BundleMetadata(
      userId: json['user_id'],
      itineraryId: json['itinerary_id'],
      version: json['version'] ?? 1,
      sizeBytes: json['size_bytes'] ?? 0,
      assetCount: json['asset_count'] ?? 0,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'user_id': userId,
    'itinerary_id': itineraryId,
    'version': version,
    'size_bytes': sizeBytes,
    'asset_count': assetCount,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };
}
