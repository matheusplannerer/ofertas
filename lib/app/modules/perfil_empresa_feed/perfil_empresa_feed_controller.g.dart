// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_empresa_feed_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerfilEmpresaFeedController on _PerfilEmpresaFeedControllerBase, Store {
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

  final _$pagesAtom = Atom(name: '_PerfilEmpresaFeedControllerBase.pages');

  @override
  ObservableList<Widget> get pages {
    _$pagesAtom.context.enforceReadPolicy(_$pagesAtom);
    _$pagesAtom.reportObserved();
    return super.pages;
  }

  @override
  set pages(ObservableList<Widget> value) {
    _$pagesAtom.context.conditionallyRunInAction(() {
      super.pages = value;
      _$pagesAtom.reportChanged();
    }, _$pagesAtom, name: '${_$pagesAtom.name}_set');
  }

  final _$generatedOnceAtom =
      Atom(name: '_PerfilEmpresaFeedControllerBase.generatedOnce');

  @override
  bool get generatedOnce {
    _$generatedOnceAtom.context.enforceReadPolicy(_$generatedOnceAtom);
    _$generatedOnceAtom.reportObserved();
    return super.generatedOnce;
  }

  @override
  set generatedOnce(bool value) {
    _$generatedOnceAtom.context.conditionallyRunInAction(() {
      super.generatedOnce = value;
      _$generatedOnceAtom.reportChanged();
    }, _$generatedOnceAtom, name: '${_$generatedOnceAtom.name}_set');
  }

  final _$_empresaIDAtom =
      Atom(name: '_PerfilEmpresaFeedControllerBase._empresaID');

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

  final _$_empresaAtom =
      Atom(name: '_PerfilEmpresaFeedControllerBase._empresa');

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

  final _$_ofertasAtom =
      Atom(name: '_PerfilEmpresaFeedControllerBase._ofertas');

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

  final _$_statusAtom = Atom(name: '_PerfilEmpresaFeedControllerBase._status');

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

  final _$_PerfilEmpresaFeedControllerBaseActionController =
      ActionController(name: '_PerfilEmpresaFeedControllerBase');

  @override
  void setStatus(RequestStatus value) {
    final _$actionInfo =
        _$_PerfilEmpresaFeedControllerBaseActionController.startAction();
    try {
      return super.setStatus(value);
    } finally {
      _$_PerfilEmpresaFeedControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setEmpId(String empID) {
    final _$actionInfo =
        _$_PerfilEmpresaFeedControllerBaseActionController.startAction();
    try {
      return super.setEmpId(empID);
    } finally {
      _$_PerfilEmpresaFeedControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'pages: ${pages.toString()},generatedOnce: ${generatedOnce.toString()},status: ${status.toString()},empresa: ${empresa.toString()},ofertas: ${ofertas.toString()}';
    return '{$string}';
  }
}
