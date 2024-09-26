import 'package:geocoding/geocoding.dart';

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
}
