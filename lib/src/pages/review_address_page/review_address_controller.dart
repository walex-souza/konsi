import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'review_address_controller.g.dart';

// ignore: library_private_types_in_public_api
class ReviewAddressController = _ReviewAddressControllerBase
    with _$ReviewAddressController;

abstract class _ReviewAddressControllerBase with Store {
  TextEditingController numberController = TextEditingController();
  TextEditingController complementController = TextEditingController();
}
