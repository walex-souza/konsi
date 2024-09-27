import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:konsi/src/common/widgets/primaryButton_widget.dart';
import 'package:konsi/src/models/address_model.dart';
import 'package:konsi/src/pages/home_page/home_controller.dart';
import 'package:konsi/src/pages/home_page/widgets/loading_page_widget.dart';
import 'package:konsi/src/pages/home_page/widgets/search_bar_widget.dart';
import 'package:konsi/src/pages/home_page/widgets/suggestion_cep_list_widget.dart';
import 'package:konsi/src/routes/route_names.dart';

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
                    if (mounted) {
                      // ignore: use_build_context_synchronously
                      _showBottomSheet(context, data);
                    }
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
      floatingActionButton: Observer(
        builder: (_) {
          return Visibility(
            visible: homeController.currentPosition != null,
            child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              backgroundColor: const Color(0xff2E8896),
              onPressed: () async {
                homeController.updateSearchText(homeController.searchText);

                if (homeController.searchCepError) {
                  showSnackbarSearchCepError(
                      context, 'O CEP informado não foi encontrado.');
                }
                homeController
                    .moveCameraToCoordinates(homeController.mapController!);
                homeController.searchText = '';
              },
              tooltip: 'Adicionar',
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          );
        },
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
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
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
              Center(
                child: PrimaryButtonWidget(
                  title: 'Salvar endereço',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.reviewAddress,
                      arguments: AddressModel(
                        cep: data.cep,
                        logradouro: data.logradouro,
                        bairro: data.bairro,
                        localidade: data.localidade,
                        uf: data.uf,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showSnackbarSearchCepError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xff2E8896),
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
