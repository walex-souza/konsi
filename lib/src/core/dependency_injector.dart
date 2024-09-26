import 'package:get_it/get_it.dart';
import 'package:konsi/src/pages/home_page/home_controller.dart';
import '../services/cep_service.dart';
import '../services/geocoding_service.dart';

final GetIt getIt = GetIt.instance; // Instância do GetIt

class DependencyInjector {
  // Método para configurar as dependências
  void setup() {
    // Registrar serviços
    getIt.registerLazySingleton<CepService>(() => CepService());
    getIt.registerLazySingleton<GeocodingService>(() => GeocodingService());

    // Registrar stores
    getIt.registerFactory<HomeController>(() => HomeController());
  }
}
