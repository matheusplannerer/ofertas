import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ofertas/app/shared/models/user_model.dart';

abstract class ISignUpRepository {
  Future<AuthResult> createUserWithEmailAndPassword(
      String email, String password);
  Future createUserCollection(UserModel userModel);
  createUserWithSMS();
  createUserWithEmailAndLink();
}
