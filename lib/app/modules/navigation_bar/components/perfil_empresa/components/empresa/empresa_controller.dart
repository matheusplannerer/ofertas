import 'package:mobx/mobx.dart';

part 'empresa_controller.g.dart';

class EmpresaController = _EmpresaBase with _$EmpresaController;

abstract class _EmpresaBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
