// Project imports:
import 'package:try_trip/features/authentication/domain/models/commands.dart';
import 'package:try_trip/features/authentication/domain/models/exceptions.dart';
import 'package:try_trip/features/authentication/domain/services/user.dart';

abstract class LoginState {}

class LoginSuccessfulState extends LoginState {}

class InvalidCredentialsState extends LoginState {}

class GenericErrorState extends LoginState {}

class ConnectionErrorState extends LoginState {}

class LastEmailToLoginConsulted extends LoginState {
  String? email;

  LastEmailToLoginConsulted({this.email});
}

class LoginViewModel {
  UserController userController = UserController();
  Future<LoginState> doLogin(
      {required String email, required String pin}) async {
    // TODO: Delete after implement service calling
    return LoginSuccessfulState();
    try {
      await userController.doLogin(DoLoginCommand(email: email, pin: pin));
      return LoginSuccessfulState();
    } on ConnectionError catch (e) {
      return ConnectionErrorState();
    } catch (e) {
      return InvalidCredentialsState();
    }
  }

  Future<LoginState> getLastEmailToLogin() async {
    String? email = await userController.getLastEmailLogin();
    return LastEmailToLoginConsulted(email: email);
  }
}
