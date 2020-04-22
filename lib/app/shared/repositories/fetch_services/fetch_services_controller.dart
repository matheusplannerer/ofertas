import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:ofertas/app/shared/repositories/fetch_services/repositories/fetch_repository_interface.dart';
part 'fetch_services_controller.g.dart';

class FetchServicesController = _FetchServicesControllerBase
    with _$FetchServicesController;

abstract class _FetchServicesControllerBase with Store {
  IFetchRepository _fetch = Modular.get();

  Future<PerfilEmpresaModel> fetchEmpresa(String uid) async {
    try {
      var _perfilModel = await _fetch.fetchEmpresa(uid);
      return _perfilModel;
    } catch (e) {
      return throw e;
    }
  }

  Future<Map<int, dynamic>> fetchOfertas(String uid,
      {int queryLimit, DocumentSnapshot lastFetched}) async {
    try {
      var _ofertasModelLastDoc =
          await _fetch.fetchOfertas(uid, limitQuery: queryLimit);
      return _ofertasModelLastDoc;
    } catch (e) {
      return throw e;
    }
  }

  Future<Map<int, dynamic>> fetchFeedEmpresas(
      {int limitQuery, DocumentSnapshot lastFetched}) async {
    try {
      var _empresasModelLastDoc = await _fetch.fetchFeedEmpresas(
        limitQuery: limitQuery,
        lastFetched: lastFetched,
      );
      return _empresasModelLastDoc;
    } catch (e) {
      return throw e;
    }
  }

  Future<Map<int, dynamic>> fetchFeedFiltro(
      {int limitQuery, DocumentSnapshot lastFetched, String categoria}) async {
    try {
      var _empresasModelLastDoc = await _fetch.fetchFeedFiltro(
        limitQuery: limitQuery,
        lastFetched: lastFetched,
        categoria: categoria,
      );
      return _empresasModelLastDoc;
    } catch (e) {
      return throw e;
    }
  }
}
