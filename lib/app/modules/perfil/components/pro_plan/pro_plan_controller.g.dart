// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pro_plan_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProPlanController on _ProPlanControllerBase, Store {
  final _$mensalAtom = Atom(name: '_ProPlanControllerBase.mensal');

  @override
  bool get mensal {
    _$mensalAtom.context.enforceReadPolicy(_$mensalAtom);
    _$mensalAtom.reportObserved();
    return super.mensal;
  }

  @override
  set mensal(bool value) {
    _$mensalAtom.context.conditionallyRunInAction(() {
      super.mensal = value;
      _$mensalAtom.reportChanged();
    }, _$mensalAtom, name: '${_$mensalAtom.name}_set');
  }

  final _$semestralAtom = Atom(name: '_ProPlanControllerBase.semestral');

  @override
  bool get semestral {
    _$semestralAtom.context.enforceReadPolicy(_$semestralAtom);
    _$semestralAtom.reportObserved();
    return super.semestral;
  }

  @override
  set semestral(bool value) {
    _$semestralAtom.context.conditionallyRunInAction(() {
      super.semestral = value;
      _$semestralAtom.reportChanged();
    }, _$semestralAtom, name: '${_$semestralAtom.name}_set');
  }

  final _$anualAtom = Atom(name: '_ProPlanControllerBase.anual');

  @override
  bool get anual {
    _$anualAtom.context.enforceReadPolicy(_$anualAtom);
    _$anualAtom.reportObserved();
    return super.anual;
  }

  @override
  set anual(bool value) {
    _$anualAtom.context.conditionallyRunInAction(() {
      super.anual = value;
      _$anualAtom.reportChanged();
    }, _$anualAtom, name: '${_$anualAtom.name}_set');
  }

  final _$_ProPlanControllerBaseActionController =
      ActionController(name: '_ProPlanControllerBase');

  @override
  void setMensal(bool value) {
    final _$actionInfo = _$_ProPlanControllerBaseActionController.startAction();
    try {
      return super.setMensal(value);
    } finally {
      _$_ProPlanControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSemestral(bool value) {
    final _$actionInfo = _$_ProPlanControllerBaseActionController.startAction();
    try {
      return super.setSemestral(value);
    } finally {
      _$_ProPlanControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAnual(bool value) {
    final _$actionInfo = _$_ProPlanControllerBaseActionController.startAction();
    try {
      return super.setAnual(value);
    } finally {
      _$_ProPlanControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlan(PlanosAdminModel model) {
    final _$actionInfo = _$_ProPlanControllerBaseActionController.startAction();
    try {
      return super.setPlan(model);
    } finally {
      _$_ProPlanControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'mensal: ${mensal.toString()},semestral: ${semestral.toString()},anual: ${anual.toString()}';
    return '{$string}';
  }
}
