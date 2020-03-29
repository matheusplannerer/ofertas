import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_module.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';
import 'package:ofertas/app/shared/repositories/routes/route_controller.dart';

part 'navigation_bar_controller.g.dart';

class NavigationBarController = _NavigationBarBase
    with _$NavigationBarController;

abstract class _NavigationBarBase with Store {
  AuthController authController = Modular.get();
  RouteController routeController = Modular.get();

  _NavigationBarBase();

  @observable
  String _idEmpLogada;

  @observable
  int navIndex = 0;

  @computed
  bool get signedIn => authController.signedIn;

  @computed
  bool get hasCompany {
    if (!signedIn) return false;
    if ((authController.user.empresaPerfil != null &&
        authController.user.empresaPerfil != '')) {
      return true;
    } else {
      return false;
    }
  }

  @computed
  UserModel get userModel => authController.user;

  @computed
  FirebaseUser get fbUser => authController.fbUser;

  // @action
  void setEmpresaLogada(String value) => _idEmpLogada = value;

  @action
  void setNavIndex(int value, GlobalService global) {
    navIndex = value;
    routeController.setNavIndexAtual(value);
  }
}
