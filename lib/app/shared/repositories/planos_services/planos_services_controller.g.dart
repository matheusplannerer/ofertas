// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planos_services_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlanosRepositoryController on _PlanosRepositoryControllerBase, Store {
  Computed<PlanosModel> _$planoComputed;

  @override
  PlanosModel get plano =>
      (_$planoComputed ??= Computed<PlanosModel>(() => super.plano)).value;

  final _$_planoAtom = Atom(name: '_PlanosRepositoryControllerBase._plano');

  @override
  PlanosModel get _plano {
    _$_planoAtom.context.enforceReadPolicy(_$_planoAtom);
    _$_planoAtom.reportObserved();
    return super._plano;
  }

  @override
  set _plano(PlanosModel value) {
    _$_planoAtom.context.conditionallyRunInAction(() {
      super._plano = value;
      _$_planoAtom.reportChanged();
    }, _$_planoAtom, name: '${_$_planoAtom.name}_set');
  }

  final _$getPlanosAsyncAction = AsyncAction('getPlanos');

  @override
  Future<Map<String, PlanosAdminModel>> getPlanos() {
    return _$getPlanosAsyncAction.run(() => super.getPlanos());
  }

  final _$applyCupomAsyncAction = AsyncAction('applyCupom');

  @override
  Future<Map<int, dynamic>> applyCupom(String cupom, PlanosModel actualPlan) {
    return _$applyCupomAsyncAction
        .run(() => super.applyCupom(cupom, actualPlan));
  }

  final _$setPlanoAsyncAction = AsyncAction('setPlano');

  @override
  Future<dynamic> setPlano(PlanosModel plano, FirebaseUser user) {
    return _$setPlanoAsyncAction.run(() => super.setPlano(plano, user));
  }

  final _$updatePlanoAsyncAction = AsyncAction('updatePlano');

  @override
  Future<dynamic> updatePlano(PlanosModel plano, FirebaseUser user) {
    return _$updatePlanoAsyncAction.run(() => super.updatePlano(plano, user));
  }

  final _$_PlanosRepositoryControllerBaseActionController =
      ActionController(name: '_PlanosRepositoryControllerBase');

  @override
  void updateLocalPlano(PlanosModel value) {
    final _$actionInfo =
        _$_PlanosRepositoryControllerBaseActionController.startAction();
    try {
      return super.updateLocalPlano(value);
    } finally {
      _$_PlanosRepositoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'plano: ${plano.toString()}';
    return '{$string}';
  }
}
