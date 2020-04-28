import 'package:mobx/mobx.dart';

part 'free_plan_controller.g.dart';

class FreePlanController = _FreePlanControllerBase with _$FreePlanController;

abstract class _FreePlanControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
