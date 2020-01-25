import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:ofertas/models/classes_usuarios.dart';

class AuthServices {
  Future<dynamic> login(String email, String senha) async {
    try {
      print(email);
      print(senha);
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

    // try {

    // var data = await FirebaseAuth.instance.signInWithEmailAndPassword(
    //     email: email.toLowerCase(), password: senha);

    //   return data;
    // } catch (e) {
    //   PlatformException erro = e;
    //   if (erro.code == "ERROR_WRONG_PASSWORD" ||
    //       erro.code == "ERROR_INVALID_EMAIL" ||
    //       erro.code == "ERROR_USER_NOT_FOUND") {
    //     return "E-mail ou senha inválidos";
    //   } else {
    //     return "Entre em contato com o suporte";
    //   }
    // }
  }

  Future<dynamic> signUp(String email, String senha, User user) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.toLowerCase(), password: senha);

      await Firestore.instance
          .collection('usuarios')
          .document(data.uid)
          .setData({
        "celular": user.celular,
        "email": user.email,
        "nome": user.nome,
        "id": data.uid,
        "empresaPerfil": '',
      });
      return data;
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
  }

  Future<bool> recoveryPassword(String email) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.toLowerCase());
      return true;
    } catch (e) {
      return false;
    }
  }
}
