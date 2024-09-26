import 'package:geocoding/geocoding.dart';
import 'package:konsi/src/models/address_model.dart';

class GeocodingService {
  Future<Map<String, dynamic>?> getCoordinatesFromAddress(
      String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);

      if (locations.isNotEmpty) {
        final location = locations.first;
        return {
          'lat': location.latitude,
          'lng': location.longitude,
        };
      }
    } catch (e) {
      print('Erro ao consultar coordenadas: $e');
    }
    return null;
  }

  Future<AddressModel?> getLatLngToAddress(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];

        return AddressModel(
          cep: placemark.postalCode ?? '',
          logradouro: placemark.street ?? '',
          bairro: placemark.subLocality ?? '',
          localidade: placemark.subAdministrativeArea ?? '',
          uf: placemark.administrativeArea ?? '',
        );
      }
    } catch (e) {
      print('Erro ao obter o endereço: $e');
    }

    return null;
  }
}
