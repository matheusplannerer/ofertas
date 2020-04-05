import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:ofertas/app/shared/repositories/routes/route_controller.dart';

part 'empresas_view_controller.g.dart';

class EmpresasViewController = _EmpresasViewBase with _$EmpresasViewController;

abstract class _EmpresasViewBase with Store {
  RouteController routeController = Modular.get();

  _EmpresasViewBase({this.empresa});

  bool get hasMore => _hasMore;

  int _queryLimit = 12;
  DocumentSnapshot _lastDocument;
  bool _hasMore = true;
  PerfilEmpresaModel empresa;

  void setEmpresa(PerfilEmpresaModel model) => empresa = model;

  @observable
  ObservableList<OfertaModel> ofertas = <OfertaModel>[].asObservable();

  @action
  Future fetchOfertas() async {
    if (_hasMore) {
      if (_lastDocument == null) {
        var doc = await Firestore.instance
            .collection('ofertas')
            .limit(_queryLimit)
            .where("mostrar", isEqualTo: true)
            .where("empresaDona", isEqualTo: empresa.empresaID)
            .getDocuments();
        if (doc.documents.length > 0) {
          for (var i = 0; i < doc.documents.length; i++) {
            OfertaModel aux = OfertaModel.fromJson(doc.documents[i].data);

            ofertas.add(aux);
          }
          _lastDocument = doc.documents[doc.documents.length - 1];
        } else {
          ofertas = <OfertaModel>[].asObservable();
        }
      } else {
        var doc = await Firestore.instance
            .collection('ofertas')
            .limit(_queryLimit)
            .startAfterDocument(_lastDocument)
            .where("mostrar", isEqualTo: true)
            .where("empresaDona", isEqualTo: empresa.empresaID)
            .getDocuments();
        if (doc.documents.length > 0) {
          for (var i = 0; i < doc.documents.length; i++) {
            OfertaModel aux = OfertaModel.fromJson(doc.documents[i].data);
            ofertas.add(aux);
          }
          _lastDocument = doc.documents[doc.documents.length - 1];
        }
      }
    }
  }
}
