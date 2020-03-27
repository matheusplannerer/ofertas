import 'package:mobx/mobx.dart';

part 'ofertas_view_controller.g.dart';

class OfertasViewController = _OfertasViewBase with _$OfertasViewController;

abstract class _OfertasViewBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
