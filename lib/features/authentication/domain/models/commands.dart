class DoLoginCommand {
  String email;
  String pin;

  DoLoginCommand({required this.email, required this.pin});
}

class RegisterUserCommand {
  String names;
  String surname;
  String email;
  String pin;
  String countryCode;
  String phoneNumber;
  RegisterUserCommand(
      {required this.names,
      required this.surname,
      required this.email,
      required this.pin,
      required this.countryCode,
      required this.phoneNumber});
}
