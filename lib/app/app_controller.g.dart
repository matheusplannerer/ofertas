// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppBase, Store {
  Computed<FirebaseUser> _$authInfosComputed;

  @override
  FirebaseUser get authInfos =>
      (_$authInfosComputed ??= Computed<FirebaseUser>(() => super.authInfos))
          .value;
  Computed<UserModel> _$userInfosComputed;

  @override
  UserModel get userInfos =>
      (_$userInfosComputed ??= Computed<UserModel>(() => super.userInfos))
          .value;
  Computed<bool> _$signedInComputed;

  @override
  bool get signedIn =>
      (_$signedInComputed ??= Computed<bool>(() => super.signedIn)).value;
  Computed<bool> _$hasCompanyComputed;

  @override
  bool get hasCompany =>
      (_$hasCompanyComputed ??= Computed<bool>(() => super.hasCompany)).value;
  Computed<AuthStatus> _$statusComputed;

  @override
  AuthStatus get status =>
      (_$statusComputed ??= Computed<AuthStatus>(() => super.status)).value;

  final _$_authInfosAtom = Atom(name: '_AppBase._authInfos');

  @override
  FirebaseUser get _authInfos {
    _$_authInfosAtom.context.enforceReadPolicy(_$_authInfosAtom);
    _$_authInfosAtom.reportObserved();
    return super._authInfos;
  }

  @override
  set _authInfos(FirebaseUser value) {
    _$_authInfosAtom.context.conditionallyRunInAction(() {
      super._authInfos = value;
      _$_authInfosAtom.reportChanged();
    }, _$_authInfosAtom, name: '${_$_authInfosAtom.name}_set');
  }

  final _$_userInfosAtom = Atom(name: '_AppBase._userInfos');

  @override
  UserModel get _userInfos {
    _$_userInfosAtom.context.enforceReadPolicy(_$_userInfosAtom);
    _$_userInfosAtom.reportObserved();
    return super._userInfos;
  }

  @override
  set _userInfos(UserModel value) {
    _$_userInfosAtom.context.conditionallyRunInAction(() {
      super._userInfos = value;
      _$_userInfosAtom.reportChanged();
    }, _$_userInfosAtom, name: '${_$_userInfosAtom.name}_set');
  }

  final _$signOutAsyncAction = AsyncAction('signOut');

  @override
  Future<dynamic> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  final _$_AppBaseActionController = ActionController(name: '_AppBase');

  @override
  void setAuth(FirebaseUser value) {
    final _$actionInfo = _$_AppBaseActionController.startAction();
    try {
      return super.setAuth(value);
    } finally {
      _$_AppBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUser(UserModel model) {
    final _$actionInfo = _$_AppBaseActionController.startAction();
    try {
      return super.setUser(model);
    } finally {
      _$_AppBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPages(List<RouterOutlet> list) {
    final _$actionInfo = _$_AppBaseActionController.startAction();
    try {
      return super.setPages(list);
    } finally {
      _$_AppBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'authInfos: ${authInfos.toString()},userInfos: ${userInfos.toString()},signedIn: ${signedIn.toString()},hasCompany: ${hasCompany.toString()},status: ${status.toString()}';
    return '{$string}';
  }
}
