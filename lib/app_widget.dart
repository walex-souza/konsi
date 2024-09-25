import 'package:flutter/material.dart';
import 'package:konsi/src/routes/app_routes.dart';
import 'package:konsi/src/routes/route_names.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteNames.main,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
