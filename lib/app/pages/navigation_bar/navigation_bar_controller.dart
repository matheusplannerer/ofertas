import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_module.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';
import 'package:ofertas/app/shared/repositories/routes/route_controller.dart';

part 'navigation_bar_controller.g.dart';

class NavigationBarController = _NavigationBarBase
    with _$NavigationBarController;

abstract class _NavigationBarBase with Store {
  RouteController routeController = Modular.get();
  AppController appController = Modular.get();

  _NavigationBarBase();

  @observable
  int navIndex = 0;

  @computed
  bool get hasCompany {
    if (!appController.signedIn) return false;
    if ((appController.userInfos.empresaPerfil != null &&
        appController.userInfos.empresaPerfil != '')) {
      return true;
    } else {
      return false;
    }
  }

  @action
  void setNavIndex(int value, bool signedIn) {
    if (navIndex == value) {
      routeController.actualNavigator.currentState
          .popUntil((Route<dynamic> route) => route.isFirst);
    }
    navIndex = value;

    routeController.setNavIndexAtual(value);
  }
}
