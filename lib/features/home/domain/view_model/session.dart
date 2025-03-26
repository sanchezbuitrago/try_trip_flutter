// Project imports:
import 'package:try_trip/core/utils/secure_storage.dart';

class UserInfo {
  String name;
  String lastNames;
  String email;
  String phoneNumber;

  UserInfo(
      {required this.name,
      required this.lastNames,
      required this.email,
      required this.phoneNumber});
}

class SessionViewModel {
  SecureStorage secureStorage = SecureStorage();
  Future<bool> sessionIsValid() async {
    String? lastLoginAt = await secureStorage.get(SecureStorageKey.lastLoginAt);
    if (lastLoginAt != null) {
      print(lastLoginAt);
      DateTime dateTime = DateTime.parse(lastLoginAt);
      DateTime currentDateTime = DateTime.now();
      if (currentDateTime.difference(dateTime).inMinutes < 10) {
        return true;
      }
    }
    return false;
  }

  Future<void> doLogin(String email) async {
    await secureStorage.save(
        SecureStorageKey.lastLoginAt, DateTime.now().toString());
    await secureStorage.save(SecureStorageKey.lastEmailLogin, email);
  }

  Future<void> closeSession() async {
    await secureStorage.delete(SecureStorageKey.lastLoginAt);
  }

  Future<String?> getLastEmailLogin() async {
    return await secureStorage.get(SecureStorageKey.lastEmailLogin);
  }
}
