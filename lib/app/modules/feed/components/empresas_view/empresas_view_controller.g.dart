// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empresas_view_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EmpresasViewController on _EmpresasViewBase, Store {
  final _$ofertasAtom = Atom(name: '_EmpresasViewBase.ofertas');

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

  final _$fetchOfertasAsyncAction = AsyncAction('fetchOfertas');

  @override
  Future<dynamic> fetchOfertas() {
    return _$fetchOfertasAsyncAction.run(() => super.fetchOfertas());
  }

  @override
  String toString() {
    final string = 'ofertas: ${ofertas.toString()}';
    return '{$string}';
  }
}
