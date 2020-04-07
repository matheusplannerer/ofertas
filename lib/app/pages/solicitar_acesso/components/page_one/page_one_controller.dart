import 'package:mobx/mobx.dart';

part 'page_one_controller.g.dart';

class PageOneController = _PageOneControllerBase with _$PageOneController;

abstract class _PageOneControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
