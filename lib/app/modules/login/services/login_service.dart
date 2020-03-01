import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:ofertas/app/shared/models/user_model.dart';

class LoginService extends Disposable {
  Future<PerfilEmpresaModel> getEmpresaLogada(UserModel model) async {
    if (model.empresaPerfil == '' || model.empresaPerfil != null) {
      try {
        var doc = await Firestore.instance
            .collection('empresas')
            .document(model.empresaPerfil)
            .get();
        PerfilEmpresaModel empresa =
            PerfilEmpresaModel.fromJson(doc.data, doc.documentID);
        return empresa;
      } catch (e) {
        return null;
      }
    }
  }

  Future<UserModel> getUser(FirebaseUser fbUser) async {
    try {
      var userDoc = await Firestore.instance
          .collection('usuarios')
          .document(fbUser.uid)
          .get();

      UserModel user = UserModel.fromJson(userDoc.data);
      return user;
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> signIn({String email, String senha}) async {
    try {
      // print(FirebaseAuth.instance);
      var data = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.toLowerCase(), password: senha);
      return data;
    } catch (e) {
      PlatformException erro = e;
      if (erro.code == "ERROR_WRONG_PASSWORD" ||
          erro.code == "ERROR_INVALID_EMAIL" ||
          erro.code == "ERROR_USER_NOT_FOUND") {
        return "E-mail ou senha inválidos";
      } else {
        return "Entre em contato com o suporte";
      }
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
