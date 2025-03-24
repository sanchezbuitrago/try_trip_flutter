// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:try_trip/features/restaurants/domain/models/restaurants.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final Map<String, IconData> socialMediaIcons = {};
  RestaurantCard({super.key, required this.restaurant});

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'No se pudo abrir la URL: $url';
    }
  }

  Row buildSocialMediaList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: FaIcon(
            FontAwesomeIcons.facebook,
            size: 25,
          ),
          onPressed: () {
            _launchURL('https://www.facebook.com');
          },
        ),
        IconButton(
          icon: FaIcon(
            FontAwesomeIcons.instagram,
            size: 25,
          ),
          onPressed: () {
            _launchURL('https://www.instagram.com');
          },
        ),
        IconButton(
          icon: FaIcon(
            FontAwesomeIcons.tiktok,
            size: 25,
          ),
          onPressed: () {
            _launchURL('https://www.instagram.com');
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary, // Color de la sombra
            spreadRadius: 1, // Expansión de la sombra
            blurRadius: 10, // Difusión de la sombra
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              color: Colors.black,
              height: 200,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.asset(
                  'assets/images/image_not_found.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(
                        restaurant.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )),
                      Row(
                        children: [
                          Icon(Icons.star),
                          Text(
                            restaurant.score.toString(),
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.comment),
                          Text(
                            restaurant.commentsNumber.toString(),
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      )
                    ],
                  ),
                  buildSocialMediaList(),
                  Text(
                    "Description",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
