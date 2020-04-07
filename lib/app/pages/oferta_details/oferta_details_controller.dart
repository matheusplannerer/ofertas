import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';
import 'package:ofertas/app/shared/repositories/routes/route_controller.dart';

part 'oferta_details_controller.g.dart';

class OfertaDetailsController = _OfertaDetailsControllerBase
    with _$OfertaDetailsController;

abstract class _OfertaDetailsControllerBase with Store {
  RouteController routeController = Modular.get();

  @observable
  Future deleteImage(OfertaModel oferta) async {
    await Firestore.instance
        .collection('ofertas')
        .document(oferta.idOferta)
        .updateData({'mostrar': false});
    return true;
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}