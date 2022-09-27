import '../screens/weather_screen.dart/weather_screen.dart';
import 'package:flutter/material.dart';


import '../../core/exceptions/route_exception.dart';


class AppRouter {
  static const String home = '/';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => WeatherScreen(),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
