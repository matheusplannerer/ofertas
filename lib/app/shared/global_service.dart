import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:ofertas/app/shared/models/user_model.dart';

class GlobalService extends Disposable {
  GlobalService([this._fbUser, this._usuario, this._empresaLogada]) {
    if (_fbUser is FirebaseUser) {
      isLogged = true;
      Firestore.instance
          .collection('usuarios')
          .document(_fbUser.uid)
          .get()
          .then((data) {
        _usuario = UserModel.fromJson(data.data);
      });
    }
  }

  FirebaseUser _fbUser;
  UserModel _usuario;
  PerfilEmpresaModel _empresaLogada;

  FirebaseUser get fbUser => _fbUser;
  UserModel get usuario => _usuario;
  PerfilEmpresaModel get empresaLogada => _empresaLogada;

  bool isLogged = false;

  void signIn({FirebaseUser fire, UserModel user}) {
    _fbUser = fire;
    _usuario = user;
    isLogged = true;
  }

  void signOut() {
    _fbUser = null;
    _usuario = null;
    isLogged = false;
  }

  void setEmpresaLogada(PerfilEmpresaModel model) {
    _empresaLogada = model;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
