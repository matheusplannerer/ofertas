import 'package:mobx/mobx.dart';

part 'feed_filtro_controller.g.dart';

class FeedFiltroController = _FeedFiltroControllerBase
    with _$FeedFiltroController;

abstract class _FeedFiltroControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
