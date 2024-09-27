// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passbook_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PassbookController on _PassbookControllerBase, Store {
  Computed<List<AddressModel>>? _$filteredAddressListComputed;

  @override
  List<AddressModel> get filteredAddressList =>
      (_$filteredAddressListComputed ??= Computed<List<AddressModel>>(
              () => super.filteredAddressList,
              name: '_PassbookControllerBase.filteredAddressList'))
          .value;

  late final _$addressListAtom =
      Atom(name: '_PassbookControllerBase.addressList', context: context);

  @override
  List<AddressModel> get addressList {
    _$addressListAtom.reportRead();
    return super.addressList;
  }

  @override
  set addressList(List<AddressModel> value) {
    _$addressListAtom.reportWrite(value, super.addressList, () {
      super.addressList = value;
    });
  }

  late final _$searchTextAtom =
      Atom(name: '_PassbookControllerBase.searchText', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: '_PassbookControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$loadAddressListAsyncAction =
      AsyncAction('_PassbookControllerBase.loadAddressList', context: context);

  @override
  Future<void> loadAddressList() {
    return _$loadAddressListAsyncAction.run(() => super.loadAddressList());
  }

  late final _$_PassbookControllerBaseActionController =
      ActionController(name: '_PassbookControllerBase', context: context);

  @override
  dynamic updateSearchText(String? value) {
    final _$actionInfo = _$_PassbookControllerBaseActionController.startAction(
        name: '_PassbookControllerBase.updateSearchText');
    try {
      return super.updateSearchText(value);
    } finally {
      _$_PassbookControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
addressList: ${addressList},
searchText: ${searchText},
isLoading: ${isLoading},
filteredAddressList: ${filteredAddressList}
    ''';
  }
}
