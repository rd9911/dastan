import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dastan/src/features/offline/application/offline_packager.dart';
import 'package:dastan/src/features/offline/data/offline_repository.dart';
import 'package:dastan/src/features/offline/data/asset_manager.dart';
import 'package:dastan/src/features/offline/domain/offline_manifest.dart';

class MockOfflineRepository extends Mock implements OfflineRepository {}

class MockAssetManager extends Mock implements AssetManager {}

void main() {
  late OfflinePackager packager;
  late MockOfflineRepository mockRepository;
  late MockAssetManager mockAssetManager;

  setUp(() {
    mockRepository = MockOfflineRepository();
    mockAssetManager = MockAssetManager();
    packager = OfflinePackager(mockRepository, mockAssetManager);

    // Register fallback verification values
    registerFallbackValue(
      OfflineBundleManifest(
        itineraryId: 'i1',
        version: 1,
        createdAt: DateTime.now(),
        sections: {},
        dayPlans: [],
        assets: [],
        searchIndex: [],
        metadata: {},
      ),
    );
  });

  test('estimateDownloadSize returns non-zero estimation', () async {
    final size = await packager.estimateDownloadSize('i1');
    expect(size, greaterThan(0));
  });

  test('createBundle emits progress and saves manifest', () async {
    when(() => mockRepository.saveBundle(any())).thenAnswer((_) async => 'b1');

    final stream = packager.createBundle(
      itineraryId: 'i1',
      imageUrls: ['url1', 'url2'],
    );

    // Check that we get progress events
    // 0.0 -> ... -> 1.0
    final events = await stream.toList();
    expect(events.first, 0.0);
    expect(events.last, 1.0);
    expect(events.length, greaterThan(2)); // At least start, progress, end

    // Verify repository called
    verify(() => mockRepository.saveBundle(any())).called(1);
  });
}
