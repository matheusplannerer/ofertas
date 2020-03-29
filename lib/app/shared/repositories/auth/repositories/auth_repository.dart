import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
import 'package:ofertas/app/shared/repositories/auth/repositories/auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<FirebaseUser> getUser() async {
    // TODO: implement getUser
    return FirebaseAuth.instance.currentUser();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    // TODO: implement sendEmailConfirm
    return FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  @override
  Future<FirebaseUser> signInEmailAndPassword(String email, String password) {
    // TODO: implement signInEmailAndPassword
    return FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<FirebaseUser> signInGoogle() async {
    // TODO: implement signInGoogle
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential));
    print("signed in " + user.displayName);
    return user;
  }

  @override
  Future signOut() async {
    // TODO: implement signOut
    return FirebaseAuth.instance.signOut();
  }

  @override
  Future signInToken() {
    // TODO: implement signInToken
    return null;
  }

  @override
  Future<UserModel> getUserInfos(FirebaseUser fbUser) async {
    // TODO: implement getUserInfos
    if (fbUser == null) return null;
    try {
      var doc = await Firestore.instance
          .collection('usuarios')
          .document(fbUser.uid)
          .get();
      UserModel user = UserModel.fromJson(doc.data);
      return user;
    } catch (e) {
      return null;
    }
  }
}
