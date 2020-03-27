import 'package:mobx/mobx.dart';

part 'oferta_details_controller.g.dart';

class OfertaDetailsController = _OfertaDetailsBase
    with _$OfertaDetailsController;

abstract class _OfertaDetailsBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
