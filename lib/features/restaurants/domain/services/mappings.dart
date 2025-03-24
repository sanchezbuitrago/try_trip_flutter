// Project imports:
import 'package:try_trip/features/restaurants/domain/models/dto.dart';
import 'package:try_trip/features/restaurants/domain/models/restaurants.dart';

RestaurantImage parseMapToRestaurantImage(Map<String, dynamic> map) {
  return RestaurantImage(id: map["id"], url: map["url"]);
}

SocialNetwork parseMapToSocialNetwork(Map<String, dynamic> map) {
  return SocialNetwork(id: map["id"], name: map["name"], url: map["url"]);
}

Restaurant parseMapToRestaurant(Map<String, dynamic> map) {
  List<Map<String, dynamic>> flatRestaurantImages = map["images"];
  List<RestaurantImage> images = [];
  for (int i = 0; i < flatRestaurantImages.length; i++) {
    images.add(parseMapToRestaurantImage(flatRestaurantImages[i]));
  }

  List<Map<String, dynamic>> flatSocialNetworks = map["social_networks"];
  List<SocialNetwork> socialNetworks = [];
  for (int i = 0; i < flatSocialNetworks.length; i++) {
    socialNetworks.add(parseMapToSocialNetwork(flatSocialNetworks[i]));
  }

  return Restaurant(
      name: map["names"],
      images: images,
      socialNetworks: socialNetworks,
      score: double.parse(map["score"]),
      description: map["description"],
      commentsNumber: int.parse(map["comments_number"]));
}

GetTerminalsResponse parseMapToGetTerminalResponse(Map<String, dynamic> map) {
  List<Map<String, dynamic>> flatRestaurants = map["restaurants"];
  List<Restaurant> restaurants = [];
  for (int i = 0; i < flatRestaurants.length; i++) {
    restaurants.add(parseMapToRestaurant(flatRestaurants[i]));
  }
  return GetTerminalsResponse(
      count: int.parse(map["count"]!), restaurants: restaurants);
}
