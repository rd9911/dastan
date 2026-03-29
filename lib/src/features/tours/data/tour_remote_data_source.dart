import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';
import 'package:dastan/src/features/tours/data/tour_dto.dart';

class TourRemoteDataSource {
  final SupabaseClient _client;

  TourRemoteDataSource(this._client);

  Future<List<Country>> getCountries() async {
    final response = await _client
        .from('countries')
        .select('*, cities(*)')
        .eq('is_active', true)
        .order('sort_order');

    return (response as List).map((json) => TourDto.countryFromSupabase(json)).toList();
  }

  Future<List<TourSummary>> getToursByCity(String cityId) async {
    final response = await _client
        .from('tours')
        .select('*, tour_category_mappings(tour_categories(*))')
        .eq('city_id', cityId)
        .eq('is_published', true)
        .eq('is_active', true);

    return (response as List).map((json) {
      // Flatten categories from join
      final categories = (json['tour_category_mappings'] as List)
          .map((m) => m['tour_categories'] as Map<String, dynamic>)
          .toList();
      
      final tourJson = Map<String, dynamic>.from(json);
      tourJson['categories'] = categories;
      
      return TourDto.tourSummaryFromSupabase(tourJson);
    }).toList();
  }

  Future<TourDetail> getTourDetail(String tourId) async {
    final response = await _client
        .from('tours')
        .select('''
          *,
          tour_category_mappings(tour_categories(*)),
          tour_guide_content(tour_id, content, version),
          tour_waypoints(*),
          tour_audio_versions(*)
        ''')
        .eq('id', tourId)
        .single();

    return TourDto.tourDetailFromSupabase(response);
  }

  Future<List<SavedTour>> getSavedTours(String userId) async {
    final response = await _client
        .from('saved_tours')
        .select('*, tours(*, tour_category_mappings(tour_categories(*)))')
        .eq('user_id', userId);

    return (response as List).map((json) {
      final tourJson = json['tours'] as Map<String, dynamic>;
      final categories = (tourJson['tour_category_mappings'] as List)
          .map((m) => m['tour_categories'] as Map<String, dynamic>)
          .toList();
      
      tourJson['categories'] = categories;
      
      final savedTourJson = Map<String, dynamic>.from(json);
      savedTourJson['tourSummary'] = tourJson;
      
      return TourDto.savedTourFromSupabase(savedTourJson);
    }).toList();
  }

  Future<void> saveTour(String userId, String tourId) async {
    await _client.from('saved_tours').upsert({
      'user_id': userId,
      'tour_id': tourId,
      'saved_at': DateTime.now().toIso8601String(),
    });
  }

  Future<void> unsaveTour(String userId, String tourId) async {
    await _client
        .from('saved_tours')
        .delete()
        .eq('user_id', userId)
        .eq('tour_id', tourId);
  }

  Future<void> markTourOpened(String userId, String tourId) async {
    await _client.from('saved_tours').update({
      'last_opened_at': DateTime.now().toIso8601String(),
    }).eq('user_id', userId).eq('tour_id', tourId);
  }

  Future<PlaybackProgress?> getPlaybackProgress(String userId, String tourId) async {
    final response = await _client
        .from('tour_playback_progress')
        .select()
        .eq('user_id', userId)
        .eq('tour_id', tourId)
        .maybeSingle();

    if (response == null) return null;
    return TourDto.progressFromSupabase(response);
  }

  Future<void> updatePlaybackProgress(PlaybackProgress progress) async {
    await _client.from('tour_playback_progress').upsert({
      'user_id': progress.userId,
      'tour_id': progress.tourId,
      'audio_position_ms': progress.audioPositionMs,
      'current_section': progress.currentSection,
      'completed': progress.completed,
      'last_updated_at': DateTime.now().toIso8601String(),
    });
  }
}
