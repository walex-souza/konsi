import 'package:flutter/material.dart';
import 'package:konsi/src/pages/bottom_navigation_bar_page/bottom_navigation_bar_page.dart';
import 'package:konsi/src/pages/home_page/home_page.dart';

import 'package:konsi/src/routes/route_names.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.main:
        return MaterialPageRoute(builder: (_) => BottomNavigationBarPage());
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
