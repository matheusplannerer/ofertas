import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  _AuthControllerBase() {
    // _authRepository
    //     .getUser()
    //     .then(setFbUser)
    //     .then(_authRepository.getUserInfos)
    //     .then((data) {
    //   UserModel aux = UserModel.fromJson(data.data);
    //   setUser(aux);
    // }).then((data) {
    //   if (fbUser != null && user != null)
    //     _updateStatus(AuthStatus.loggedIn);
    //   else
    //     _updateStatus(AuthStatus.loggedOff);
    // }).catchError((e) {
    //   _updateStatus(AuthStatus.error);
    //   print("ERRO");
    // });
  }

  @action
  Future<FirebaseUser> currentUser() => FirebaseAuth.instance.currentUser();

  @action
  Future<FirebaseUser> signInWithEmailAndPass(String email, String pass) =>
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);

  @action
  Future signOut() => FirebaseAuth.instance.signOut();

  @action
  Future<UserModel> getUserInfos(FirebaseUser fbUser) async {
    var userDoc = await Firestore.instance
        .collection('usuarios')
        .document(fbUser.uid)
        .get();
    if (!userDoc.exists) return null;
    UserModel user = UserModel.fromJson(userDoc.data);
    return user;
    // return
  }

  @action
  Future<FirebaseUser> signInWithCredential(AuthCredential credential) =>
      FirebaseAuth.instance.signInWithCredential(credential);
}
