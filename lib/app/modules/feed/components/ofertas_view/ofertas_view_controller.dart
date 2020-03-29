import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/repositories/routes/route_controller.dart';

part 'ofertas_view_controller.g.dart';

class OfertasViewController = _OfertasViewBase with _$OfertasViewController;

abstract class _OfertasViewBase with Store {
  RouteController routeController = Modular.get();

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
