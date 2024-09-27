import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:konsi/src/pages/home_page/home_controller.dart';
import 'package:konsi/src/pages/home_page/home_page.dart';
import 'package:konsi/src/pages/passbook_page/passbook_page.dart';
import 'package:mobx/mobx.dart';
part 'bottom_navigation_bar_controller.g.dart';

// ignore: library_private_types_in_public_api
class BottomNavigationBarController = _BottomNavigationBarControllerBase
    with _$BottomNavigationBarController;

abstract class _BottomNavigationBarControllerBase with Store {
  final HomeController homeController;
  _BottomNavigationBarControllerBase(this.homeController);

  @observable
  int selectedIndex = 0;

  @action
  void changeIndex(int index) {
    selectedIndex = index;
  }

  final List<Widget> pages = [
    const HomePage(),
    PassbookPage(),
  ];

  void onItemTapped(int index) {
    selectedIndex = index;
  }

  @computed
  Position? get currentPosition => homeController.currentPosition;
}
