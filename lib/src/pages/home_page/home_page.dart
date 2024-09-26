import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:konsi/src/pages/home_page/home_controller.dart';
import 'package:konsi/src/pages/home_page/widgets/loading_page_widget.dart';
import 'package:konsi/src/pages/home_page/widgets/search_bar_widget.dart';
import 'package:konsi/src/pages/home_page/widgets/suggestion_cep_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    homeController.fetchCurrentLocation();
    return Scaffold(
      backgroundColor: const Color(0xff2E8896),
      body: Stack(
        children: [
          Observer(
            builder: (_) {
              if (homeController.errorMessage != null) {
                return Center(
                    child: Text('Erro: ${homeController.errorMessage}'));
              } else if (homeController.currentPosition == null) {
                return const LoadingPageWidget();
              } else {
                return GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    // Armazene o controlador para uso posterior
                    homeController.mapController = controller;
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      homeController.currentPosition!.latitude,
                      homeController.currentPosition!.longitude,
                    ),
                    zoom: 15,
                  ),
                  markers: {
                    Marker(
                      markerId: const MarkerId('currentLocation'),
                      position: LatLng(
                        homeController.currentPosition!.latitude,
                        homeController.currentPosition!.longitude,
                      ),
                    ),
                    if (homeController.coordinates != null)
                      Marker(
                        markerId: const MarkerId('searchedLocation'),
                        position: LatLng(
                          homeController.coordinates!['lat'],
                          homeController.coordinates!['lng'],
                        ),
                      )
                  },
                );
              }
            },
          ),
          Observer(builder: (_) {
            return Visibility(
              visible: homeController.currentPosition != null,
              child: Positioned(
                top: 50,
                left: 16,
                right: 16,
                child: SearchBarWidget(
                  onChanged: homeController.updateSearchText,
                ),
              ),
            );
          }),
          Observer(builder: (_) {
            return Visibility(
              visible: homeController.searchText != '',
              child: Positioned(
                top: 120,
                left: 16,
                right: 16,
                child: SuggestionCepListWidget(homeController: homeController),
              ),
            );
          })
        ],
      ),
      bottomNavigationBar: Observer(
        builder: (_) {
          return Visibility(
            visible: homeController.currentPosition != null,
            child: BottomNavigationBar(
              onTap: (index) {},
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
            ),
          );
        },
      ),
    );
  }
}
