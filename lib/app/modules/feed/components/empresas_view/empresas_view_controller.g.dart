// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empresas_view_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EmpresasViewController on _EmpresasViewBase, Store {
  Computed<bool> _$hasMoreComputed;

  @override
  bool get hasMore =>
      (_$hasMoreComputed ??= Computed<bool>(() => super.hasMore)).value;
  Computed<RequestStatus> _$statusComputed;

  @override
  RequestStatus get status =>
      (_$statusComputed ??= Computed<RequestStatus>(() => super.status)).value;
  Computed<ObservableList<OfertaModel>> _$ofertasComputed;

  @override
  ObservableList<OfertaModel> get ofertas => (_$ofertasComputed ??=
          Computed<ObservableList<OfertaModel>>(() => super.ofertas))
      .value;

  final _$_hasMoreAtom = Atom(name: '_EmpresasViewBase._hasMore');

  @override
  bool get _hasMore {
    _$_hasMoreAtom.context.enforceReadPolicy(_$_hasMoreAtom);
    _$_hasMoreAtom.reportObserved();
    return super._hasMore;
  }

  @override
  set _hasMore(bool value) {
    _$_hasMoreAtom.context.conditionallyRunInAction(() {
      super._hasMore = value;
      _$_hasMoreAtom.reportChanged();
    }, _$_hasMoreAtom, name: '${_$_hasMoreAtom.name}_set');
  }

  final _$_ofertasAtom = Atom(name: '_EmpresasViewBase._ofertas');

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

  final _$_statusAtom = Atom(name: '_EmpresasViewBase._status');

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

  final _$fetchOfertasEmpresaAsyncAction = AsyncAction('fetchOfertasEmpresa');

  @override
  Future<dynamic> fetchOfertasEmpresa() {
    return _$fetchOfertasEmpresaAsyncAction
        .run(() => super.fetchOfertasEmpresa());
  }

  final _$_EmpresasViewBaseActionController =
      ActionController(name: '_EmpresasViewBase');

  @override
  void setStatus(RequestStatus value) {
    final _$actionInfo = _$_EmpresasViewBaseActionController.startAction();
    try {
      return super.setStatus(value);
    } finally {
      _$_EmpresasViewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'hasMore: ${hasMore.toString()},status: ${status.toString()},ofertas: ${ofertas.toString()}';
    return '{$string}';
  }
}
