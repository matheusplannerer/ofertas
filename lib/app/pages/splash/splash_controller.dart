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
  _SplashControllerBase() {
    _getFbUser().then(setFbUser).then((_) {
      if (status == AuthStatus.loading) _getUser().then(setUser).then((_) {});
    });
  }

  @observable
  FirebaseUser _fbUser;
  @observable
  UserModel _userModel;
  @observable
  AuthStatus status = AuthStatus.loading;

  @computed
  FirebaseUser get fbUser => _fbUser;
  @computed
  UserModel get userModel => _userModel;

  @action
  Future<FirebaseUser> _getFbUser() async {
    return FirebaseAuth.instance
        .currentUser()
        .timeout(Duration(seconds: 8), onTimeout: () => null);
  }

  @action
  Future<DocumentSnapshot> _getUser() async {
    return Firestore.instance.collection('usuarios').document(fbUser.uid).get();
  }

  @action
  Future<void> setUser(DocumentSnapshot userDoc) async {
    if (userDoc == null) {
      setStatus(AuthStatus.signedOff);
      return;
    }
    _userModel = UserModel.fromJson(userDoc.data);
    AppController appController = Modular.get();
    appController.signIn(_fbUser, _userModel);
    setStatus(AuthStatus.signedIn);
  }

  @action
  Future<void> setFbUser(FirebaseUser value) async {
    _fbUser = value;
    if (value == null) setStatus(AuthStatus.signedOff);
  }

  @action
  void setStatus(AuthStatus auth) => status = auth;
}

enum AuthStatus { signedOff, signedIn, loading, error }
