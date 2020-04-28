import 'package:mobx/mobx.dart';

part 'boleto_controller.g.dart';

class BoletoController = _BoletoControllerBase with _$BoletoController;

abstract class _BoletoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
