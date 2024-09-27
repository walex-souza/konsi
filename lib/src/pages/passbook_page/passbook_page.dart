import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:konsi/src/pages/home_page/widgets/search_bar_widget.dart';
import 'package:konsi/src/pages/passbook_page/passbook_controller.dart';

class PassbookPage extends StatelessWidget {
  PassbookPage({super.key});
  final PassbookController passbookController = GetIt.I<PassbookController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.08,
          left: MediaQuery.of(context).size.width * 0.04,
          right: MediaQuery.of(context).size.width * 0.04,
        ),
        child: Column(
          children: [
            Observer(builder: (_) {
              return SearchBarWidget(
                textInputType: TextInputType.text,
                onChanged: passbookController.updateSearchText,
              );
            }),
            Expanded(
              child: FutureBuilder<void>(
                future: passbookController.loadAddressList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(
                        child: Text('Ocorreu um erro ao carregar os dados.'));
                  } else if (passbookController.addressList.isEmpty) {
                    return const Center(
                        child: Text('Nenhum endereço adicionado.'));
                  } else {
                    return Observer(
                      builder: (_) {
                        return ListView.separated(
                          itemCount:
                              passbookController.filteredAddressList.length,
                          itemBuilder: (context, index) {
                            final address =
                                passbookController.filteredAddressList[index];
                            return ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    address.cep,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '${address.logradouro} - '
                                    '${address.bairro}, '
                                    '${address.localidade} - '
                                    '${address.uf}',
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  color: Color(0xffF0F6F5),
                                ),
                                child: const Icon(
                                  Icons.turned_in,
                                  color: Color(0xff2E8896),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
