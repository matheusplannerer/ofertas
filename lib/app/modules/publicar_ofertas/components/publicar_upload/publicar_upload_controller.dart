import 'package:mobx/mobx.dart';
import 'dart:io';

part 'publicar_upload_controller.g.dart';

class PublicarUploadController = _PublicarUploadBase
    with _$PublicarUploadController;

abstract class _PublicarUploadBase with Store {
  @observable
  File imgFile;

  @action
  void updateImg(File value) {
    imgFile = value;
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
