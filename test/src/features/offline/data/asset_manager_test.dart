import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/offline/data/asset_manager.dart';

// Mock path_provider if needed, but integration test with temporary file is easier here?
// Since getApplicationDocumentsDirectory is platform channel based, we can't easily mock it in pure unit test without mock channel.
// We can modify AssetManager to accept a root path or Directory provider for testability.
// Or mocking package:path_provider using setMockPathProviderPlatform.
// Let's try mocking the platform channel or just use a simpler design where AssetManager takes a root string in constructor?

void main() {
  test('verifyAsset checks file hash', () async {
    final manager = AssetManager();
    // Create a temp file
    final tempDir = Directory.systemTemp.createTempSync();
    final file = File('${tempDir.path}/test.txt');
    await file.writeAsString('hello world');

    // Hash of 'hello world'
    // echo -n "hello world" | shasum -a 256
    // b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9

    final hash = sha256.convert('hello world'.codeUnits).toString();

    expect(await manager.verifyAsset(file.path, hash), true);
    expect(await manager.verifyAsset(file.path, 'wronghash'), false);

    await file.delete();
    await tempDir.delete();
  });
}
