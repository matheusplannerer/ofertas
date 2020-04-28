import 'package:mobx/mobx.dart';

part 'planos_controller.g.dart';

class PlanosController = _PlanosControllerBase with _$PlanosController;

abstract class _PlanosControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
