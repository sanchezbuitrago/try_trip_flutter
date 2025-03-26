import 'package:try_trip/features/authentication/domain/models/commands.dart';
import 'package:try_trip/features/authentication/domain/services/user.dart';

abstract class RegisterUserState{}

class UserRegisteredSate extends RegisterUserState {}
class UserRegisterGenericErrorState extends RegisterUserState {}

class RegisterUserViewModel {
  final UserController userController = UserController();
  Future<RegisterUserState> registerUser(String names, String surname, String email, String pin, String countryCode, String phoneNumber) async {
    RegisterUserCommand cmd = RegisterUserCommand(
        names: names,
        surname: surname,
        email: email,
        pin: pin,
        countryCode: countryCode,
        phoneNumber: phoneNumber
    );
    try{
      await userController.registerUser(cmd);
      return UserRegisteredSate();
    } catch (e){
      return UserRegisterGenericErrorState();
    }
  }
}