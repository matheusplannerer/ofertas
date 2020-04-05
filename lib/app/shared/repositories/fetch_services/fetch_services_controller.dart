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

  Future<ObservableList<OfertaModel>> fetchOfertas(String uid) async {
    try {
      var _ofertasModel = await _fetch.fetchOfertas(uid);
      return _ofertasModel;
    } catch (e) {
      return throw e;
    }
  }
}
