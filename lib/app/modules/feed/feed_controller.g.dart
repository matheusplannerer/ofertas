// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedController on _FeedBase, Store {
  Computed<ObservableList<PerfilEmpresaModel>> _$empresasComputed;

  @override
  ObservableList<PerfilEmpresaModel> get empresas => (_$empresasComputed ??=
          Computed<ObservableList<PerfilEmpresaModel>>(() => super.empresas))
      .value;
  Computed<RequestStatus> _$statusComputed;

  @override
  RequestStatus get status =>
      (_$statusComputed ??= Computed<RequestStatus>(() => super.status)).value;
  Computed<bool> _$hasMoreComputed;

  @override
  bool get hasMore =>
      (_$hasMoreComputed ??= Computed<bool>(() => super.hasMore)).value;

  final _$_empresasAtom = Atom(name: '_FeedBase._empresas');

  @override
  ObservableList<PerfilEmpresaModel> get _empresas {
    _$_empresasAtom.context.enforceReadPolicy(_$_empresasAtom);
    _$_empresasAtom.reportObserved();
    return super._empresas;
  }

  @override
  set _empresas(ObservableList<PerfilEmpresaModel> value) {
    _$_empresasAtom.context.conditionallyRunInAction(() {
      super._empresas = value;
      _$_empresasAtom.reportChanged();
    }, _$_empresasAtom, name: '${_$_empresasAtom.name}_set');
  }

  final _$_statusAtom = Atom(name: '_FeedBase._status');

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

  final _$_hasMoreAtom = Atom(name: '_FeedBase._hasMore');

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

  final _$fetchPageAsyncAction = AsyncAction('fetchPage');

  @override
  Future<dynamic> fetchPage({int limitQuery}) {
    return _$fetchPageAsyncAction
        .run(() => super.fetchPage(limitQuery: limitQuery));
  }

  final _$_FeedBaseActionController = ActionController(name: '_FeedBase');

  @override
  void setHasMore(bool value) {
    final _$actionInfo = _$_FeedBaseActionController.startAction();
    try {
      return super.setHasMore(value);
    } finally {
      _$_FeedBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatus(RequestStatus value) {
    final _$actionInfo = _$_FeedBaseActionController.startAction();
    try {
      return super.setStatus(value);
    } finally {
      _$_FeedBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetPageToFetch() {
    final _$actionInfo = _$_FeedBaseActionController.startAction();
    try {
      return super.resetPageToFetch();
    } finally {
      _$_FeedBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'empresas: ${empresas.toString()},status: ${status.toString()},hasMore: ${hasMore.toString()}';
    return '{$string}';
  }
}
