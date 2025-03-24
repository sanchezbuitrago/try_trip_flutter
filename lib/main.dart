// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:try_trip/core/services/routes.dart';
import 'features/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TryTrip',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
            onPrimary: Colors.white,
            onSecondary: Color(0xFF5F072B),
            secondary: Color(0xFFBEA6A1),
            primary: Color(0xFF5F072B)),
        useMaterial3: true,
      ),
      navigatorKey: AppRoutes.navigatorKey,
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.home,
    );
  }
}
