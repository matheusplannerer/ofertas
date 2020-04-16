import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:ofertas/app/app_controller.dart';
part 'route_controller.g.dart';

class RouteController = _RouteControllerBase with _$RouteController;

abstract class _RouteControllerBase with Store {
  GlobalKey<NavigatorState> _navigatorKeyTab1 = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> _navigatorKeyTab2 = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> _navigatorKeyTab3 = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get keyTab1 => _navigatorKeyTab1;
  GlobalKey<NavigatorState> get keyTab2 => _navigatorKeyTab2;
  GlobalKey<NavigatorState> get keyTab3 => _navigatorKeyTab3;

  NavigatorState get tab1Nav => _navigatorKeyTab1.currentState; //Feed
  NavigatorState get tab2Nav => _navigatorKeyTab2.currentState; //Perfil Empresa
  NavigatorState get tab3Nav =>
      _navigatorKeyTab3.currentState; //Pagina de categoria

  int _navIndex = 0;

  int get navIndex => _navIndex;
  void setNavIndexAtual(int index) {
    _navIndex = index;
  }

  GlobalKey<NavigatorState> get actualNavigator {
    if (_navIndex == 0) return _navigatorKeyTab1;
    if (_navIndex == 1) return _navigatorKeyTab2;
    if (_navIndex == 2) return _navigatorKeyTab3;
  }
}
