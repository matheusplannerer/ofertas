// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publicar_ofertas_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PublicarOfertasController on _PublicarOfertasBase, Store {
  final _$pageIndexAtom = Atom(name: '_PublicarOfertasBase.pageIndex');

  @override
  int get pageIndex {
    _$pageIndexAtom.context.enforceReadPolicy(_$pageIndexAtom);
    _$pageIndexAtom.reportObserved();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.context.conditionallyRunInAction(() {
      super.pageIndex = value;
      _$pageIndexAtom.reportChanged();
    }, _$pageIndexAtom, name: '${_$pageIndexAtom.name}_set');
  }

  final _$_PublicarOfertasBaseActionController =
      ActionController(name: '_PublicarOfertasBase');

  @override
  void setPageIndex(int value) {
    final _$actionInfo = _$_PublicarOfertasBaseActionController.startAction();
    try {
      return super.setPageIndex(value);
    } finally {
      _$_PublicarOfertasBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'pageIndex: ${pageIndex.toString()}';
    return '{$string}';
  }
}
