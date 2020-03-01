import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';

part 'feed_controller.g.dart';

class FeedController = _FeedBase with _$FeedController;

abstract class _FeedBase with Store {
  bool _noEmpresas = false;
  bool _incrementou = false;
  bool _hasMore = true;
  int _queryLimit = 8;
  bool _carregou;
  bool _buscando = false;
  DocumentSnapshot _lastDocument;

  bool get isLoading => _buscando;
  bool get carregou => _carregou;

  @observable
  ObservableList<PerfilEmpresaModel> empresas =
      <PerfilEmpresaModel>[].asObservable();

  @action
  Future fetchEmpresas() async {
    if (!_buscando) {
      _buscando = true;
      if (_lastDocument == null) {
        print("LAST DOC");
        var doc = await Firestore.instance
            .collection('empresas')
            .limit(_queryLimit)
            .getDocuments();
        for (var i = 0; i < doc.documents.length; i++) {
          PerfilEmpresaModel aux = PerfilEmpresaModel.fromJson(
              doc.documents[i].data, doc.documents[i].documentID);

          var docAux = await Firestore.instance
              .collection('ofertas')
              .where("mostrar", isEqualTo: true)
              .where('empresaDona', isEqualTo: aux.empresaID)
              .limit(1)
              .getDocuments();

          if (docAux.documents.length > 0) {
            if (!empresas.contains(aux)) empresas.add(aux);
          }
        }

        if (doc.documents.length > 0)
          _lastDocument = doc.documents[doc.documents.length - 1];
      } else {
        if (_hasMore) {
          var doc = await Firestore.instance
              .collection('empresas')
              .limit(_queryLimit)
              .startAfterDocument(_lastDocument)
              .getDocuments();

          if (doc.documents.length > 0) {
            _hasMore = true;

            for (var i = 0; i < doc.documents.length; i++) {
              PerfilEmpresaModel aux = PerfilEmpresaModel.fromJson(
                  doc.documents[i].data, doc.documents[i].documentID);

              var docAux = await Firestore.instance
                  .collection('ofertas')
                  .where("mostrar", isEqualTo: true)
                  .where('empresaDona', isEqualTo: aux.empresaID)
                  .limit(1)
                  .getDocuments();

              if (docAux.documents.length > 0) {
                if (!empresas.contains(aux)) {
                  print("DUPLICOU");
                  empresas.add(aux);
                }
              }
            }
            if (doc.documents.length > 0)
              _lastDocument = doc.documents[doc.documents.length - 1];
          } else {
            _hasMore = false;
          }
        }
      }
      _carregou = true;
      print(empresas);
      _buscando = false;
    }
  }
}
