import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';

part 'fotos_empresa_controller.g.dart';

class FotosEmpresaController = _FotosEmpresaControllerBase
    with _$FotosEmpresaController;

abstract class _FotosEmpresaControllerBase with Store {
  _FotosEmpresaControllerBase(this.empresa) {
    print("ENTREI CONSTRUTOR");
  }

  @observable
  PerfilEmpresaModel empresa;

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
