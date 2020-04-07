import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
import 'package:ofertas/app/shared/repositories/sign_up_user/repositories/signup_user_repository_interface.dart';

class SignUpRepository implements ISignUpRepository {
  @override
  Future<AuthResult> createUserWithEmailAndPassword(
      String email, String password) {
    // TODO: implement createUserWithEmailAndLink
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
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
      await Firestore.instance
          .collection('usuarios')
          .document(userModel.usuarioID)
          .setData(userModel.toJson());
    } catch (e) {}
  }
}
