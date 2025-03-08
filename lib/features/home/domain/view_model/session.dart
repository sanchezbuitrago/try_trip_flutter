class UserInfo {
  String name;
  String lastNames;
  String email;
  String phoneNumber;

  UserInfo({required this.name, required this.lastNames, required this.email, required this.phoneNumber});
}

class SessionViewModel {
  Future<bool> sessionIsValid() async {
    await Future.delayed(Duration(seconds: 5));
    return Future.value(false);
  }
}