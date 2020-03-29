import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:ofertas/app/shared/models/user_model.dart';

class GlobalService extends Disposable {
  GlobalService([this._empresaLogada]);

  PerfilEmpresaModel _empresaLogada;

  // GlobalKey<NavigatorState> navigatorKeyFeed = GlobalKey<NavigatorState>();
  // GlobalKey<NavigatorState> navigatorKeyPerfil = GlobalKey<NavigatorState>();

  PerfilEmpresaModel get empresaLogada => _empresaLogada;

  void setEmpresaLogada(PerfilEmpresaModel model) {
    _empresaLogada = model;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
