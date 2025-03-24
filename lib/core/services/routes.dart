// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:try_trip/features/activities/presentation/screens/activities.dart';
import 'package:try_trip/features/authentication/presentation/screens/forgot_pin.dart';
import 'package:try_trip/features/authentication/presentation/screens/login.dart';
import 'package:try_trip/features/authentication/presentation/screens/user_register.dart';
import 'package:try_trip/features/home/home.dart';
import 'package:try_trip/features/hotels/presentation/screens/hotels.dart';
import 'package:try_trip/features/restaurants/presentation/screens/restaurants.dart';

class AppRoutes {
  static const String home = '/';
  static const String userRegister = "/user-register";
  static const String login = "/login";
  static const String restaurants = "/restaurants";
  static const String hotels = "/hotels";
  static const String activities = "/activities";
  static const String forgotPassword = "/forgot_password";

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final Map<String, Widget Function(BuildContext)> routes = {
    home: (context) => TryTripHomePage(title: "TryTrip"),
    userRegister: (context) => UserRegisterPage(),
    login: (context) => LoginPage(),
    restaurants: (context) => RestaurantsPage(),
    hotels: (context) => HotelsPage(),
    activities: (context) => ActivitiesPage(),
    forgotPassword: (context) => ForgotPasswordPage(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String? routeName = settings.name;
    final Widget Function(BuildContext)? routeBuilder = routes[routeName];
    if (routeBuilder != null) {
      return MaterialPageRoute(settings: settings, builder: routeBuilder);
    }
    return MaterialPageRoute(
        settings: settings,
        builder: (context) => TryTripHomePage(title: "Error"));
  }

  static void navigateTo(BuildContext context, String routeName,
      {Object? arguments}) {
    if (ModalRoute.of(context)?.settings.name != routeName) {
      Navigator.pushNamed(context, routeName, arguments: arguments);
    }
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  static void resetTo(BuildContext context, String routeName,
      {Object? arguments}) {
    Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false,
        arguments: arguments);
  }

  static void navigateAndRemoveUntil(
      BuildContext context, String routeName, String removeUntilRoute,
      {Object? arguments}) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
      (routes) {
        return routes.settings.name == removeUntilRoute;
      },
      arguments: arguments,
    );
  }
}
