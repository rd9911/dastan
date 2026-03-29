import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dastan/src/features/tours/application/tour_providers.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';

part 'tour_download_service.g.dart';

@riverpod
class TourDownloadService extends _$TourDownloadService {
  @override
  FutureOr<void> build() {}

  Future<void> downloadTour({
    required TourDetail detail,
    required String languageCode,
    required void Function(double progress) onProgress,
  }) async {
    // 1. Get audio version for language
    final audioVersion = detail.audioVersions.firstWhere(
      (v) => v.languageCode == languageCode && v.status == AudioStatus.ready,
      orElse: () => detail.audioVersions.first,
    );

    String? audioPath;
    // 2. Download audio file using Dio if URL exists
    if (audioVersion.audioUrl != null) {
      final dir = await getApplicationDocumentsDirectory();
      audioPath = '${dir.path}/tours/${detail.summary.id}/$languageCode.mp3';
      
      await Dio().download(
        audioVersion.audioUrl!,
        audioPath,
        onReceiveProgress: (received, total) {
          if (total > 0) {
            onProgress(received / total);
          }
        },
      );
    }

    // 3. Store guide content + audio path locally
    await ref.read(tourLocalDataSourceProvider).saveDownloadedTour(
      tourId: detail.summary.id,
      contentJson: jsonEncode(detail.guideContent.toJson()),
      audioFilePath: audioPath,
      languageCode: languageCode,
    );
  }
}

@riverpod
Future<bool> isTourDownloaded(Ref ref, String tourId, String languageCode) async {
  final localDataSource = ref.watch(tourLocalDataSourceProvider);
  return localDataSource.isTourDownloaded(tourId, languageCode);
}
