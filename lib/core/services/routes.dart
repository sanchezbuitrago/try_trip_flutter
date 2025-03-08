import 'package:flutter/material.dart';
import 'package:try_trip/features/authentication/presentation/secreens/user_register.dart';
import 'package:try_trip/features/home/home.dart';

class AppRoutes {
  static const String home = '/';
  static const String detalles = '/detalles';

  static const String userRegister = "/user-register";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => TryTripHomePage(title: "TryTrip"));
      case detalles:
        return MaterialPageRoute(builder: (context) => TryTripHomePage(title: "TryTrip Detalles"));
      case userRegister:
        return MaterialPageRoute(builder: (context) => UserRegisterPage());
      default:
        return MaterialPageRoute(builder: (context) => TryTripHomePage(title: "TryTrip 2",));
    }
  }

  // Navegar a una nueva pantalla
  static void navigateTo(BuildContext context, String routeName, {Object? arguments}) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  // Volver a la pantalla anterior
  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  // Navegar a una nueva pantalla eliminando todo el historial de navegación
  static void resetTo(BuildContext context, String routeName, {Object? arguments}) {
    Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false, arguments: arguments);
  }

  // Navegar a una nueva pantalla eliminando parte del historial de navegación
  static void navigateAndRemoveUntil(BuildContext context, String routeName, String removeUntilRoute, {Object? arguments}) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
      ModalRoute.withName(removeUntilRoute),
      arguments: arguments,
    );
  }
}