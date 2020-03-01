import 'package:mobx/mobx.dart';

part 'gradient_appbar_controller.g.dart';

class GradientAppbarController = _GradientAppbarBase
    with _$GradientAppbarController;

abstract class _GradientAppbarBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
