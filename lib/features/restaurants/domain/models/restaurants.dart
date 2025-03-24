enum SocialMediaNames { facebook, instagram, tikTok }

class RestaurantImage {
  String id;
  String url;

  RestaurantImage({required this.id, required this.url});
}

class SocialNetwork {
  String id;
  String name;
  String url;

  static final List<String> _validSocialNetworks = [
    "FACEBOOK",
    "INSTAGRAM",
    "TIK_TOK"
  ];

  SocialNetwork({required this.id, required this.name, required this.url}) {
    if (!isAValidSocialNetwork(name)) {
      throw Exception(
          "Social network name not valid, values accepted: ${_validSocialNetworks.join(",")}");
    }
  }

  static bool isAValidSocialNetwork(String name) {
    return _validSocialNetworks.contains(name);
  }
}

class Restaurant {
  String name;
  List<RestaurantImage> images;
  List<SocialNetwork> socialNetworks;
  double score;
  int commentsNumber;
  String description;

  Restaurant(
      {required this.name,
      required this.images,
      required this.socialNetworks,
      required this.score,
      required this.description,
      required this.commentsNumber});
}
