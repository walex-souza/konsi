import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:konsi/src/pages/bottom_navigation_bar_page/bottom_navigation_bar_controller.dart';

class BottomNavigationBarPage extends StatelessWidget {
  BottomNavigationBarPage({super.key});

  final BottomNavigationBarController bottomNavigationBarController =
      GetIt.instance<BottomNavigationBarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(builder: (_) {
      return bottomNavigationBarController
          .pages[bottomNavigationBarController.selectedIndex];
    }), bottomNavigationBar: Observer(builder: (_) {
      return Visibility(
        visible: bottomNavigationBarController.currentPosition != null,
        child: BottomNavigationBar(
          backgroundColor: const Color(0xffFBFBFB),
          currentIndex: bottomNavigationBarController.selectedIndex,
          selectedItemColor: const Color(0xff2E8896),
          unselectedItemColor: Colors.grey,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/maps_icon.png',
                height: 20,
                width: 20,
              ),
              label: 'Mapa',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/notebook_icon.png',
                height: 20,
                width: 20,
              ),
              label: 'Caderneta',
            ),
          ],
          onTap: bottomNavigationBarController.onItemTapped,
        ),
      );
    }));
  }
}
