// Project imports:
import 'package:try_trip/core/utils/http.dart';
import 'package:try_trip/features/restaurants/domain/models/commands.dart';
import 'package:try_trip/features/restaurants/domain/models/dto.dart';
import 'package:try_trip/features/restaurants/domain/models/exceptions.dart';
import 'package:try_trip/features/restaurants/domain/models/restaurants.dart';
import 'package:try_trip/features/restaurants/domain/services/mappings.dart';

const List<String> errorTitlesFromHttpResponse = [];
const Map<String, Exception> exceptionByTitleError = {};

class RestaurantsController {
  int limit = 0;
  int offset = 0;
  final int itemsByPage = 10;
  final HttpClient httpClient = HttpClient();
  RestaurantsController();

  void createRestaurant({required CreateRestaurantCommand cmd}) {
    throw Exception("Not implemented error");
  }

  void _setLimitAndOffsetByPage({required int page}) {
    if (page < 1) {
      throw Exception("Page number must be greater than 0");
    }
    limit = (page * itemsByPage) + itemsByPage;
    offset = page * itemsByPage;
  }

  Future<GetTerminalsResponse> getRestaurants({required int page}) async {
    const String host = "10.2.2.2:3030";
    const String path = "/restaurants";
    _setLimitAndOffsetByPage(page: page);
    GenericResponse response = await httpClient.get(
        host: host, path: path, queryStrings: {limit: limit, offset: offset});
    if (!response.success) {
      _processingErrorFromHttpResponse(response);
    }
    GetTerminalsResponse getTerminalsResponse =
        parseMapToGetTerminalResponse(response.payload);
    return getTerminalsResponse;
  }

  Restaurant getRestaurant({required String restaurantID}) {
    throw Exception("Not implemented error");
  }

  void _processingErrorFromHttpResponse(GenericResponse response) {
    for (int i = 0; i < response.errors.length; i++) {
      String errorTitle = response.errors[i].title;
      if (errorTitlesFromHttpResponse.contains(errorTitle)) {
        Exception? exception = exceptionByTitleError[errorTitle];
        if (exception != null) {
          throw exception;
        }
      }
    }
    throw ExceptionNotSupported();
  }
}
