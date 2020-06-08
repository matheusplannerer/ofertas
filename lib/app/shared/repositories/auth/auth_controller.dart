import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/pages/splash/splash_controller.dart';
import 'package:ofertas/app/shared/models/planos_model.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
import 'package:ofertas/app/shared/repositories/auth/repositories/auth_repository_interface.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  IAuthRepository _auth = Modular.get();

  _AuthControllerBase() {
    currentUser()
        .then(setAuthInfos)
        .then((_) => getUserInfos(authInfos.uid)
            .then(setUserInfos)
            .then((_) => setStatus(AuthStatus.signedIn)))
        .catchError((_) {});
  }

  @observable
  FirebaseUser _authInfos;
  @observable
  UserModel _userInfos;
  @observable
  AuthStatus _status = AuthStatus.loading;
  @observable
  PlanosModel _plano;

  @computed
  FirebaseUser get authInfos => _authInfos;
  @computed
  UserModel get userInfos => _userInfos;
  @computed
  PlanosModel get plano => _plano;
  @computed
  AuthStatus get status {
    if (_status != AuthStatus.signedIn) {
      _authInfos = null;
      _userInfos = null;
    }
    return _status;
  }

  @action
  void setStatus(AuthStatus value) => _status = value;
  @action
  void setAuthInfos(FirebaseUser value) => _authInfos = value;
  @action
  void setUserInfos(UserModel value) => _userInfos = value;

  @action
  Future<FirebaseUser> currentUser() async {
    try {
      var _authInfos = await _auth.currentUser();
      return _authInfos;
    } catch (e) {
      print("ENTROU AQUI");
      setStatus(AuthStatus.signedOff);
      return throw null;
    }
  }

  @action
  Future<FirebaseUser> signInWithEmailAndPass(String email, String pass) async {
    try {
      _authInfos = await _auth.signInWithEmailAndPass(email, pass);
      setStatus(AuthStatus.signedIn);
      return _authInfos;
    } catch (e) {
      return throw e;
    }
  }

  @action
  Future signOut() async {
    setStatus(AuthStatus.signedOff);
    setAuthInfos(null);
    setUserInfos(null);
    await _auth.signOut();
  }

  @action
  Future<FirebaseUser> signInGoogle() async {
    try {
      _authInfos = await _auth.signInGoogle();
      setStatus(AuthStatus.signedIn);
      return _authInfos;
    } catch (e) {
      return throw e;
    }
  }

  @action
  Future<PlanosModel> getUserPlano(UserModel user) async {
    try {
      _plano = await _auth.getUserPlano(user);
      return _plano;
    } catch (e) {
      return throw e;
    }
  }

  @action
  Future<UserModel> getUserInfos(String uid) async {
    try {
      _userInfos = await _auth.getUserInfos(uid);
      await getUserPlano(_userInfos);
      return _userInfos;
    } catch (e) {
      setStatus(AuthStatus.signedOff);
      return throw e;
    }
  }

  @action
  Future<void> updateFCMToken(UserModel user, String token) async {
    try {
      await _auth.updateFCMToken(user, token);
      return;
    } catch (e) {
      return throw e;
    }
  }
}
