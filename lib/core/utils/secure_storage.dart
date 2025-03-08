import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage{
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> save(String key, String value) async {
    await storage.write(key: 'user_token', value: 'your_secure_token');
  }

  Future<String?> get(String key) async {
    String? token = await storage.read(key: 'user_token');
    return token;
  }

  Future<void> delete(String key) async {
    await storage.delete(key: 'user_token');
  }
}