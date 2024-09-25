import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:konsi/src/pages/home_page/home_controller.dart';

class SuggestionCepListWidget extends StatelessWidget {
  final HomeController homeController;
  const SuggestionCepListWidget({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            spreadRadius: 1,
            offset: Offset(0, 2), // posição da sombra
          ),
        ],
      ),
      child: Observer(
        builder: (_) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), // Evita rolagem
            itemCount: homeController.suggestions.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(homeController.suggestions[index]),
                onTap: () {
                  homeController.updateSearchText(homeController.suggestions[
                      index]); // Preenche o campo de texto com o CEP selecionado
                  homeController.suggestions.clear();
                },
              );
            },
          );
        },
      ),
    );
  }
}
