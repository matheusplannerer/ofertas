import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
import 'package:ofertas/app/shared/repositories/auth/repositories/auth_repository_interface.dart';

//Aqui é aonde acontecem as funções e o retorno dos dados esperados.
//Basicamente nesse repositório ocorre a lógica das funções unitárias
//Futuramente rodar testes unitários
//Testes unitários: Funções que nascem e morrem em determinado ponto sem dependência de widgets externos
class FirebaseAuthRepo implements IAuthRepository {
  @override
  Future<FirebaseUser> currentUser() async {
    try {
      var fbUser = await FirebaseAuth.instance.currentUser();
      if (fbUser == null) throw null;
      return fbUser;
    } catch (e) {
      return throw e;
    }
  }

  @override
  Future<UserModel> getUserInfos(String uid) async {
    try {
      var userDoc =
          await Firestore.instance.collection('usuarios').document(uid).get();
      if (!userDoc.exists)
        throw PlatformException(code: 'ERROR_USER_NOT_FOUND');
      UserModel user = UserModel.fromJson(userDoc.data);
      return user;
    } catch (e) {
      return throw e;
    }
  }

  @override
  Future<FirebaseUser> signInWithEmailAndPass(String email, String pass) async {
    try {
      var fbUser = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      return fbUser.user;
    } catch (e) {
      return throw e;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      return throw e;
    }
  }

  @override
  Future<FirebaseUser> signInGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount googleUser;
    try {
      googleUser = await _googleSignIn.signIn();
    } catch (e) {
      print("FAILED AQUI");
      print(e);
      return throw e;
    }

    try {
      var userDoc = await Firestore.instance
          .collection('usuarios')
          .where('email', isEqualTo: googleUser.email)
          .getDocuments();
      if (userDoc.documents.isEmpty)
        return throw PlatformException(code: "ERROR_USER_NOT_FOUND");
    } catch (e) {
      return throw e;
    }

    AuthCredential credential;
    try {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
    } catch (e) {
      return throw e;
    }
    FirebaseUser _authInfos;
    try {
      _authInfos = await signInWithCredential(credential);
    } catch (e) {
      return throw e;
    }

    try {
      await getUserInfos(_authInfos.uid);
      return _authInfos;
    } catch (e) {
      if (e.code != "ERROR_USER_NOT_FOUND") return throw e;
      var id = Firestore.instance.collection('usuarios').document().documentID;
      UserModel _userModel = UserModel(
        celular: _authInfos.phoneNumber,
        email: _authInfos.email,
        empresaPerfil: null,
        nome: _authInfos.displayName,
        id: id,
      );
      await Firestore.instance
          .collection('usuarios')
          .document(id)
          .setData(_userModel.toJson());
      return _authInfos;
    }
  }

  @override
  Future<FirebaseUser> signInWithCredential(AuthCredential credential) async {
    try {
      var _authInfos =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return _authInfos.user;
    } catch (e) {
      return throw null;
    }
  }
}
