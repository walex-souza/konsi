import 'dart:convert';
import 'package:konsi/src/models/address_model.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'passbook_controller.g.dart';

// ignore: library_private_types_in_public_api
class PassbookController = _PassbookControllerBase with _$PassbookController;

abstract class _PassbookControllerBase with Store {
  @observable
  List<AddressModel> addressList = [];

  @observable
  String searchText = '';

  @observable
  bool isLoading = false;

  @computed
  List<AddressModel> get filteredAddressList {
    if (searchText.isEmpty) {
      return addressList;
    }
    return addressList
        .where(
          (address) =>
              address.cep.toLowerCase().contains(
                    searchText.toLowerCase(),
                  ) ||
              address.logradouro.toLowerCase().contains(
                    searchText.toLowerCase(),
                  ) ||
              address.bairro.toLowerCase().contains(
                    searchText.toLowerCase(),
                  ) ||
              address.localidade.toLowerCase().contains(
                    searchText.toLowerCase(),
                  ) ||
              address.uf.toLowerCase().contains(
                    searchText.toLowerCase(),
                  ),
        )
        .toList();
  }

  @action
  Future<void> loadAddressList() async {
    isLoading = true;
    final prefs = await SharedPreferences.getInstance();
    List<String>? jsonList = prefs.getStringList('addressList');
    if (jsonList != null) {
      addressList = jsonList
          .map((json) => AddressModel.fromJson(jsonDecode(json)))
          .toList();
    }
    isLoading = false;
  }

  @action
  updateSearchText(String? value) {
    searchText = value ?? '';
  }
}
