import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_controller.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:ofertas/app/shared/repositories/fetch_services/fetch_services_controller.dart';
import 'package:ofertas/app/shared/repositories/routes/route_controller.dart';

part 'empresas_view_controller.g.dart';

class EmpresasViewController = _EmpresasViewBase with _$EmpresasViewController;

abstract class _EmpresasViewBase with Store {
  RouteController routeController = Modular.get();
  FetchServicesController _fetch = Modular.get();

  _EmpresasViewBase({this.empresa});

  @observable
  bool _hasMore = true;
  @computed
  bool get hasMore => _hasMore;

  PerfilEmpresaModel empresa;

  DocumentSnapshot _lastOfertaFetched;

  void setEmpresa(PerfilEmpresaModel model) => empresa = model;

  @observable
  ObservableList<OfertaModel> _ofertas;

  @observable
  RequestStatus _status = RequestStatus.success;

  @computed
  RequestStatus get status => _status;

  @action
  void setStatus(RequestStatus value) => _status = value;

  @computed
  ObservableList<OfertaModel> get ofertas => _ofertas;

  //Nessa página hasMore será sempre falso pois a ideia é justamente limitar o número de ofertas por página em 5
  @action
  Future fetchOfertasEmpresa() async {
    if (status == RequestStatus.loading) return;
    if (!hasMore) return;
    try {
      _status = RequestStatus.loading;
      int limit;
      if (empresa.ofertas >= 15)
        limit = (empresa.ofertas / 3).floor();
      else
        limit = 5;

      var aux = await _fetch.fetchOfertas(empresa.empresaID,
          queryLimit: limit, lastFetched: _lastOfertaFetched);

      _status = RequestStatus.success;

      _ofertas ??= <OfertaModel>[].asObservable();
      _ofertas.addAll(aux[0]);
      _lastOfertaFetched = aux[1];
      _hasMore = false;
    } catch (e) {
      _status = RequestStatus.error;
      return;
    }
  }
}
