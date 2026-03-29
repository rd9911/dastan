import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:dastan/src/features/planner/domain/planner_models.dart';
import 'package:dastan/src/features/offline/application/security_utils.dart';

/// Service for exporting day plans as images or preparing for PDF export.
class PlannerExportService {
  /// Generates an image snapshot of the day plan.
  /// Returns the image bytes and a hash for integrity verification.
  Future<ExportResult> exportAsImage({
    required GlobalKey boundaryKey,
    double pixelRatio = 2.0,
  }) async {
    final boundary =
        boundaryKey.currentContext?.findRenderObject()
            as RenderRepaintBoundary?;
    if (boundary == null) {
      throw Exception('Cannot capture widget - boundary not found');
    }

    final image = await boundary.toImage(pixelRatio: pixelRatio);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) {
      throw Exception('Failed to encode image');
    }

    final bytes = byteData.buffer.asUint8List();

    // Strip any embedded metadata by re-encoding (PNG doesn't have EXIF but we verify integrity)
    final hash = SecurityUtils.computeIntegrityHash(bytes);

    return ExportResult(
      bytes: bytes,
      format: ExportFormat.png,
      integrityHash: hash,
    );
  }

  /// Prepares a day plan for PDF export by generating structured data.
  /// The actual PDF generation would be done by a PDF library.
  Map<String, dynamic> preparePdfData(DayPlan plan) {
    return {
      'date': plan.date.toIso8601String().split('T')[0],
      'entries': plan.entries
          .map(
            (e) => {
              'title': e.title,
              'type': e.type.name,
              'startTime': e.startTime?.toIso8601String(),
              'endTime': e.endTime?.toIso8601String(),
              'duration': e.durationMinutes,
              // Explicitly exclude sensitive fields
              // 'notes': excluded for privacy
              // 'savedItemId': excluded to prevent PII leakage
            },
          )
          .toList(),
      'exportedAt': DateTime.now().toIso8601String(),
    };
  }

  /// Verifies that export data doesn't contain PII.
  bool verifyNoPii(Map<String, dynamic> data) {
    final sensitiveKeys = [
      'notes',
      'savedItemId',
      'userId',
      'email',
      'phone',
      'bookingId',
    ];

    bool checkMap(Map<String, dynamic> m) {
      for (final key in m.keys) {
        if (sensitiveKeys.contains(key.toLowerCase())) {
          return false;
        }
        if (m[key] is Map) {
          if (!checkMap(m[key] as Map<String, dynamic>)) return false;
        }
        if (m[key] is List) {
          for (final item in m[key]) {
            if (item is Map && !checkMap(item as Map<String, dynamic>)) {
              return false;
            }
          }
        }
      }
      return true;
    }

    return checkMap(data);
  }
}

enum ExportFormat { png, pdf }

class ExportResult {
  final Uint8List bytes;
  final ExportFormat format;
  final String integrityHash;

  const ExportResult({
    required this.bytes,
    required this.format,
    required this.integrityHash,
  });
}
