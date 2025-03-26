// GENERATED CODE - DO NOT MODIFY BY HAND

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello`
  String get hello {
    return Intl.message('Hello', name: 'hello', desc: '', args: []);
  }

  /// `Iniciar Sesion`
  String get loginActionButton {
    return Intl.message(
      'Iniciar Sesion',
      name: 'loginActionButton',
      desc: '',
      args: [],
    );
  }

  /// `¿ Eres usuario nuevo ?`
  String get loginNewUserText {
    return Intl.message(
      '¿ Eres usuario nuevo ?',
      name: 'loginNewUserText',
      desc: '',
      args: [],
    );
  }

  /// `Credenciales no validas`
  String get loginInvalidCredentialsMessage {
    return Intl.message(
      'Credenciales no validas',
      name: 'loginInvalidCredentialsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Error en la conexion al servicio, verifica tú internet`
  String get loginConnectionErrorMessage {
    return Intl.message(
      'Error en la conexion al servicio, verifica tú internet',
      name: 'loginConnectionErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Inicio de Sesion`
  String get loginAppBarTitle {
    return Intl.message(
      'Inicio de Sesion',
      name: 'loginAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Iniciar Sesion`
  String get loginTitle {
    return Intl.message(
      'Iniciar Sesion',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Correo electronico`
  String get loginEmailLabelText {
    return Intl.message(
      'Correo electronico',
      name: 'loginEmailLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Por favor ingrese su correo electrónico`
  String get loginEmailNotFoundError {
    return Intl.message(
      'Por favor ingrese su correo electrónico',
      name: 'loginEmailNotFoundError',
      desc: '',
      args: [],
    );
  }

  /// `Por favor ingrese un correo válido`
  String get loginEmailNotValidError {
    return Intl.message(
      'Por favor ingrese un correo válido',
      name: 'loginEmailNotValidError',
      desc: '',
      args: [],
    );
  }

  /// `PIN`
  String get loginPINLabelText {
    return Intl.message('PIN', name: 'loginPINLabelText', desc: '', args: []);
  }

  /// `Por favor ingrese un PIN`
  String get loginPINNotFoundError {
    return Intl.message(
      'Por favor ingrese un PIN',
      name: 'loginPINNotFoundError',
      desc: '',
      args: [],
    );
  }

  /// `El PIN no cumple con la longitud requerida`
  String get loginPINNotValidError {
    return Intl.message(
      'El PIN no cumple con la longitud requerida',
      name: 'loginPINNotValidError',
      desc: '',
      args: [],
    );
  }

  /// `Olvidaste tú PIN ?`
  String get loginForgotPINLink {
    return Intl.message(
      'Olvidaste tú PIN ?',
      name: 'loginForgotPINLink',
      desc: '',
      args: [],
    );
  }

  /// `Registrate`
  String get loginRegisterButtonLabel {
    return Intl.message(
      'Registrate',
      name: 'loginRegisterButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `TryTrip 0.0.0`
  String get loginVersionLabel {
    return Intl.message(
      'TryTrip 0.0.0',
      name: 'loginVersionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Error registrando el usuario`
  String get registerGenericError {
    return Intl.message(
      'Error registrando el usuario',
      name: 'registerGenericError',
      desc: '',
      args: [],
    );
  }

  /// `Registro de Usuario`
  String get registerAppBarText {
    return Intl.message(
      'Registro de Usuario',
      name: 'registerAppBarText',
      desc: '',
      args: [],
    );
  }

  /// `Formulario de registro`
  String get registerFormTitle {
    return Intl.message(
      'Formulario de registro',
      name: 'registerFormTitle',
      desc: '',
      args: [],
    );
  }

  /// `Nombre`
  String get registerFormNameLabelText {
    return Intl.message(
      'Nombre',
      name: 'registerFormNameLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Por favor ingrese su nombre`
  String get registerFormNameNotFoundError {
    return Intl.message(
      'Por favor ingrese su nombre',
      name: 'registerFormNameNotFoundError',
      desc: '',
      args: [],
    );
  }

  /// `Apellidos`
  String get registerFormLastNameLabelText {
    return Intl.message(
      'Apellidos',
      name: 'registerFormLastNameLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Por favor ingrese sus apellidos`
  String get registerFormLastNameNotFoundError {
    return Intl.message(
      'Por favor ingrese sus apellidos',
      name: 'registerFormLastNameNotFoundError',
      desc: '',
      args: [],
    );
  }

  /// `Correo electrónico`
  String get registerFormEmailLabelText {
    return Intl.message(
      'Correo electrónico',
      name: 'registerFormEmailLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Por favor ingrese su correo electronico`
  String get registerFormEmailNotFoundError {
    return Intl.message(
      'Por favor ingrese su correo electronico',
      name: 'registerFormEmailNotFoundError',
      desc: '',
      args: [],
    );
  }

  /// `El correo electrónico no cumple con el formato requerido`
  String get registerFormEmailNotValidError {
    return Intl.message(
      'El correo electrónico no cumple con el formato requerido',
      name: 'registerFormEmailNotValidError',
      desc: '',
      args: [],
    );
  }

  /// `Selecciona el país`
  String get registerFormCountryHeader {
    return Intl.message(
      'Selecciona el país',
      name: 'registerFormCountryHeader',
      desc: '',
      args: [],
    );
  }

  /// `Buscar país`
  String get registerFormCountryLabelText {
    return Intl.message(
      'Buscar país',
      name: 'registerFormCountryLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Buscar ...`
  String get registerFormCountryHintText {
    return Intl.message(
      'Buscar ...',
      name: 'registerFormCountryHintText',
      desc: '',
      args: [],
    );
  }

  /// `Número de teléfono`
  String get registerFormPhoneNumberLabelText {
    return Intl.message(
      'Número de teléfono',
      name: 'registerFormPhoneNumberLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Por favor ingrese su número de teléfono`
  String get registerFormPhoneNumberNotFoundError {
    return Intl.message(
      'Por favor ingrese su número de teléfono',
      name: 'registerFormPhoneNumberNotFoundError',
      desc: '',
      args: [],
    );
  }

  /// `PIN`
  String get registerFormPINLabelText {
    return Intl.message(
      'PIN',
      name: 'registerFormPINLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Por favor ingrese su PIN`
  String get registerFormPINNotFoundError {
    return Intl.message(
      'Por favor ingrese su PIN',
      name: 'registerFormPINNotFoundError',
      desc: '',
      args: [],
    );
  }

  /// `El PIN debe tener 4 digitos`
  String get registerFormPINNotValid {
    return Intl.message(
      'El PIN debe tener 4 digitos',
      name: 'registerFormPINNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Confirmar PIN`
  String get registerFormSecondPINLabelText {
    return Intl.message(
      'Confirmar PIN',
      name: 'registerFormSecondPINLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Por favor ingrese su PIN`
  String get registerFormSecondPINNotFoundError {
    return Intl.message(
      'Por favor ingrese su PIN',
      name: 'registerFormSecondPINNotFoundError',
      desc: '',
      args: [],
    );
  }

  /// `El PIN debe tener 4 digitos`
  String get registerFormSecondPINNotValid {
    return Intl.message(
      'El PIN debe tener 4 digitos',
      name: 'registerFormSecondPINNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Los PINs no coinciden`
  String get registerFormPINsNotMatch {
    return Intl.message(
      'Los PINs no coinciden',
      name: 'registerFormPINsNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Registrar Usuario`
  String get registerFormActionButtonText {
    return Intl.message(
      'Registrar Usuario',
      name: 'registerFormActionButtonText',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
