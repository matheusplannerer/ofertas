// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  final _$getUserInfosAsyncAction = AsyncAction('getUserInfos');

  @override
  Future<UserModel> getUserInfos(FirebaseUser fbUser) {
    return _$getUserInfosAsyncAction.run(() => super.getUserInfos(fbUser));
  }

  final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase');

  @override
  Future<FirebaseUser> currentUser() {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction();
    try {
      return super.currentUser();
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<FirebaseUser> signInWithEmailAndPass(String email, String pass) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction();
    try {
      return super.signInWithEmailAndPass(email, pass);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> signOut() {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction();
    try {
      return super.signOut();
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<FirebaseUser> signInWithCredential(AuthCredential credential) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction();
    try {
      return super.signInWithCredential(credential);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = '';
    return '{$string}';
  }
}
