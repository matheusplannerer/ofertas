import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/shared/models/user_model.dart';

class AuthService extends Disposable {
  //dispose will be called automatically

  Future<dynamic> signUp(UserModel usuario) async {
    FirebaseUser fbUser;
    try {
      fbUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: usuario.email, password: usuario.senha);
      usuario.usuarioID = fbUser.uid;
    } catch (e) {
      PlatformException erro = e;
      print(e.toString());
      var data = await FirebaseAuth.instance.currentUser();
      if (data != null) data.delete();
      if (erro.code == "ERROR_EMAIL_ALREADY_IN_USE") {
        return "E-mail já cadastrado";
      }
      if (erro.code == "ERROR_INVALID_EMAIL") {
        return "E-mail inválido";
      } else {
        return "Um erro inesperado aconteceu, tente novamente!";
      }
    }

    try {
      await Firestore.instance
          .collection('usuarios')
          .document(fbUser.uid)
          .setData(usuario.toJson());
    } catch (e) {
      return null;
    }

    return fbUser;
  }

  @override
  void dispose() {}
}
