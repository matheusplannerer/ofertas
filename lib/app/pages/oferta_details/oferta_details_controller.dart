import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/repositories/routes/route_controller.dart';

part 'oferta_details_controller.g.dart';

class OfertaDetailsController = _OfertaDetailsControllerBase
    with _$OfertaDetailsController;

abstract class _OfertaDetailsControllerBase with Store {
  RouteController routeController = Modular.get();

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
