// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oferta_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OfertaDetailsController on _OfertaDetailsBase, Store {
  final _$valueAtom = Atom(name: '_OfertaDetailsBase.value');

  @override
  int get value {
    _$valueAtom.context.enforceReadPolicy(_$valueAtom);
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.context.conditionallyRunInAction(() {
      super.value = value;
      _$valueAtom.reportChanged();
    }, _$valueAtom, name: '${_$valueAtom.name}_set');
  }

  final _$_OfertaDetailsBaseActionController =
      ActionController(name: '_OfertaDetailsBase');

  @override
  void increment() {
    final _$actionInfo = _$_OfertaDetailsBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_OfertaDetailsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'value: ${value.toString()}';
    return '{$string}';
  }
}
