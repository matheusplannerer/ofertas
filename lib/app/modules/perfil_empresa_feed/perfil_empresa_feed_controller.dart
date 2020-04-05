import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa_feed/components/fotos_empresa_feed/fotos_empresa_feed_widget.dart';
import 'package:ofertas/app/modules/perfil_empresa_feed/components/header_empresa_feed/header_empresa_feed_widget.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:ofertas/app/shared/repositories/fetch_services/fetch_services_controller.dart';

part 'perfil_empresa_feed_controller.g.dart';

class PerfilEmpresaFeedController = _PerfilEmpresaFeedControllerBase
    with _$PerfilEmpresaFeedController;

abstract class _PerfilEmpresaFeedControllerBase with Store {
  FetchServicesController _fetch = Modular.get();

  _PerfilEmpresaFeedControllerBase() {
    print("RODOU CONTROLLER");
  }

  @observable
  ObservableList<Widget> pages = <Widget>[].asObservable();

  @observable
  bool generatedOnce = false;

  @observable
  String _empresaID = '';

  @observable
  PerfilEmpresaModel _empresa;

  @observable
  ObservableList<OfertaModel> _ofertas;

  @observable
  RequestStatus _status = RequestStatus.success;

  @computed
  RequestStatus get status => _status;

  @computed
  PerfilEmpresaModel get empresa => _empresa;
  @computed
  ObservableList<OfertaModel> get ofertas => _ofertas;

  @action
  void setStatus(RequestStatus value) => _status = value;

  @action
  void setEmpId(String empID) => _empresaID = empID;

  //Pega os dados da empresa e começa a puxar de novo as ofertas
  @action
  Future fetchPage() async {
    if (status == RequestStatus.loading) return;
    try {
      await _fetchEmpresa();
      await _fetchOfertas();

      setStatus(RequestStatus.success);
      // return Future.wait([_fetchEmpresa(), _fetchOfertas(),]);
    } catch (e) {
      setStatus(RequestStatus.error);
      print("ERRO FETCHING EMPRESA");
      return;
    }
  }

  @action
  Future _fetchOfertas() async {
    setStatus(RequestStatus.loading);
    try {
      _ofertas = await _fetch.fetchOfertas(_empresaID);
      return;
    } catch (e) {
      setStatus(RequestStatus.error);
      print("ERRO FETCHING OFERTAS");
      return throw e;
    }
  }

  @action
  Future _fetchEmpresa() async {
    setStatus(RequestStatus.loading);
    try {
      _empresa = await _fetch.fetchEmpresa(_empresaID);
      return;
    } catch (e) {
      print("ERRO FETCHING EMPRESA");
      return throw e;
    }
  }
}
