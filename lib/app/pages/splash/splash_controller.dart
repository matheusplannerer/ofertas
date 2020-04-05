import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  _SplashControllerBase();

  AuthController _auth = Modular.get();

  @computed
  AuthStatus get status => _auth.status;
  @computed
  FirebaseUser get authInfos => _auth.authInfos;
  @computed
  UserModel get userInfos => _auth.userInfos;
}

enum AuthStatus { signedOff, signedIn, loading, error }
