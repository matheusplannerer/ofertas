// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashController on _SplashControllerBase, Store {
  Computed<FirebaseUser> _$fbUserComputed;

  @override
  FirebaseUser get fbUser =>
      (_$fbUserComputed ??= Computed<FirebaseUser>(() => super.fbUser)).value;
  Computed<UserModel> _$userModelComputed;

  @override
  UserModel get userModel =>
      (_$userModelComputed ??= Computed<UserModel>(() => super.userModel))
          .value;

  final _$_fbUserAtom = Atom(name: '_SplashControllerBase._fbUser');

  @override
  FirebaseUser get _fbUser {
    _$_fbUserAtom.context.enforceReadPolicy(_$_fbUserAtom);
    _$_fbUserAtom.reportObserved();
    return super._fbUser;
  }

  @override
  set _fbUser(FirebaseUser value) {
    _$_fbUserAtom.context.conditionallyRunInAction(() {
      super._fbUser = value;
      _$_fbUserAtom.reportChanged();
    }, _$_fbUserAtom, name: '${_$_fbUserAtom.name}_set');
  }

  final _$_userModelAtom = Atom(name: '_SplashControllerBase._userModel');

  @override
  UserModel get _userModel {
    _$_userModelAtom.context.enforceReadPolicy(_$_userModelAtom);
    _$_userModelAtom.reportObserved();
    return super._userModel;
  }

  @override
  set _userModel(UserModel value) {
    _$_userModelAtom.context.conditionallyRunInAction(() {
      super._userModel = value;
      _$_userModelAtom.reportChanged();
    }, _$_userModelAtom, name: '${_$_userModelAtom.name}_set');
  }

  final _$statusAtom = Atom(name: '_SplashControllerBase.status');

  @override
  AuthStatus get status {
    _$statusAtom.context.enforceReadPolicy(_$statusAtom);
    _$statusAtom.reportObserved();
    return super.status;
  }

  @override
  set status(AuthStatus value) {
    _$statusAtom.context.conditionallyRunInAction(() {
      super.status = value;
      _$statusAtom.reportChanged();
    }, _$statusAtom, name: '${_$statusAtom.name}_set');
  }

  final _$_getFbUserAsyncAction = AsyncAction('_getFbUser');

  @override
  Future<FirebaseUser> _getFbUser() {
    return _$_getFbUserAsyncAction.run(() => super._getFbUser());
  }

  final _$_getUserAsyncAction = AsyncAction('_getUser');

  @override
  Future<DocumentSnapshot> _getUser() {
    return _$_getUserAsyncAction.run(() => super._getUser());
  }

  final _$setUserAsyncAction = AsyncAction('setUser');

  @override
  Future<void> setUser(DocumentSnapshot userDoc) {
    return _$setUserAsyncAction.run(() => super.setUser(userDoc));
  }

  final _$setFbUserAsyncAction = AsyncAction('setFbUser');

  @override
  Future<void> setFbUser(FirebaseUser value) {
    return _$setFbUserAsyncAction.run(() => super.setFbUser(value));
  }

  final _$_SplashControllerBaseActionController =
      ActionController(name: '_SplashControllerBase');

  @override
  void setStatus(AuthStatus auth) {
    final _$actionInfo = _$_SplashControllerBaseActionController.startAction();
    try {
      return super.setStatus(auth);
    } finally {
      _$_SplashControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'status: ${status.toString()},fbUser: ${fbUser.toString()},userModel: ${userModel.toString()}';
    return '{$string}';
  }
}
