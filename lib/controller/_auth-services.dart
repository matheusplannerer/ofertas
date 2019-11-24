import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {

  Future<FirebaseUser> login(String email, String senha) async {
    try {
      var data = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.toLowerCase(), password: senha);
      return data;
    } catch (e) {
      return null;
    }
  }

  Future<FirebaseUser> signUp(String email, String senha) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.toLowerCase(), password: senha);
      return data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool> recoveryPassword(String email) async {

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.toLowerCase());
      return true;
    } catch (e) {
      return false;
    }

  }

}
