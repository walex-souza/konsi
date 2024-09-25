import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  @observable
  String searchText = '';

  @observable
  ObservableList<String> suggestions = ObservableList<String>();

  // Lista de CEPs estática, não precisa ser observável
  List<String> ceps = [
    '01000-000',
    '01001-000',
    '01002-000',
    '01003-000',
    '01004-000',
    '01005-000',
    '02000-000',
    '02001-000',
    '03000-000',
    '04000-000',
  ];

  @observable
  Position? currentPosition;

  @observable
  String? errorMessage;

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
    _filterSuggestionsCep();
  }

  @action
  void _filterSuggestionsCep() {
    if (searchText.isNotEmpty) {
      suggestions.clear(); // Limpa a lista antes de adicionar novos itens
      suggestions.addAll(
        ceps.where((cep) => cep.contains(searchText)).toList(),
      );
    } else {
      suggestions.clear(); // Limpa a lista se o campo de busca estiver vazio
    }
  }
}
