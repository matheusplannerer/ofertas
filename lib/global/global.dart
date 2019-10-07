import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class Global extends ChangeNotifier{

  Global();

  FirebaseUser fbUser;
}