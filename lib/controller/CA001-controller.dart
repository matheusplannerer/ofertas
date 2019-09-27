import 'package:firebase_auth/firebase_auth.dart';

class CA001Controller {
  
  Future<FirebaseUser> login(String email, String senha) async {
    
    try {
      var data = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: senha);
      return data;
    } catch (e) {
      return null;
    }
    
  }

  registrar(){
    
  }
}
