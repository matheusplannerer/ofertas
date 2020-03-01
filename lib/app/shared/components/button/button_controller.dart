import 'package:mobx/mobx.dart';

part 'button_controller.g.dart';

class ButtonController = _ButtonBase with _$ButtonController;

abstract class _ButtonBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
