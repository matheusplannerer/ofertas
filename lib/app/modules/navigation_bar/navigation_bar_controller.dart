import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/modules/login/login_page.dart';
import 'package:ofertas/app/modules/navigation_bar/components/feed/feed_page.dart';
import 'package:ofertas/app/modules/navigation_bar/components/perfil_empresa/perfil_empresa_page.dart';
import 'package:ofertas/app/shared/global_service.dart';

part 'navigation_bar_controller.g.dart';

class NavigationBarController = _NavigationBarBase
    with _$NavigationBarController;

abstract class _NavigationBarBase with Store {
  _NavigationBarBase();

  @observable
  int navIndex = 0;

  @action
  void setNavIndex(int value) {
    navIndex = value;
  }
}
