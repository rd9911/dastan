import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dastan/src/core/data/supabase_client.dart';
import 'package:dastan/src/features/search_platform/domain/search_models.dart';

part 'supabase_search_service.g.dart';

@riverpod
class SupabaseSearchService extends _$SupabaseSearchService {
  SupabaseClient get _client => ref.read(supabaseClientProvider);

  @override
  void build() {}

  /// Calls the 'search' edge function.
  ///
  /// This function acts as a proxy for the serverless scraper,
  /// providing auth validation and postgres-based caching.
  Future<SearchResponse> search({
    required SearchVertical vertical,
    required Map<String, dynamic> params,
    int page = 0,
    int pageSize = 20,
    String? cursor,
  }) async {
    try {
      final response = await _client.functions.invoke(
        'search',
        body: {
          'vertical': vertical.name,
          'params': params,
          'page': page,
          'pageSize': pageSize,
          'cursor': cursor,
        },
      );

      if (response.status != 200) {
        throw Exception(
          'Search function failed with status ${response.status}: ${response.data}',
        );
      }

      // Parse the response into canonical SearchResponse model
      return SearchResponse.fromJson(response.data as Map<String, dynamic>);
    } on FunctionException catch (e) {
      throw Exception('Supabase function error: ${e.toString()}');
    } catch (e) {
      throw Exception('Unexpected search error: $e');
    }
  }
}
