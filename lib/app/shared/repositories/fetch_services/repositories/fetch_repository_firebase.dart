import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:ofertas/app/shared/repositories/fetch_services/repositories/fetch_repository_interface.dart';

class FirebaseFetchRepository implements IFetchRepository {
  DocumentSnapshot lastFeedFetched;

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
  Future<Map<int, dynamic>> fetchOfertas(String uid,
      {int limitQuery, DocumentSnapshot lastFetched}) async {
    try {
      limitQuery ??= 15;
      QuerySnapshot _ofertasDoc;
      if (lastFetched == null) {
        _ofertasDoc = await Firestore.instance
            .collection('ofertas')
            .limit(limitQuery)
            .where("empresaDona", isEqualTo: uid)
            .where("mostrar", isEqualTo: true)
            .getDocuments();
      } else {
        _ofertasDoc = await Firestore.instance
            .collection('ofertas')
            .limit(limitQuery)
            .startAfterDocument(lastFetched)
            .where("empresaDona", isEqualTo: uid)
            .where("mostrar", isEqualTo: true)
            .getDocuments();
      }
      ObservableList<OfertaModel> _ofertas = <OfertaModel>[].asObservable();
      if (_ofertasDoc.documentChanges.isEmpty)
        return {0: _ofertas, 1: lastFetched};
      for (var i = 0; i < _ofertasDoc.documentChanges.length; i++) {
        OfertaModel aux =
            OfertaModel.fromJson(_ofertasDoc.documentChanges[i].document.data);
        _ofertas.add(aux);
      }
      return {
        0: _ofertas,
        1: _ofertasDoc
            .documentChanges[_ofertasDoc.documentChanges.length - 1].document
      };
    } catch (e) {
      return throw e;
    }
  }

//Quantas? LimitQuery; Quais? Com ofertas ativas;
  @override
  Future<Map<int, dynamic>> fetchFeedEmpresas(
      {int limitQuery, DocumentSnapshot lastFetched}) async {
    //PRIMEIRO FETCH
    QuerySnapshot _empresasDoc;
    try {
      if (lastFeedFetched == null) {
        _empresasDoc = await Firestore.instance
            .collection('empresas')
            .limit(limitQuery)
            .where("ofertas", isGreaterThan: 0)
            .orderBy("ofertas", descending: true)
            .getDocuments();
      } else {
        _empresasDoc = await Firestore.instance
            .collection('empresas')
            .limit(limitQuery)
            .where("ofertas", isGreaterThan: 0)
            .orderBy("ofertas", descending: true)
            .startAfterDocument(lastFetched)
            .getDocuments();
      }
      ObservableList<PerfilEmpresaModel> empresas =
          <PerfilEmpresaModel>[].asObservable();

      for (var i = 0; i < _empresasDoc.documentChanges.length; i++) {
        var model = PerfilEmpresaModel.fromJson(
            _empresasDoc.documentChanges[i].document.data);
        empresas.add(model);
      }

      return {
        0: empresas,
        1: _empresasDoc
            .documentChanges[_empresasDoc.documentChanges.length - 1].document
      };
    } catch (e) {
      return throw e;
    }
  }

  @override
  Future<Map<int, dynamic>> fetchFeedFiltro(
      {int limitQuery, DocumentSnapshot lastFetched, String categoria}) async {
    //PRIMEIRO FETCH
    QuerySnapshot _empresasDoc;
    try {
      if (lastFeedFetched == null) {
        _empresasDoc = await Firestore.instance
            .collection('empresas')
            .limit(limitQuery)
            .where("ofertas", isGreaterThan: 0)
            .orderBy("ofertas", descending: true)
            .where("categoria", isEqualTo: categoria)
            .getDocuments();
      } else {
        _empresasDoc = await Firestore.instance
            .collection('empresas')
            .limit(limitQuery)
            .where("ofertas", isGreaterThan: 0)
            .orderBy("ofertas", descending: true)
            .where("categoria", isEqualTo: categoria)
            .startAfterDocument(lastFetched)
            .getDocuments();
      }
      ObservableList<PerfilEmpresaModel> empresas =
          <PerfilEmpresaModel>[].asObservable();

      for (var i = 0; i < _empresasDoc.documentChanges.length; i++) {
        var model = PerfilEmpresaModel.fromJson(
            _empresasDoc.documentChanges[i].document.data);
        empresas.add(model);
      }

      return {
        0: empresas,
        1: _empresasDoc
            .documentChanges[_empresasDoc.documentChanges.length - 1].document
      };
    } catch (e) {
      return throw e;
    }
  }
}
