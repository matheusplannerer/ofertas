import 'package:mobx/mobx.dart';

part 'teste_controller.g.dart';

class TesteController = _TesteControllerBase with _$TesteController;

abstract class _TesteControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
