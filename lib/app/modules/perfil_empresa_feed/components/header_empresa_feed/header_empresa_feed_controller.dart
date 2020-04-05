import 'package:mobx/mobx.dart';

part 'header_empresa_feed_controller.g.dart';

class HeaderEmpresaFeedController = _HeaderEmpresaFeedControllerBase
    with _$HeaderEmpresaFeedController;

abstract class _HeaderEmpresaFeedControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
