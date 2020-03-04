import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/modules/navigation_bar/components/feed/feed_page.dart';
import 'package:ofertas/app/modules/navigation_bar/components/perfil_empresa/perfil_empresa_page.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:ofertas/app/shared/models/user_model.dart';

class GlobalService extends Disposable {
  GlobalService([this._fbUser, this._usuario, this._empresaLogada]) {
    if (_fbUser is FirebaseUser && _usuario == null) {
      isLogged = true;
      Firestore.instance
          .collection('usuarios')
          .document(_fbUser.uid)
          .get()
          .then((data) {
        _usuario = UserModel.fromJson(data.data);
      });
    } else if (_usuario != null) {
      print(_usuario.nome);
      isLogged = true;
    }
  }

  FirebaseUser _fbUser;
  UserModel _usuario;
  PerfilEmpresaModel _empresaLogada;

  GlobalKey<NavigatorState> navigatorKeyFeed = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> navigatorKeyPerfil = GlobalKey<NavigatorState>();

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
