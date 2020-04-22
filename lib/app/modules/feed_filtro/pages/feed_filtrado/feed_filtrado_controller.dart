import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_controller.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:ofertas/app/shared/repositories/fetch_services/fetch_services_controller.dart';
import 'package:ofertas/app/shared/repositories/routes/route_controller.dart';

part 'feed_filtrado_controller.g.dart';

class FeedFiltradoController = _FeedFiltradoControllerBase
    with _$FeedFiltradoController;

abstract class _FeedFiltradoControllerBase with Store {
  RouteController routeController = Modular.get();
  AppController appController = Modular.get();
  FetchServicesController _fetch = Modular.get();

  DocumentSnapshot _lastDocFetched;

  @observable
  ObservableList<PerfilEmpresaModel> _empresas;
  @observable
  RequestStatus _status = RequestStatus.success;
  @observable
  bool _hasMore = true;

  @computed
  ObservableList<PerfilEmpresaModel> get empresas => _empresas;
  @computed
  RequestStatus get status => _status;
  @computed
  bool get hasMore => _hasMore;

  @action
  void setHasMore(bool value) => _hasMore = value;
  @action
  void setStatus(RequestStatus value) => _status = value;

  @action
  void resetPageToFetch() {
    _empresas = null;
    _status = RequestStatus.success;
    _hasMore = true;
    _lastDocFetched = null;
  }

  @action
  Future fetchPage(String categoria, {int limitQuery}) async {
    if (status == RequestStatus.loading) return;
    if (!hasMore) return;
    limitQuery ??= 6;
    try {
      _status = RequestStatus.loading;
      var aux = await _fetch.fetchFeedFiltro(
        limitQuery: limitQuery,
        lastFetched: _lastDocFetched,
        categoria: categoria,
      );
      _empresas ??= <PerfilEmpresaModel>[].asObservable();
      _empresas.addAll(aux[0]);
      if (aux.length == limitQuery)
        _hasMore = true;
      else
        _hasMore = false;
      _status = RequestStatus.success;
      _lastDocFetched = aux[1];
    } catch (e) {
      _status = RequestStatus.error;
      print(e.toString());
    }
  }
}
