import 'package:mobx/mobx.dart';

part 'informacoes_cartaz_controller.g.dart';

class InformacoesCartazController = _InformacoesCartazBase
    with _$InformacoesCartazController;

abstract class _InformacoesCartazBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
