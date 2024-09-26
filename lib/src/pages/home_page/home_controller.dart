import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:konsi/src/models/address_model.dart';
import 'package:konsi/src/services/cep_service.dart';
import 'package:konsi/src/services/geocoding_service.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final CepService _cepService = GetIt.I<CepService>();
  final GeocodingService geocodingService = GetIt.I<GeocodingService>();

  @observable
  String searchText = '';

  @observable
  AddressModel? address;

  @observable
  AddressModel? currentAddress;

  @observable
  String? error;

  @observable
  bool searchCepError = false;

  @observable
  Map<String, dynamic>? coordinates;

  @observable
  ObservableList<AddressModel> suggestions = ObservableList<AddressModel>();

  // List<AddressModel> ceps = [];

  @observable
  Position? currentPosition;

  @observable
  String? errorMessage;

  @observable
  GoogleMapController? mapController;

  @observable
  int selectedIndex = 0;

  @action
  void changeIndex(int index) {
    selectedIndex = index;
  }

  @action
  Future<void> fetchCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        errorMessage = 'O serviço de localização está desativado.';
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          errorMessage = 'Permissão de localização negada.';
          return;
        }
      }

      const LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );

      currentPosition = await Geolocator.getCurrentPosition(
          locationSettings: locationSettings);
      errorMessage = null;
    } catch (e) {
      errorMessage = 'Erro ao obter localização: $e';
    }
  }

  @action
  void updateSearchText(String? value) {
    searchText = value ?? '';
    if (!searchText.contains('-') && searchText.length == 8) {
      String? modified = "${value!.substring(0, 5)}-${value.substring(5)}";
      searchCep(modified);
    } else {
      searchCep(value ?? '');
    }
  }

  @action
  Future<void> searchCep(String cep) async {
    error = null; // Reseta o erro
    address = await _cepService.searchCep(cep);
    if (address == null) {
      error = 'CEP não encontrado.';
      searchCepError = true;
    } else {
      if (!suggestions.any((e) => e.cep == cep)) {
        suggestions.add(
          AddressModel(
              cep: address?.cep ?? '',
              logradouro: address?.logradouro ?? '',
              bairro: address?.bairro ?? '',
              localidade: address?.localidade ?? '',
              uf: address?.uf ?? ''),
        );
      }
      searchCepError = false;
      await getCoordinates(address!.formattedAddress);
    }
  }

  @action
  Future<void> getCoordinates(String address) async {
    coordinates = await geocodingService.getCoordinatesFromAddress(address);
  }

  @action
  void moveCameraToCoordinates(GoogleMapController mapController) {
    if (coordinates != null) {
      mapController.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(coordinates!['lat'], coordinates!['lng']),
        ),
      );
    }
  }

  Future<AddressModel?> fetchAddressFromCoordinates(
      double latitude, double longitude) async {
    AddressModel? address =
        await geocodingService.getLatLngToAddress(latitude, longitude);
    if (address != null) {
      return address;
    } else {
      print('Endereço não encontrado.');
    }
    return null;
  }
}
