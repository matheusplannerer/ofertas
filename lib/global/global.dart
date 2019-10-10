import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:ofertas/models/perfil_empresa.dart';

class Global extends ChangeNotifier {
  Global();

  FirebaseUser fbUser;
}
