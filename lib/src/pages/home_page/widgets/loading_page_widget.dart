import 'package:flutter/material.dart';

class LoadingPageWidget extends StatelessWidget {
  const LoadingPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/splash.gif',
        height: 133,
        width: 133,
      ),
    );
  }
}
