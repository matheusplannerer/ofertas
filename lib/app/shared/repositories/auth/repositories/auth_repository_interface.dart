import 'package:firebase_auth/firebase_auth.dart';
import 'package:ofertas/app/shared/models/user_model.dart';

abstract class IAuthRepository {
  Future<FirebaseUser> currentUser();
  Future<FirebaseUser> signInWithEmailAndPass(String email, String pass);
  Future<void> signOut();
  Future<UserModel> getUserInfos(String uid);
  Future<FirebaseUser> signInGoogle();
  Future<FirebaseUser> signInWithCredential(AuthCredential credential);
}
