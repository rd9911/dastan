import 'dart:async';
import 'dart:math';
import 'package:dastan/src/features/trails/data/trails_repository.dart';
import 'package:dastan/src/features/trails/domain/trails_models.dart';

/// Mock implementation of [TrailsRepository].
class MockTrailsRepository implements TrailsRepository {
  Completer<void>? _searchCompleter;
  bool _cancelled = false;

  @override
  Future<TrailsSearchResult> search(
    TrailsSearchRequest request, {
    String? cursor,
  }) async {
    _cancelled = false;
    _searchCompleter = Completer<void>();

    await Future.delayed(const Duration(milliseconds: 800));

    if (_cancelled) {
      throw Exception('Search cancelled');
    }

    // Deterministic generation
    final hash = request.place.value.hashCode;
    final total = 20 + (hash.abs() % 30);
    final page = cursor == null ? 0 : int.tryParse(cursor) ?? 0;
    final pageSize = 10;

    final items = <TrailCard>[];
    final start = page * pageSize;
    final count = min(pageSize, total - start);

    for (int i = 0; i < count; i++) {
      items.add(_generateCard(request.place.value, start + i));
    }

    _searchCompleter?.complete();
    _searchCompleter = null;

    return TrailsSearchResult(
      items: items,
      totalCount: total,
      nextCursor: (start + count < total) ? '${page + 1}' : null,
    );
  }

  @override
  Future<TrailDetail> getDetail(String providerId, String externalId) async {
    await Future.delayed(const Duration(milliseconds: 600));
    final index = externalId.hashCode;

    return TrailDetail(
      id: 'dt-$externalId',
      providerId: providerId,
      externalId: externalId,
      name: 'Scenic Trail $externalId',
      thumbnail: 'https://picsum.photos/800/600?random=$index',
      durationMinutes: 90 + (index % 240),
      difficulty: TrailDifficulty.values[index % 3],
      lengthKm: 3.0 + (index % 15),
      elevationGainM: 50.0 + (index % 800),
      location: TrailLocation(
        lat: 40.0,
        lng: -74.0,
        name: 'Mountain Park',
        address: 'Trailhead Rd, County',
      ),
      description:
          'A beautiful trail offering scenic views and a good workout. '
          'Suitable for most skill levels. Bring water and hiking shoes.',
      externalUrl: 'https://example.com/trail/$externalId',
      photos: List.generate(
        4,
        (i) => 'https://picsum.photos/800/600?random=${index + i}',
      ),
      isLoop: index % 2 == 0,
    );
  }

  @override
  void cancelSearch() {
    _cancelled = true;
    _searchCompleter?.complete();
  }

  TrailCard _generateCard(String place, int index) {
    final h = place.hashCode + index;
    return TrailCard(
      id: 'tr-$h',
      providerId: 'mock',
      externalId: 'ext-$h',
      name: '$place Trail #${index + 1}',
      thumbnail: 'https://picsum.photos/400/300?random=$h',
      durationMinutes: 45 + (h % 300),
      difficulty: TrailDifficulty.values[h % 3],
      lengthKm: 1.5 + (h % 20),
      elevationGainM: 20.0 + (h % 1000),
      location: TrailLocation(
        lat: 40.0 + (h % 100) / 1000,
        lng: -74.0 + (h % 100) / 1000,
        name: '$place Park',
      ),
      isLoop: h % 2 == 0,
      website: 'https://example.com/trail/$h',
    );
  }
}
