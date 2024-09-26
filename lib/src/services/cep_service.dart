import '../models/address_model.dart';
import 'dio_service.dart';

class CepService {
  final DioService _dioService = DioService();

  Future<AddressModel?> searchCep(String cep) async {
    final formattedCep = cep.replaceAll(RegExp(r'[^0-9]'), '');

    try {
      final response = await _dioService.dio.get('$formattedCep/json/');
      if (response.statusCode == 200 && response.data != null) {
        if (response.data.containsKey('erro')) {
          return null;
        }
        return AddressModel.fromJson(response.data);
      }
    } catch (e) {
      print('Erro ao buscar o CEP: $e');
    }
    return null;
  }
}
