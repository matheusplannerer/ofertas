// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_bar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NavigationBarController on _NavigationBarBase, Store {
  final _$navIndexAtom = Atom(name: '_NavigationBarBase.navIndex');

  @override
  int get navIndex {
    _$navIndexAtom.context.enforceReadPolicy(_$navIndexAtom);
    _$navIndexAtom.reportObserved();
    return super.navIndex;
  }

  @override
  set navIndex(int value) {
    _$navIndexAtom.context.conditionallyRunInAction(() {
      super.navIndex = value;
      _$navIndexAtom.reportChanged();
    }, _$navIndexAtom, name: '${_$navIndexAtom.name}_set');
  }

  final _$_NavigationBarBaseActionController =
      ActionController(name: '_NavigationBarBase');

  @override
  void setNavIndex(int value, GlobalService global) {
    final _$actionInfo = _$_NavigationBarBaseActionController.startAction();
    try {
      return super.setNavIndex(value, global);
    } finally {
      _$_NavigationBarBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'navIndex: ${navIndex.toString()}';
    return '{$string}';
  }
}
