import 'package:firebase_auth/firebase_auth.dart';
import 'package:ofertas/app/shared/models/user_model.dart';

abstract class IAuthRepository {
  Future<FirebaseUser> getUser();
  Future<FirebaseUser> signInEmailAndPassword(String email, String password);
  Future<FirebaseUser> signInGoogle();
  Future<UserModel> getUserInfos(FirebaseUser fbUser);
  Future signInToken();
  Future<void> signOut();
  Future<void> sendPasswordResetEmail(String email);
}
