import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/repositories/routes/route_controller.dart';

part 'oferta_details_controller.g.dart';

class OfertaDetailsController = _OfertaDetailsBase
    with _$OfertaDetailsController;

abstract class _OfertaDetailsBase with Store {
  RouteController routeController = Modular.get();
}
