// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_empresa_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerfilEmpresaController on _PerfilEmpresaControllerBase, Store {
  Computed<bool> _$isDonoComputed;

  @override
  bool get isDono =>
      (_$isDonoComputed ??= Computed<bool>(() => super.isDono)).value;
  Computed<bool> _$hasCompanyComputed;

  @override
  bool get hasCompany =>
      (_$hasCompanyComputed ??= Computed<bool>(() => super.hasCompany)).value;
  Computed<PerfilEmpresaModel> _$empresaComputed;

  @override
  PerfilEmpresaModel get empresa =>
      (_$empresaComputed ??= Computed<PerfilEmpresaModel>(() => super.empresa))
          .value;

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

  final _$ofertasAtom = Atom(name: '_PerfilEmpresaControllerBase.ofertas');

  @override
  ObservableList<OfertaModel> get ofertas {
    _$ofertasAtom.context.enforceReadPolicy(_$ofertasAtom);
    _$ofertasAtom.reportObserved();
    return super.ofertas;
  }

  @override
  set ofertas(ObservableList<OfertaModel> value) {
    _$ofertasAtom.context.conditionallyRunInAction(() {
      super.ofertas = value;
      _$ofertasAtom.reportChanged();
    }, _$ofertasAtom, name: '${_$ofertasAtom.name}_set');
  }

  final _$statusHeaderAtom =
      Atom(name: '_PerfilEmpresaControllerBase.statusHeader');

  @override
  RequestStatus get statusHeader {
    _$statusHeaderAtom.context.enforceReadPolicy(_$statusHeaderAtom);
    _$statusHeaderAtom.reportObserved();
    return super.statusHeader;
  }

  @override
  set statusHeader(RequestStatus value) {
    _$statusHeaderAtom.context.conditionallyRunInAction(() {
      super.statusHeader = value;
      _$statusHeaderAtom.reportChanged();
    }, _$statusHeaderAtom, name: '${_$statusHeaderAtom.name}_set');
  }

  final _$hasMoreOfertasAtom =
      Atom(name: '_PerfilEmpresaControllerBase.hasMoreOfertas');

  @override
  bool get hasMoreOfertas {
    _$hasMoreOfertasAtom.context.enforceReadPolicy(_$hasMoreOfertasAtom);
    _$hasMoreOfertasAtom.reportObserved();
    return super.hasMoreOfertas;
  }

  @override
  set hasMoreOfertas(bool value) {
    _$hasMoreOfertasAtom.context.conditionallyRunInAction(() {
      super.hasMoreOfertas = value;
      _$hasMoreOfertasAtom.reportChanged();
    }, _$hasMoreOfertasAtom, name: '${_$hasMoreOfertasAtom.name}_set');
  }

  final _$statusFotosAtom =
      Atom(name: '_PerfilEmpresaControllerBase.statusFotos');

  @override
  RequestStatus get statusFotos {
    _$statusFotosAtom.context.enforceReadPolicy(_$statusFotosAtom);
    _$statusFotosAtom.reportObserved();
    return super.statusFotos;
  }

  @override
  set statusFotos(RequestStatus value) {
    _$statusFotosAtom.context.conditionallyRunInAction(() {
      super.statusFotos = value;
      _$statusFotosAtom.reportChanged();
    }, _$statusFotosAtom, name: '${_$statusFotosAtom.name}_set');
  }

  final _$fetchOfertasEmpresaAsyncAction = AsyncAction('fetchOfertasEmpresa');

  @override
  Future<dynamic> fetchOfertasEmpresa({String empresaID}) {
    return _$fetchOfertasEmpresaAsyncAction
        .run(() => super.fetchOfertasEmpresa(empresaID: empresaID));
  }

  final _$fetchEmpresaAsyncAction = AsyncAction('fetchEmpresa');

  @override
  Future<dynamic> fetchEmpresa({String empresaID}) {
    return _$fetchEmpresaAsyncAction
        .run(() => super.fetchEmpresa(empresaID: empresaID));
  }

  final _$getImageAsyncAction = AsyncAction('getImage');

  @override
  Future<File> getImage(int value) {
    return _$getImageAsyncAction.run(() => super.getImage(value));
  }

  final _$_PerfilEmpresaControllerBaseActionController =
      ActionController(name: '_PerfilEmpresaControllerBase');

  @override
  void setEmpresa(PerfilEmpresaModel model) {
    final _$actionInfo =
        _$_PerfilEmpresaControllerBaseActionController.startAction();
    try {
      return super.setEmpresa(model);
    } finally {
      _$_PerfilEmpresaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetOfertasFetching() {
    final _$actionInfo =
        _$_PerfilEmpresaControllerBaseActionController.startAction();
    try {
      return super.resetOfertasFetching();
    } finally {
      _$_PerfilEmpresaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatusHeader(RequestStatus value) {
    final _$actionInfo =
        _$_PerfilEmpresaControllerBaseActionController.startAction();
    try {
      return super.setStatusHeader(value);
    } finally {
      _$_PerfilEmpresaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatusFotos(RequestStatus value) {
    final _$actionInfo =
        _$_PerfilEmpresaControllerBaseActionController.startAction();
    try {
      return super.setStatusFotos(value);
    } finally {
      _$_PerfilEmpresaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addOfertas(QuerySnapshot query) {
    final _$actionInfo =
        _$_PerfilEmpresaControllerBaseActionController.startAction();
    try {
      return super.addOfertas(query);
    } finally {
      _$_PerfilEmpresaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'ofertas: ${ofertas.toString()},statusHeader: ${statusHeader.toString()},hasMoreOfertas: ${hasMoreOfertas.toString()},statusFotos: ${statusFotos.toString()},isDono: ${isDono.toString()},hasCompany: ${hasCompany.toString()},empresa: ${empresa.toString()}';
    return '{$string}';
  }
}
