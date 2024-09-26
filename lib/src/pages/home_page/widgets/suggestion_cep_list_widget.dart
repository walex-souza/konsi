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
        color: const Color(0xffF6F6F6),
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
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(
                top: 120, left: 15, right: 15, bottom: 10), // Evita rolagem
            itemCount: homeController.suggestions.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/cep_icon.png',
                          height: 40,
                          width: 40,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(homeController.suggestions[index].cep),
                              RichText(
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  text: homeController
                                              .suggestions[index].logradouro !=
                                          ''
                                      ? homeController
                                          .suggestions[index].logradouro
                                      : '',
                                  style: DefaultTextStyle.of(context).style,
                                  children: [
                                    TextSpan(
                                        text: homeController.suggestions[index]
                                                    .bairro !=
                                                ''
                                            ? ' - ${homeController.suggestions[index].bairro} - '
                                            : ''),
                                    TextSpan(
                                        text: homeController
                                            .suggestions[index].localidade),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                onTap: () async {
                  homeController
                      .updateSearchText(homeController.suggestions[index].cep);

                  await homeController
                      .searchCep(homeController.suggestions[index].cep);

                  homeController
                      .moveCameraToCoordinates(homeController.mapController!);

                  homeController.searchText = '';
                },
              );
            },
          );
        },
      ),
    );
  }
}
