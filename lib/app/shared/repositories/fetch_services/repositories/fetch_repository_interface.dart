import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';

abstract class IFetchRepository {
  Future<PerfilEmpresaModel> fetchEmpresa(String uid);
  Future<Map<int, dynamic>> fetchFeedEmpresas(
      {int limitQuery, DocumentSnapshot lastFetched});
  Future<Map<int, dynamic>> fetchOfertas(String uid,
      {int limitQuery, DocumentSnapshot lastFetched});
  Future<Map<int, dynamic>> fetchFeedFiltro(
      {int limitQuery, DocumentSnapshot lastFetched, String categoria});

  // Future<ObservableList
}
