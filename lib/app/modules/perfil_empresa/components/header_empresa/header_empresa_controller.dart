import 'package:mobx/mobx.dart';

part 'header_empresa_controller.g.dart';

class HeaderEmpresaController = _HeaderEmpresaControllerBase
    with _$HeaderEmpresaController;

abstract class _HeaderEmpresaControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
