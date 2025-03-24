// Dart imports:
import "dart:convert";

// Package imports:
import "package:http/http.dart" as http;

class FormatError implements Exception {
  FormatError(String s);
}

class Error {
  final String code;
  final String title;
  final String message;

  Error({required this.code, required this.title, required this.message});
}

class GenericResponse {
  bool success;
  int statusCode;
  Map<String, String> payload;
  List<Error> errors;

  GenericResponse(
      {required this.success,
      required this.statusCode,
      required this.payload,
      required this.errors});
}

abstract class AbstractHttpClient {
  Future<GenericResponse> get({required String host, required String path, queryStrings = const {}});
  Future<GenericResponse> post({required String host, required String path, Map<String, String> body = const {}});
}


class FakeHttpClient extends AbstractHttpClient{
  GenericResponse? getResponse;
  GenericResponse? postResponse;

  FakeHttpClient({this.getResponse, this.postResponse});
  @override
  Future<GenericResponse> get({required String host, required String path, queryStrings = const {}}) async {
    if(getResponse != null){
      throw Exception("Response not provider");
    }
    return getResponse!;
  }
  @override
  Future<GenericResponse> post({required String host, required String path, Map<String, String> body = const {}}) async {
    if(postResponse != null){
      throw Exception("Response not provider");
    }
    return postResponse!;
  }
}

class HttpClient extends AbstractHttpClient{
  @override
  Future<GenericResponse> get(
      {required String host, required String path, queryStrings = const {}}) async {
    Uri url = Uri.https(host, path, queryStrings);
    http.Response response = await http.get(url);
    return _parseResponse(response);
  }

  @override
  Future<GenericResponse> post(
      {required String host, required String path, Map<String, String> body = const {}}) async {
    Uri url = Uri.https(host, path);
    http.Response response = await http.post(url, body: body);
    return _parseResponse(response);
  }

  GenericResponse _parseResponse(http.Response response) {
    try {
      Map<String, dynamic> responseDecoded = jsonDecode(response.body);
      List<Map<String, String>> flatErrors = responseDecoded["errors"];
      List<Error> errors = [];
      for (int i = 0; i < errors.length + 1; i++) {
        errors.add(Error(
            code: flatErrors[i]["code"]!,
            title: flatErrors[i]["title"]!,
            message: flatErrors[i]["message"]!));
      }
      return GenericResponse(
          success: bool.parse(responseDecoded["success"]),
          statusCode: response.statusCode,
          payload: responseDecoded["payload"],
          errors: errors);
    } catch (e) {
      throw FormatError("Error formating http response");
    }
  }
}
