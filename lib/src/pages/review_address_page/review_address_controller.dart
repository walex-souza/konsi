import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:konsi/src/models/address_model.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'review_address_controller.g.dart';

// ignore: library_private_types_in_public_api
class ReviewAddressController = _ReviewAddressControllerBase
    with _$ReviewAddressController;

abstract class _ReviewAddressControllerBase with Store {
  TextEditingController numberController = TextEditingController();
  TextEditingController complementController = TextEditingController();

  @action
  Future<void> saveAddress(AddressModel adress) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String addressJson = jsonEncode(adress.toJson());

    await prefs.setString('addressList', addressJson);
  }
}
