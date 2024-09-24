import 'package:mobx/mobx.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStore with _$SplashStore;

abstract class _SplashStore with Store {
  @observable
  bool isLoading = true;

  @action
  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 3));
    isLoading = false;
  }
}
