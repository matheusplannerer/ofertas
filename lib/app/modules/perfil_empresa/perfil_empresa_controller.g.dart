// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_empresa_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerfilEmpresaController on _PerfilEmpresaControllerBase, Store {
  Computed<RequestStatus> _$statusComputed;

  @override
  RequestStatus get status =>
      (_$statusComputed ??= Computed<RequestStatus>(() => super.status)).value;
  Computed<PerfilEmpresaModel> _$empresaComputed;

  @override
  PerfilEmpresaModel get empresa =>
      (_$empresaComputed ??= Computed<PerfilEmpresaModel>(() => super.empresa))
          .value;
  Computed<ObservableList<OfertaModel>> _$ofertasComputed;

  @override
  ObservableList<OfertaModel> get ofertas => (_$ofertasComputed ??=
          Computed<ObservableList<OfertaModel>>(() => super.ofertas))
      .value;
  Computed<bool> _$isDonoComputed;

  @override
  bool get isDono =>
      (_$isDonoComputed ??= Computed<bool>(() => super.isDono)).value;
  Computed<bool> _$hasCompanyComputed;

  @override
  bool get hasCompany =>
      (_$hasCompanyComputed ??= Computed<bool>(() => super.hasCompany)).value;

  final _$_empresaIDAtom =
      Atom(name: '_PerfilEmpresaControllerBase._empresaID');

  @override
  String get _empresaID {
    _$_empresaIDAtom.context.enforceReadPolicy(_$_empresaIDAtom);
    _$_empresaIDAtom.reportObserved();
    return super._empresaID;
  }

  @override
  set _empresaID(String value) {
    _$_empresaIDAtom.context.conditionallyRunInAction(() {
      super._empresaID = value;
      _$_empresaIDAtom.reportChanged();
    }, _$_empresaIDAtom, name: '${_$_empresaIDAtom.name}_set');
  }

  final _$_empresaAtom = Atom(name: '_PerfilEmpresaControllerBase._empresa');

  @override
  PerfilEmpresaModel get _empresa {
    _$_empresaAtom.context.enforceReadPolicy(_$_empresaAtom);
    _$_empresaAtom.reportObserved();
    return super._empresa;
  }

  @override
  set _empresa(PerfilEmpresaModel value) {
    _$_empresaAtom.context.conditionallyRunInAction(() {
      super._empresa = value;
      _$_empresaAtom.reportChanged();
    }, _$_empresaAtom, name: '${_$_empresaAtom.name}_set');
  }

  final _$_ofertasAtom = Atom(name: '_PerfilEmpresaControllerBase._ofertas');

  @override
  ObservableList<OfertaModel> get _ofertas {
    _$_ofertasAtom.context.enforceReadPolicy(_$_ofertasAtom);
    _$_ofertasAtom.reportObserved();
    return super._ofertas;
  }

  @override
  set _ofertas(ObservableList<OfertaModel> value) {
    _$_ofertasAtom.context.conditionallyRunInAction(() {
      super._ofertas = value;
      _$_ofertasAtom.reportChanged();
    }, _$_ofertasAtom, name: '${_$_ofertasAtom.name}_set');
  }

  final _$_statusAtom = Atom(name: '_PerfilEmpresaControllerBase._status');

  @override
  RequestStatus get _status {
    _$_statusAtom.context.enforceReadPolicy(_$_statusAtom);
    _$_statusAtom.reportObserved();
    return super._status;
  }

  @override
  set _status(RequestStatus value) {
    _$_statusAtom.context.conditionallyRunInAction(() {
      super._status = value;
      _$_statusAtom.reportChanged();
    }, _$_statusAtom, name: '${_$_statusAtom.name}_set');
  }

  final _$fetchPageAsyncAction = AsyncAction('fetchPage');

  @override
  Future<dynamic> fetchPage() {
    return _$fetchPageAsyncAction.run(() => super.fetchPage());
  }

  final _$_fetchOfertasAsyncAction = AsyncAction('_fetchOfertas');

  @override
  Future<dynamic> _fetchOfertas() {
    return _$_fetchOfertasAsyncAction.run(() => super._fetchOfertas());
  }

  final _$_fetchEmpresaAsyncAction = AsyncAction('_fetchEmpresa');

  @override
  Future<dynamic> _fetchEmpresa() {
    return _$_fetchEmpresaAsyncAction.run(() => super._fetchEmpresa());
  }

  final _$changeEmpresaAsyncAction = AsyncAction('changeEmpresa');

  @override
  Future<dynamic> changeEmpresa(PerfilEmpresaModel aux) {
    return _$changeEmpresaAsyncAction.run(() => super.changeEmpresa(aux));
  }

  final _$getImageAsyncAction = AsyncAction('getImage');

  @override
  Future<File> getImage(int value) {
    return _$getImageAsyncAction.run(() => super.getImage(value));
  }

  final _$_PerfilEmpresaControllerBaseActionController =
      ActionController(name: '_PerfilEmpresaControllerBase');

  @override
  void setStatus(RequestStatus value) {
    final _$actionInfo =
        _$_PerfilEmpresaControllerBaseActionController.startAction();
    try {
      return super.setStatus(value);
    } finally {
      _$_PerfilEmpresaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmpId(String empID) {
    final _$actionInfo =
        _$_PerfilEmpresaControllerBaseActionController.startAction();
    try {
      return super.setEmpId(empID);
    } finally {
      _$_PerfilEmpresaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'status: ${status.toString()},empresa: ${empresa.toString()},ofertas: ${ofertas.toString()},isDono: ${isDono.toString()},hasCompany: ${hasCompany.toString()}';
    return '{$string}';
  }
}
