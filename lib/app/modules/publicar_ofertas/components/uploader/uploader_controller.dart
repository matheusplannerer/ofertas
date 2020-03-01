import 'package:mobx/mobx.dart';

part 'uploader_controller.g.dart';

class UploaderController = _UploaderBase with _$UploaderController;

abstract class _UploaderBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
