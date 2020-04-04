import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';
import 'package:ofertas/app/shared/repositories/routes/route_controller.dart';

part 'nova_empresa_controller.g.dart';

class NovaEmpresaController = _NovaEmpresaBase with _$NovaEmpresaController;

abstract class _NovaEmpresaBase with Store {
  RouteController routeController = Modular.get();
  AuthController authController = Modular.get();
  AppController appController = Modular.get();

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
