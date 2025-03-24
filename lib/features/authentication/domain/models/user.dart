class PhoneNumber{
  String countryCode;
  String number;

  PhoneNumber({required this.countryCode, required this.number});
}

class User{
  String names;
  String surnames;
  String email;
  PhoneNumber phoneNumber;

  User({required this.names, required this.surnames, required this.email, required this.phoneNumber});
}