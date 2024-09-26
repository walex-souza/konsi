import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
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
  final HomeController homeController = GetIt.I<HomeController>();

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
                      ),
                  },
                  onTap: (position) async {
                    var data = await homeController.fetchAddressFromCoordinates(
                        position.latitude, position.longitude);
                    _showBottomSheet(context, data);
                  },
                );
              }
            },
          ),
          Observer(builder: (_) {
            return Visibility(
              visible: homeController.suggestions.isNotEmpty &&
                  homeController.searchText != '',
              child: Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SuggestionCepListWidget(homeController: homeController),
              ),
            );
          }),
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
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context, data) {
    showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: SizedBox(
                  height: 4,
                  width: 32,
                  child: Divider(
                    color: Color(0xff5E6772),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.cep,
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 10),
                ],
              ),
              Wrap(
                children: [
                  Text(
                    '${data.logradouro} ',
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(
                    data.bairro != '' ? ' - ${data.bairro}, ' : '',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${data.localidade} - ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    data.uf,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Fecha o Bottom Sheet
                },
                child: const Text('Fechar'),
              ),
            ],
          ),
        );
      },
    );
  }
}
