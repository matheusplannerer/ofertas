import 'package:mobx/mobx.dart';

part 'navigation_bar_controller.g.dart';

class NavigationBarController = _NavigationBarBase
    with _$NavigationBarController;

abstract class _NavigationBarBase with Store {
  @observable
  int navIndex = 0;

  @action
  void setNavIndex(int value) {
    navIndex = value;
  }
}
