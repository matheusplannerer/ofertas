import 'package:mobx/mobx.dart';

part 'concluir_publicacao_controller.g.dart';

class ConcluirPublicacaoController = _ConcluirPublicacaoBase
    with _$ConcluirPublicacaoController;

abstract class _ConcluirPublicacaoBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
