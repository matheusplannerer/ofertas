import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:ofertas/app/shared/repositories/fetch_services/repositories/fetch_repository_interface.dart';

class FirebaseFetchRepository implements IFetchRepository {
  @override
  Future<PerfilEmpresaModel> fetchEmpresa(String uid) async {
    try {
      var _empresaDoc =
          await Firestore.instance.collection('empresas').document(uid).get();
      if (!_empresaDoc.exists) throw null;
      PerfilEmpresaModel _perfilModel =
          PerfilEmpresaModel.fromJson(_empresaDoc.data);
      return _perfilModel;
    } catch (e) {
      return throw e;
    }
  }

  @override
  Future<ObservableList<OfertaModel>> fetchOfertas(String uid) async {
    try {
      var _ofertasDoc = await Firestore.instance
          .collection('ofertas')
          .where("empresaDona", isEqualTo: uid)
          .where("mostrar", isEqualTo: true)
          .getDocuments();
      ObservableList<OfertaModel> _ofertas = <OfertaModel>[].asObservable();
      if (_ofertasDoc.documents.isEmpty) return _ofertas;
      for (var i = 0; i < _ofertasDoc.documents.length; i++) {
        OfertaModel aux = OfertaModel.fromJson(_ofertasDoc.documents[i].data);
        _ofertas.add(aux);
      }
      return _ofertas;
    } catch (e) {
      return throw e;
    }
  }
}
