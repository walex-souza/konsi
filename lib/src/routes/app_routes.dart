import 'package:flutter/material.dart';
import 'package:konsi/src/pages/home_page/home_page.dart';
import 'package:konsi/src/pages/splash_page/splash_page.dart';
import 'package:konsi/src/routes/route_names.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => SplashPage());
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
