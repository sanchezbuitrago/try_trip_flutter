// Project imports:
import 'package:try_trip/features/restaurants/domain/models/restaurants.dart';

class GetTerminalsResponse {
  int count;
  List<Restaurant> restaurants;

  GetTerminalsResponse({required this.count, required this.restaurants});
}
