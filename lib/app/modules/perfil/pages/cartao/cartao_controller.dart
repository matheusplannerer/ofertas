import 'package:mobx/mobx.dart';

part 'cartao_controller.g.dart';

class CartaoController = _CartaoControllerBase with _$CartaoController;

abstract class _CartaoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
