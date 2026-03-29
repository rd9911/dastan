import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class AssetManager {
  Future<String> getAssetPath(String bundleId, String relativePath) async {
    final root = await getApplicationDocumentsDirectory();
    return p.join(root.path, 'bundles', bundleId, relativePath);
  }

  Future<bool> verifyAsset(String absolutePath, String expectedSha256) async {
    final file = File(absolutePath);
    if (!await file.exists()) return false;

    final bytes = await file.readAsBytes();
    final digest = sha256.convert(bytes);
    return digest.toString() == expectedSha256;
  }
}
