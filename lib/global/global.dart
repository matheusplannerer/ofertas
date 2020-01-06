import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:ofertas/models/classes_usuarios.dart';
import 'package:ofertas/models/empresa.dart';

class Global extends ChangeNotifier {
  Global({this.fbUser});

  User usuario = User();

  PerfilEmpresa empresa = PerfilEmpresa();

  Empresa empresaLogada = Empresa();

  FirebaseUser fbUser;

  bool isEmpresa = false;

}
