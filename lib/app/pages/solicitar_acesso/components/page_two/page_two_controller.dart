import 'package:mobx/mobx.dart';

part 'page_two_controller.g.dart';

class PageTwoController = _PageTwoControllerBase with _$PageTwoController;

abstract class _PageTwoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
