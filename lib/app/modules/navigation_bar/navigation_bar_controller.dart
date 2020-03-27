import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/global_service.dart';

part 'navigation_bar_controller.g.dart';

class NavigationBarController = _NavigationBarBase
    with _$NavigationBarController;

abstract class _NavigationBarBase with Store {
  _NavigationBarBase();

  @observable
  String _idEmpLogada;

  @observable
  int navIndex = 0;

  @computed
  String get idEmpresaLogada => _idEmpLogada;

  // @action
  void setEmpresaLogada(String value) => _idEmpLogada = value;

  @action
  void setNavIndex(int value, GlobalService global) {
    navIndex = value;
    global.setNavIndexAtual(value);
  }
}
