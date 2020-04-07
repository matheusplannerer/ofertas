import 'package:mobx/mobx.dart';

part 'edit_infos_controller.g.dart';

class EditInfosController = _EditInfosControllerBase with _$EditInfosController;

abstract class _EditInfosControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
