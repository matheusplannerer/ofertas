import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';

part 'empresas_view_controller.g.dart';

class EmpresasViewController = _EmpresasViewBase with _$EmpresasViewController;

abstract class _EmpresasViewBase with Store {
  _EmpresasViewBase({this.empresa});

  bool get hasMore => _hasMore;

  int _queryLimit = 12;
  DocumentSnapshot _lastDocument;
  bool _hasMore = true;
  PerfilEmpresaModel empresa;

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
            OfertaModel aux = OfertaModel.fromJson(
                doc.documents[i].data, doc.documents[i].documentID);

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
            OfertaModel aux = OfertaModel.fromJson(
                doc.documents[i].data, doc.documents[i].documentID);
            ofertas.add(aux);
          }
          _lastDocument = doc.documents[doc.documents.length - 1];
        }
      }
    }
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
