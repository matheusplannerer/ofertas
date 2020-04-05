// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
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
  Computed<AuthStatus> _$statusComputed;

  @override
  AuthStatus get status =>
      (_$statusComputed ??= Computed<AuthStatus>(() => super.status)).value;

  final _$_authInfosAtom = Atom(name: '_AuthControllerBase._authInfos');

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

  final _$_userInfosAtom = Atom(name: '_AuthControllerBase._userInfos');

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

  final _$_statusAtom = Atom(name: '_AuthControllerBase._status');

  @override
  AuthStatus get _status {
    _$_statusAtom.context.enforceReadPolicy(_$_statusAtom);
    _$_statusAtom.reportObserved();
    return super._status;
  }

  @override
  set _status(AuthStatus value) {
    _$_statusAtom.context.conditionallyRunInAction(() {
      super._status = value;
      _$_statusAtom.reportChanged();
    }, _$_statusAtom, name: '${_$_statusAtom.name}_set');
  }

  final _$currentUserAsyncAction = AsyncAction('currentUser');

  @override
  Future<FirebaseUser> currentUser() {
    return _$currentUserAsyncAction.run(() => super.currentUser());
  }

  final _$signInWithEmailAndPassAsyncAction =
      AsyncAction('signInWithEmailAndPass');

  @override
  Future<FirebaseUser> signInWithEmailAndPass(String email, String pass) {
    return _$signInWithEmailAndPassAsyncAction
        .run(() => super.signInWithEmailAndPass(email, pass));
  }

  final _$signOutAsyncAction = AsyncAction('signOut');

  @override
  Future<dynamic> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  final _$signInGoogleAsyncAction = AsyncAction('signInGoogle');

  @override
  Future<FirebaseUser> signInGoogle() {
    return _$signInGoogleAsyncAction.run(() => super.signInGoogle());
  }

  final _$getUserInfosAsyncAction = AsyncAction('getUserInfos');

  @override
  Future<UserModel> getUserInfos(String uid) {
    return _$getUserInfosAsyncAction.run(() => super.getUserInfos(uid));
  }

  final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase');

  @override
  void setStatus(AuthStatus value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction();
    try {
      return super.setStatus(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAuthInfos(FirebaseUser value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction();
    try {
      return super.setAuthInfos(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserInfos(UserModel value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction();
    try {
      return super.setUserInfos(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'authInfos: ${authInfos.toString()},userInfos: ${userInfos.toString()},status: ${status.toString()}';
    return '{$string}';
  }
}
