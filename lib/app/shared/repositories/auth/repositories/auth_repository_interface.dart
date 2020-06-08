import 'package:firebase_auth/firebase_auth.dart';
import 'package:ofertas/app/shared/models/planos_model.dart';
import 'package:ofertas/app/shared/models/user_model.dart';

abstract class IAuthRepository {
  Future<FirebaseUser> currentUser();
  Future<FirebaseUser> signInWithEmailAndPass(String email, String pass);
  Future<void> signOut();
  Future<UserModel> getUserInfos(String uid);
  Future<FirebaseUser> signInGoogle();
  Future<FirebaseUser> signInWithCredential(AuthCredential credential);
  Future<PlanosModel> getUserPlano(UserModel user);
  Future<void> updateFCMToken(UserModel user, String token);
}
