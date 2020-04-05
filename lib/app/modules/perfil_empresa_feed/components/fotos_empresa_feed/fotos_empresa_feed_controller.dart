import 'package:mobx/mobx.dart';

part 'fotos_empresa_feed_controller.g.dart';

class FotosEmpresaFeedController = _FotosEmpresaFeedControllerBase
    with _$FotosEmpresaFeedController;

abstract class _FotosEmpresaFeedControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
