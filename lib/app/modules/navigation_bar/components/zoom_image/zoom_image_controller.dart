import 'package:mobx/mobx.dart';

part 'zoom_image_controller.g.dart';

class ZoomImageController = _ZoomImageBase with _$ZoomImageController;

abstract class _ZoomImageBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
