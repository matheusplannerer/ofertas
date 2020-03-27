// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedController on _FeedBase, Store {
  final _$empresasAtom = Atom(name: '_FeedBase.empresas');

  @override
  ObservableList<PerfilEmpresaModel> get empresas {
    _$empresasAtom.context.enforceReadPolicy(_$empresasAtom);
    _$empresasAtom.reportObserved();
    return super.empresas;
  }

  @override
  set empresas(ObservableList<PerfilEmpresaModel> value) {
    _$empresasAtom.context.conditionallyRunInAction(() {
      super.empresas = value;
      _$empresasAtom.reportChanged();
    }, _$empresasAtom, name: '${_$empresasAtom.name}_set');
  }

  final _$fetchEmpresasAsyncAction = AsyncAction('fetchEmpresas');

  @override
  Future<dynamic> fetchEmpresas() {
    return _$fetchEmpresasAsyncAction.run(() => super.fetchEmpresas());
  }

  @override
  String toString() {
    final string = 'empresas: ${empresas.toString()}';
    return '{$string}';
  }
}
