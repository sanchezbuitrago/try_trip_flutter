// Dart imports:
import 'dart:async';

// Package imports:
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum SecureStorageKey { lastLoginAt, lastEmailLogin, refreshToken, accessToken }

class SecureStorage {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> save(SecureStorageKey key, String value) async {
    await storage.write(key: key.name, value: value);
  }

  Future<String?> get(SecureStorageKey key) async {
    String? token = await storage.read(key: key.name);
    return token;
  }

  Future<void> delete(SecureStorageKey key) async {
    await storage.delete(key: key.name);
  }
}
