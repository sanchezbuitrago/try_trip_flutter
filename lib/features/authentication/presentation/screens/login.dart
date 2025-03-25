// Flutter imports:
import 'package:flutter/material.dart';
import 'package:try_trip/core/model/constants.dart';

// Project imports:
import 'package:try_trip/core/services/routes.dart';
import 'package:try_trip/core/widgets/alerts.dart';
import 'package:try_trip/core/widgets/buttons.dart';
import 'package:try_trip/core/widgets/progress_bar.dart';
import 'package:try_trip/core/widgets/text_form_fields.dart';
import 'package:try_trip/features/authentication/presentation/view_models/login.dart';

import 'package:try_trip/generated/l10n.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();

  ErrorAlert errorAlert = ErrorAlert();
  LoginViewModel loginViewModel = LoginViewModel();
  bool isLoading = false;

  @override
  void initState() {
    _getLastEmailLogin();
    super.initState();
  }
  
  void _handleLastEmailToLoginConsulted(LastEmailToLoginConsulted state){
    if (state.email != null) {
      _emailController.text = state.email!;
    }
  }

  void _handleInvalidCredentialsState(InvalidCredentialsState state){
    errorAlert.show(
        context: context,
        alertText: S.of(context).loginInvalidCredentialsMessage,
        onConfirm: (){
          AppRoutes.goBack(context);
        }
    );
  }

  void _handleConnectionErrorState(ConnectionErrorState state){
    errorAlert.show(
        context: context,
        alertText: S.of(context).loginConnectionErrorMessage,
        onConfirm: (){
          AppRoutes.goBack(context);
        }
    );
  }

  void _handleLoginSuccessfulState(LoginSuccessfulState state){
    if (mounted) {
      AppRoutes.resetTo(context, AppRoutes.home);
    }
  }

  void _processLoginState(LoginState state){
    switch (state.runtimeType) {
      case LastEmailToLoginConsulted:
        _handleLastEmailToLoginConsulted(state as LastEmailToLoginConsulted);
        break;
      case InvalidCredentialsState:
        _handleInvalidCredentialsState(state as InvalidCredentialsState);
        break;
      case ConnectionErrorState:
        _handleConnectionErrorState(state as ConnectionErrorState);
        break;
      case LoginSuccessfulState:
        _handleLoginSuccessfulState(state as LoginSuccessfulState);
        break;
      default:
        break;
    }

    _deactivateLoader();
  }

  void _getLastEmailLogin() async {
    LoginState? getLastEmailToLoginStateResponse = await loginViewModel.getLastEmailToLogin();
    _processLoginState(getLastEmailToLoginStateResponse);
  }

  Future<void> _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      _activeLoader();
      LoginState doLoginState = await loginViewModel.doLogin(email: _emailController.text, pin: _pinController.text);
      _processLoginState(doLoginState);
    }
  }

  void _activeLoader(){
    setState(() {
      isLoading = true;
    });
  }

  void _deactivateLoader(){
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          S.of(context).loginAppBarTitle,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: isLoading ? DefaultProgressIndicator() :Column(
        children: [
          Expanded(
              child: Container(
            color: Theme.of(context).colorScheme.secondary,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: MediaQuery.of(context).size.height * 0.1),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/app_icon.png',
                            // Ruta de tu imagen en los activos
                            width: 100, // Ancho de la imagen
                            height: 100, // Alto de la imagen
                            fit: BoxFit
                                .cover, // Ajusta la imagen para que cubra el área del círculo
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Text(
                            S.of(context).loginTitle,
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      DefaultTextFormField(
                        controller: _emailController,
                        labelText: S.of(context).loginEmailLabelText,
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).loginEmailNotFoundError;
                          }
                          // Validación simple para correo
                          if (!RegExp(emailRegex).hasMatch(value)) {
                            return S.of(context).loginEmailNotValidError;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      // PIN de 4 dígitos
                      DefaultTextFormField(
                        controller: _pinController,
                        labelText: S.of(context).loginPINLabelText,
                        textInputType: TextInputType.number,
                        maxLength: 4,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).loginPINNotFoundError;
                          }
                          if (value.length != 4) {
                            return S.of(context).loginPINNotValidError;
                          }
                          return null;
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          AppRoutes.navigateTo(
                              context, AppRoutes.forgotPassword);
                        },
                        child: Text(
                          S.of(context).loginForgotPINLink,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: DefaultButtonNavigationBar(
                            onPressed: _submit,
                            child: Text(S.of(context).loginActionButton),
                          ))
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(S.of(context).loginNewUserText),
                                GestureDetector(
                                  onTap: () {
                                    AppRoutes.navigateTo(
                                        context, AppRoutes.userRegister);
                                  },
                                  child: Text(
                                    S.of(context).loginRegisterButtonLabel,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                S.of(context).loginVersionLabel,
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
