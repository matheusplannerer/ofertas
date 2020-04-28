import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
import 'package:ofertas/app/shared/repositories/sign_up_user/repositories/signup_user_repository_interface.dart';

class SignUpRepository implements ISignUpRepository {
  @override
  Future<AuthResult> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      var auth = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return auth;
    } catch (e) {
      return throw e;
    }
    // TODO: implement createUserWithEmailAndLink
  }

  @override
  createUserWithEmailAndLink() {
    // TODO: implement createUserWithEmailAndPassword
    // return FirebaseAuth.instance.;
  }

  @override
  createUserWithSMS() {
    // TODO: implement createUserWithSMS
    // return FirebaseAuth.instance;
  }

  @override
  Future createUserCollection(UserModel userModel) async {
    // TODO: implement createUserCollection
    try {
      userModel.planoId = Firestore.instance
          .collection('usuarios')
          .document(userModel.id)
          .collection('plano')
          .document()
          .documentID;
      await Firestore.instance
          .collection('usuarios')
          .document(userModel.id)
          .setData(userModel.toJson());
    } catch (e) {
      return throw e;
    }
  }

  @override
  Future<bool> validateVerificationID(String email, String id) async {
    try {
      var doc = await Firestore.instance
          .collection('solicitacoes_aceitas')
          .where('email', isEqualTo: email)
          .getDocuments();
      if (doc.documents.isEmpty || doc.documents.length > 1)
        throw PlatformException(code: "EMAIL_NOT_FOUND");

      var userDoc = await Firestore.instance
          .collection('usuarios')
          .where('email', isEqualTo: email)
          .getDocuments();

      if (userDoc.documents.length >= 1)
        throw PlatformException(code: "EMAIL_ALREADY_REGISTERED");

      if (doc.documents[0].data['verificationId'] == id) {
        return true;
      }
      return false;
    } catch (e) {
      return throw e;
    }
  }

  @override
  Future<void> updateSolicitacoesAceitas(
      UserModel user, String verificationID) async {
    try {
      var doc = await Firestore.instance
          .collection('solicitacoes_aceitas')
          .where('verificationId', isEqualTo: verificationID)
          .getDocuments();

      await Firestore.instance
          .collection('solicitacoes_aceitas')
          .document(doc.documents[0].documentID)
          .updateData({'nome': user.nome, 'email': user.email});
    } catch (e) {
      return throw e;
    }
  }
}
