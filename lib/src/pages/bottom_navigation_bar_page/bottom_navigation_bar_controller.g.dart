// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_navigation_bar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BottomNavigationBarController
    on _BottomNavigationBarControllerBase, Store {
  Computed<Position?>? _$currentPositionComputed;

  @override
  Position? get currentPosition => (_$currentPositionComputed ??=
          Computed<Position?>(() => super.currentPosition,
              name: '_BottomNavigationBarControllerBase.currentPosition'))
      .value;

  late final _$selectedIndexAtom = Atom(
      name: '_BottomNavigationBarControllerBase.selectedIndex',
      context: context);

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

  late final _$_BottomNavigationBarControllerBaseActionController =
      ActionController(
          name: '_BottomNavigationBarControllerBase', context: context);

  @override
  void changeIndex(int index) {
    final _$actionInfo = _$_BottomNavigationBarControllerBaseActionController
        .startAction(name: '_BottomNavigationBarControllerBase.changeIndex');
    try {
      return super.changeIndex(index);
    } finally {
      _$_BottomNavigationBarControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex},
currentPosition: ${currentPosition}
    ''';
  }
}
