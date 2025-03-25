// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
