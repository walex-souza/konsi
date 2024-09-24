import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:konsi/src/stores/splash_store.dart';

class SplashPage extends StatelessWidget {
  final SplashStore splashStore = SplashStore();

  SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    splashStore
        .loadData(); // Inicia o carregamento quando a página é construída

    return Scaffold(
      backgroundColor: const Color(0xff2E8896),
      body: Observer(
        builder: (_) {
          if (splashStore.isLoading) {
            return Center(
              child: Image.asset(
                'assets/splash.gif',
                height: 133,
                width: 133,
              ),
            );
          } else {
            // Navega para a página principal após o carregamento
            Future.microtask(() {
              Navigator.of(context).pushReplacementNamed('/home');
            });
            return Container(); // Retorna um container vazio enquanto navega
          }
        },
      ),
    );
  }
}
