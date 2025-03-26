// Dart imports:
import 'dart:io';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:try_trip/core/utils/http.dart';
import 'package:try_trip/core/utils/logger.dart';
import 'package:try_trip/core/utils/secure_storage.dart';
import 'package:try_trip/features/authentication/domain/models/commands.dart';
import 'package:try_trip/features/authentication/domain/models/exceptions.dart';

class UserController {
  AbstractHttpClient httpClient = HttpClient();
  final SecureStorage _secureStorage = SecureStorage();
  final CustomLogger _logger = CustomLogger.instance;

  Future<void> registerUser(RegisterUserCommand cmd) async {
    _logger.logInfo("Try to register user with email ${cmd.email}");
    const String host = "10.0.2.2:3030";
    const String path = "/users/login";
    GenericResponse response =
        await httpClient.post(host: host, path: path, body: {
      "names": cmd.names,
      "surname": cmd.surname,
      "email": cmd.email,
      "pin": cmd.pin,
      "phone_number": cmd.phoneNumber,
      "country_code": cmd.countryCode
    });
    if (!response.success) {
      throw Exception("Error registrando el usuario");
    }
  }

  Future<void> doLogin(DoLoginCommand cmd) async {
    _logger.logInfo("Try to do login using the email ${cmd.email}");
    const String host = "10.0.2.2:3030";
    const String path = "/users/login";

    try {
      GenericResponse response = await httpClient.post(
          host: host, path: path, body: {"email": cmd.email, "pin": cmd.pin});
      if (!response.success) {
        _logger.logError(
            "Error doing login, the service had a fail response, status_code: ${response.statusCode.toString()}");
        throw GenericErrorInLoginProcess();
      }

      String accessToken = response.payload["access_token"]!;
      String refreshToken = response.payload["refresh_token"]!;

      _secureStorage.save(SecureStorageKey.refreshToken, refreshToken);
      _secureStorage.save(SecureStorageKey.accessToken, accessToken);
      _secureStorage.save(SecureStorageKey.lastEmailLogin, cmd.email);
    } on SocketException catch (e) {
      _logger.logError('Error de red: No se pudo conectar. $e');
      throw ConnectionError();
    } on http.ClientException catch (e) {
      _logger.logError('Error de cliente HTTP: $e');
      throw ConnectionError();
    } catch (e) {
      _logger.logError('Error desconocido: $e');
      throw ConnectionError();
    }
  }

  void closeSession() {
    _secureStorage.delete(SecureStorageKey.refreshToken);
    _secureStorage.delete(SecureStorageKey.accessToken);
  }

  Future<String?> getLastEmailLogin() async {
    return await _secureStorage.get(SecureStorageKey.lastEmailLogin);
  }
}
