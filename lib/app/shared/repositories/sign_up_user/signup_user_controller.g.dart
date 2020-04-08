// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpController on _SignUpControllerBase, Store {
  final _$createUserWithEmailAndPasswordAsyncAction =
      AsyncAction('createUserWithEmailAndPassword');

  @override
  Future<FirebaseUser> createUserWithEmailAndPassword(UserModel model) {
    return _$createUserWithEmailAndPasswordAsyncAction
        .run(() => super.createUserWithEmailAndPassword(model));
  }

  final _$createUserCollectionAsyncAction = AsyncAction('createUserCollection');

  @override
  Future<dynamic> createUserCollection(UserModel model) {
    return _$createUserCollectionAsyncAction
        .run(() => super.createUserCollection(model));
  }

  @override
  String toString() {
    final string = '';
    return '{$string}';
  }
}
