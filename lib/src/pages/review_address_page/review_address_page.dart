import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:konsi/src/common/widgets/primaryButton_widget.dart';
import 'package:konsi/src/common/widgets/text_field_widget.dart';
import 'package:konsi/src/models/address_model.dart';
import 'package:konsi/src/pages/review_address_page/review_address_controller.dart';

class ReviewAddressPage extends StatelessWidget {
  final AddressModel? address;
  ReviewAddressPage({
    super.key,
    required this.address,
  });

  final ReviewAddressController reviewAddressController =
      GetIt.I<ReviewAddressController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(
        backgroundColor: const Color(0xffF6F6F6),
        title: const Text(
          'Revisão',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextFieldWidget(
                enabled: false,
                labelText: 'CEP',
                controller: TextEditingController(text: address?.cep)),
            const SizedBox(height: 20),
            TextFieldWidget(
              enabled: false,
              labelText: 'Endereço',
              controller: TextEditingController(
                text: '${address?.logradouro ?? ''} - '
                    '${address?.bairro}, '
                    '${address?.localidade} - '
                    '${address?.uf}',
              ),
            ),
            const SizedBox(height: 20),
            TextFieldWidget(
              textInputType: TextInputType.phone,
              enabled: true,
              labelText: 'Número',
              controller: reviewAddressController.numberController,
            ),
            const SizedBox(height: 20),
            TextFieldWidget(
              textInputType: TextInputType.name,
              enabled: true,
              labelText: 'Complemento',
              controller: reviewAddressController.complementController,
            ),
            const Spacer(),
            PrimaryButtonWidget(
              title: 'Confirmar',
              onPressed: () {
                reviewAddressController.saveAddress(
                  AddressModel(
                    cep: address?.cep ?? '',
                    logradouro: address?.logradouro ?? '',
                    bairro: address?.bairro ?? '',
                    localidade: address?.localidade ?? '',
                    uf: address?.uf ?? '',
                    number: reviewAddressController.numberController.text,
                    complement:
                        reviewAddressController.complementController.text,
                  ),
                );
              },
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
