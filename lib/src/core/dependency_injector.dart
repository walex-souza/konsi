import 'package:get_it/get_it.dart';
import 'package:konsi/src/pages/bottom_navigation_bar_page/bottom_navigation_bar_controller.dart';
import 'package:konsi/src/pages/home_page/home_controller.dart';
import 'package:konsi/src/pages/passbook_page/passbook_controller.dart';
import 'package:konsi/src/pages/review_address_page/review_address_controller.dart';
import '../services/cep_service.dart';
import '../services/geocoding_service.dart';

final GetIt getIt = GetIt.instance;

class DependencyInjector {
  void setup() {
    getIt.registerLazySingleton<CepService>(() => CepService());
    getIt.registerLazySingleton<GeocodingService>(() => GeocodingService());

    getIt.registerLazySingleton<HomeController>(() => HomeController());
    getIt.registerLazySingleton<BottomNavigationBarController>(
        () => BottomNavigationBarController(getIt<HomeController>()));
    getIt.registerLazySingleton<ReviewAddressController>(
        () => ReviewAddressController());
    getIt.registerLazySingleton<PassbookController>(() => PassbookController());
  }
}
