// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:country_code_picker/country_code_picker.dart';
import 'package:try_trip/core/model/constants.dart';

// Project imports:
import 'package:try_trip/core/services/routes.dart';
import 'package:try_trip/core/widgets/alerts.dart';
import 'package:try_trip/core/widgets/buttons.dart';
import 'package:try_trip/core/widgets/text_form_fields.dart';
import 'package:try_trip/features/authentication/presentation/view_models/register_user.dart';

import 'package:try_trip/generated/l10n.dart';

import 'package:try_trip/core/utils/logger.dart';

class UserRegisterPage extends StatefulWidget {
  const UserRegisterPage({super.key});

  @override
  State<UserRegisterPage> createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _pinConfirmationController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _countryCode = '+57';
  final String _defaultCountrySelected = 'CO';
  final List<String> _favoriteCountries = ['CO'];
  bool _pinMatch = true;
  bool isLoading = true;

  SuccessAlert successAlert = SuccessAlert();
  ErrorAlert errorAlert = ErrorAlert();
  RegisterUserViewModel registerUserViewModel = RegisterUserViewModel();
  final CustomLogger _logger = CustomLogger.instance;

  void _handleUserRegisteredState(RegisterUserState state){
    successAlert.show(context, () {
      AppRoutes.goBack(context);
      AppRoutes.navigateTo(context, AppRoutes.login);
    });
  }

  void _handleRegisterUserGenericErrorState(UserRegisterGenericErrorState state){
    errorAlert.show(
        context: context,
        alertText: S.of(context).registerGenericError,
        onConfirm: () {
          AppRoutes.goBack(context);
        });
  }

  void _processLoginState(RegisterUserState state){
    switch (state.runtimeType) {
      case UserRegisteredSate:
        _handleUserRegisteredState(state as UserRegisteredSate);
        break;
      case UserRegisterGenericErrorState:
        _handleRegisterUserGenericErrorState(state as UserRegisterGenericErrorState);
        break;
      default:
        _logger.logError("State not supported ${state.runtimeType.toString()}");
        break;
    }
    _deactivateLoader();
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

  void submit() async {
    setState(() {
      _pinMatch = _pinController.text == _pinConfirmationController.text;
    });
    if ((_formKey.currentState?.validate() ?? false) && _pinMatch) {
      _activeLoader();
      RegisterUserState response = await registerUserViewModel.registerUser(
          _firstNameController.text,
          _lastNameController.text,
          _emailController.text,
          _pinController.text,
          _countryCode,
          _phoneController.text
      );
      _processLoginState(response);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          S.of(context).registerAppBarText,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: Theme.of(context).colorScheme.secondary,
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Text(
                          S.of(context).registerFormTitle,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    DefaultTextFormField(
                      controller: _firstNameController,
                      labelText: S.of(context).registerFormNameLabelText,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).registerFormNameNotFoundError;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    DefaultTextFormField(
                      controller: _lastNameController,
                      labelText: S.of(context).registerFormLastNameLabelText,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).registerFormLastNameNotFoundError;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    DefaultTextFormField(
                      controller: _emailController,
                      labelText: S.of(context).registerFormEmailLabelText,
                      textInputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).registerFormEmailNotFoundError;
                        }
                        if (!RegExp(emailRegex).hasMatch(value)) {
                          return S.of(context).registerFormEmailNotValidError;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        IntrinsicWidth(
                          child: CountryCodePicker(
                            headerText: S.of(context).registerFormCountryHeader,
                            onChanged: (CountryCode countryCode) {
                              setState(() {
                                _countryCode = countryCode.dialCode!;
                              });
                            },
                            initialSelection: _defaultCountrySelected,
                            favorite: _favoriteCountries,
                            showCountryOnly: false,
                            alignLeft: true,
                            padding: EdgeInsets.zero,
                            showFlag: true,
                            searchDecoration: InputDecoration(
                              labelText: S.of(context).registerFormCountryLabelText,
                              hintText: S.of(context).registerFormCountryHintText,
                            ),
                            textStyle: TextStyle(fontSize: 16),
                            dialogBackgroundColor: Theme.of(context).colorScheme.secondary,
                            barrierColor: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Flexible(
                          child: DefaultTextFormField(
                            controller: _phoneController,
                            labelText: S.of(context).registerFormPhoneNumberLabelText,
                            textInputType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return S.of(context).registerFormPhoneNumberNotFoundError;
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Flexible(
                          child: DefaultTextFormField(
                            controller: _pinController,
                            labelText: S.of(context).registerFormPINLabelText,
                            textInputType: TextInputType.number,
                            maxLength: 4,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return S.of(context).registerFormPINNotFoundError;
                              }
                              if (value.length != 4) {
                                return S.of(context).registerFormPINNotValid;
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 5),
                        Flexible(
                          child: DefaultTextFormField(
                            controller: _pinConfirmationController,
                            labelText: S.of(context).registerFormSecondPINLabelText,
                            textInputType: TextInputType.number,
                            maxLength: 4,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return S.of(context).registerFormSecondPINNotFoundError;
                              }
                              if (value.length != 4) {
                                return S.of(context).registerFormSecondPINNotValid;
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          !_pinMatch ? S.of(context).registerFormPINsNotMatch : '',
                          style: TextStyle(
                            color: Color(0xFFB00020),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
      bottomNavigationBar: DefaultButtonNavigationBar(
        onPressed: submit,
        child: Text(S.of(context).registerFormActionButtonText),
      ),
    );
  }
}
