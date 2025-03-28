// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:try_trip/core/widgets/drawer.dart';
import 'package:try_trip/features/home/domain/view_model/session.dart';
import 'package:try_trip/features/restaurants/domain/models/restaurants.dart';
import 'package:try_trip/features/restaurants/presentation/widgets/restaurant_card.dart';
import 'package:try_trip/generated/l10n.dart';

class RestaurantsPage extends StatefulWidget {
  const RestaurantsPage({super.key});

  @override
  State<RestaurantsPage> createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  List<Restaurant> restaurants = [];
  final ScrollController _scrollController = ScrollController();
  SessionViewModel sessionViewModel = SessionViewModel();

  @override
  void initState() {
    getMoreRestaurants();
    _scrollController.addListener(() {
      getMoreRestaurants();
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void getMoreRestaurants() {
    setState(() {
      for (var i = 0; i < 10; i++) {
        restaurants.add(Restaurant(
            name: "Test Name Restaurant",
            images: [],
            socialNetworks: [],
            score: 4.5,
            description: "Description of restaurant",
            commentsNumber: 200));
      }
    });
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    restaurants.clear();
    getMoreRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(
          S.of(context).restaurantsListTitle,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      drawer: DefaultDrawer(),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Column(
          children: [
            Expanded(
                child: Container(
              color: Theme.of(context).colorScheme.secondary,
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    return RestaurantCard(restaurant: restaurants[index]);
                  }),
            ))
          ],
        ),
      ),
    );
  }
}
