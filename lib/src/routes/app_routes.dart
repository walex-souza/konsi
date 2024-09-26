import 'package:flutter/material.dart';
import 'package:konsi/src/models/address_model.dart';
import 'package:konsi/src/pages/bottom_navigation_bar_page/bottom_navigation_bar_page.dart';
import 'package:konsi/src/pages/home_page/home_page.dart';
import 'package:konsi/src/pages/review_address_page/review_address_page.dart';

import 'package:konsi/src/routes/route_names.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.main:
        return MaterialPageRoute(builder: (_) => BottomNavigationBarPage());
      case RouteNames.reviewAddress:
        final AddressModel address = settings.arguments as AddressModel;
        return MaterialPageRoute(
            builder: (_) => ReviewAddressPage(
                  address: AddressModel(
                      cep: address.cep,
                      logradouro: address.logradouro,
                      bairro: address.bairro,
                      localidade: address.localidade,
                      uf: address.uf),
                ));
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
