import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
part 'route_controller.g.dart';

class RouteController = _RouteControllerBase with _$RouteController;

abstract class _RouteControllerBase with Store {
  GlobalKey<NavigatorState> _navigatorKeyTab1 = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> _navigatorKeyTab2 = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get keyTab1 => _navigatorKeyTab1;
  GlobalKey<NavigatorState> get keyTab2 => _navigatorKeyTab2;

  NavigatorState get tab1Nav => _navigatorKeyTab1.currentState;
  NavigatorState get tab2Nav => _navigatorKeyTab2.currentState;

  int _navIndex = 0;

  int get navIndex => _navIndex;
  void setNavIndexAtual(int index) {
    _navIndex = index;
  }

  GlobalKey<NavigatorState> get actualNavigator {
    if (_navIndex == 0) return _navigatorKeyTab1;
    if (_navIndex == 1) return _navigatorKeyTab2;
  }
}
