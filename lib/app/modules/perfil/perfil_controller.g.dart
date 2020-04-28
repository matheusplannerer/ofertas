// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerfilController on _PerfilControllerBase, Store {
  final _$selectPlanAtom = Atom(name: '_PerfilControllerBase.selectPlan');

  @override
  PlanosModel get selectPlan {
    _$selectPlanAtom.context.enforceReadPolicy(_$selectPlanAtom);
    _$selectPlanAtom.reportObserved();
    return super.selectPlan;
  }

  @override
  set selectPlan(PlanosModel value) {
    _$selectPlanAtom.context.conditionallyRunInAction(() {
      super.selectPlan = value;
      _$selectPlanAtom.reportChanged();
    }, _$selectPlanAtom, name: '${_$selectPlanAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'selectPlan: ${selectPlan.toString()}';
    return '{$string}';
  }
}
