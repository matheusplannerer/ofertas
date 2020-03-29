// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_bar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NavigationBarController on _NavigationBarBase, Store {
  Computed<bool> _$signedInComputed;

  @override
  bool get signedIn =>
      (_$signedInComputed ??= Computed<bool>(() => super.signedIn)).value;
  Computed<bool> _$hasCompanyComputed;

  @override
  bool get hasCompany =>
      (_$hasCompanyComputed ??= Computed<bool>(() => super.hasCompany)).value;
  Computed<UserModel> _$userModelComputed;

  @override
  UserModel get userModel =>
      (_$userModelComputed ??= Computed<UserModel>(() => super.userModel))
          .value;
  Computed<FirebaseUser> _$fbUserComputed;

  @override
  FirebaseUser get fbUser =>
      (_$fbUserComputed ??= Computed<FirebaseUser>(() => super.fbUser)).value;

  final _$_idEmpLogadaAtom = Atom(name: '_NavigationBarBase._idEmpLogada');

  @override
  String get _idEmpLogada {
    _$_idEmpLogadaAtom.context.enforceReadPolicy(_$_idEmpLogadaAtom);
    _$_idEmpLogadaAtom.reportObserved();
    return super._idEmpLogada;
  }

  @override
  set _idEmpLogada(String value) {
    _$_idEmpLogadaAtom.context.conditionallyRunInAction(() {
      super._idEmpLogada = value;
      _$_idEmpLogadaAtom.reportChanged();
    }, _$_idEmpLogadaAtom, name: '${_$_idEmpLogadaAtom.name}_set');
  }

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
    final string =
        'navIndex: ${navIndex.toString()},signedIn: ${signedIn.toString()},hasCompany: ${hasCompany.toString()},userModel: ${userModel.toString()},fbUser: ${fbUser.toString()}';
    return '{$string}';
  }
}
