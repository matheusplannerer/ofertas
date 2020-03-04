import 'package:mobx/mobx.dart';

part 'informacoes_upload_controller.g.dart';

class InformacoesUploadController = _InformacoesUploadBase
    with _$InformacoesUploadController;

abstract class _InformacoesUploadBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
