import 'package:flutter/material.dart';
import 'package:konsi/app_widget.dart';
import 'package:konsi/src/core/dependency_Injector.dart';

void main() async {
  DependencyInjector().setup();
  WidgetsFlutterBinding.ensureInitialized();
  // await FlutterConfig.loadEnvVariables();
  runApp(const AppWidget());
}
