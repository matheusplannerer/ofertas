// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashController on _SplashControllerBase, Store {
  Computed<AuthStatus> _$statusComputed;

  @override
  AuthStatus get status =>
      (_$statusComputed ??= Computed<AuthStatus>(() => super.status)).value;
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

  @override
  String toString() {
    final string =
        'status: ${status.toString()},authInfos: ${authInfos.toString()},userInfos: ${userInfos.toString()}';
    return '{$string}';
  }
}
