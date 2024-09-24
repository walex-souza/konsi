import 'package:flutter/material.dart';
import 'package:konsi/src/pages/home_page/home_page.dart';
import 'package:konsi/src/pages/splash_page/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MobX Splash Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
