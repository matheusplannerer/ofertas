import 'package:mobx/mobx.dart';

part 'nova_empresa_controller.g.dart';

class NovaEmpresaController = _NovaEmpresaBase with _$NovaEmpresaController;

abstract class _NovaEmpresaBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
