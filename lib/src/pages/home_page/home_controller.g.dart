// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$searchTextAtom =
      Atom(name: 'HomeControllerBase.searchText', context: context);

  @override
  String get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  late final _$addressAtom =
      Atom(name: 'HomeControllerBase.address', context: context);

  @override
  AddressModel? get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(AddressModel? value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$currentAddressAtom =
      Atom(name: 'HomeControllerBase.currentAddress', context: context);

  @override
  AddressModel? get currentAddress {
    _$currentAddressAtom.reportRead();
    return super.currentAddress;
  }

  @override
  set currentAddress(AddressModel? value) {
    _$currentAddressAtom.reportWrite(value, super.currentAddress, () {
      super.currentAddress = value;
    });
  }

  late final _$errorAtom =
      Atom(name: 'HomeControllerBase.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$searchCepErrorAtom =
      Atom(name: 'HomeControllerBase.searchCepError', context: context);

  @override
  bool get searchCepError {
    _$searchCepErrorAtom.reportRead();
    return super.searchCepError;
  }

  @override
  set searchCepError(bool value) {
    _$searchCepErrorAtom.reportWrite(value, super.searchCepError, () {
      super.searchCepError = value;
    });
  }

  late final _$coordinatesAtom =
      Atom(name: 'HomeControllerBase.coordinates', context: context);

  @override
  Map<String, dynamic>? get coordinates {
    _$coordinatesAtom.reportRead();
    return super.coordinates;
  }

  @override
  set coordinates(Map<String, dynamic>? value) {
    _$coordinatesAtom.reportWrite(value, super.coordinates, () {
      super.coordinates = value;
    });
  }

  late final _$suggestionsAtom =
      Atom(name: 'HomeControllerBase.suggestions', context: context);

  @override
  ObservableList<AddressModel> get suggestions {
    _$suggestionsAtom.reportRead();
    return super.suggestions;
  }

  @override
  set suggestions(ObservableList<AddressModel> value) {
    _$suggestionsAtom.reportWrite(value, super.suggestions, () {
      super.suggestions = value;
    });
  }

  late final _$currentPositionAtom =
      Atom(name: 'HomeControllerBase.currentPosition', context: context);

  @override
  Position? get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(Position? value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'HomeControllerBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$mapControllerAtom =
      Atom(name: 'HomeControllerBase.mapController', context: context);

  @override
  GoogleMapController? get mapController {
    _$mapControllerAtom.reportRead();
    return super.mapController;
  }

  @override
  set mapController(GoogleMapController? value) {
    _$mapControllerAtom.reportWrite(value, super.mapController, () {
      super.mapController = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: 'HomeControllerBase.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$fetchCurrentLocationAsyncAction =
      AsyncAction('HomeControllerBase.fetchCurrentLocation', context: context);

  @override
  Future<void> fetchCurrentLocation() {
    return _$fetchCurrentLocationAsyncAction
        .run(() => super.fetchCurrentLocation());
  }

  late final _$searchCepAsyncAction =
      AsyncAction('HomeControllerBase.searchCep', context: context);

  @override
  Future<void> searchCep(String cep) {
    return _$searchCepAsyncAction.run(() => super.searchCep(cep));
  }

  late final _$getCoordinatesAsyncAction =
      AsyncAction('HomeControllerBase.getCoordinates', context: context);

  @override
  Future<void> getCoordinates(String address) {
    return _$getCoordinatesAsyncAction.run(() => super.getCoordinates(address));
  }

  late final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase', context: context);

  @override
  void changeIndex(int index) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.changeIndex');
    try {
      return super.changeIndex(index);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSearchText(String? value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.updateSearchText');
    try {
      return super.updateSearchText(value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void moveCameraToCoordinates(GoogleMapController mapController) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.moveCameraToCoordinates');
    try {
      return super.moveCameraToCoordinates(mapController);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchText: ${searchText},
address: ${address},
currentAddress: ${currentAddress},
error: ${error},
searchCepError: ${searchCepError},
coordinates: ${coordinates},
suggestions: ${suggestions},
currentPosition: ${currentPosition},
errorMessage: ${errorMessage},
mapController: ${mapController},
selectedIndex: ${selectedIndex}
    ''';
  }
}
