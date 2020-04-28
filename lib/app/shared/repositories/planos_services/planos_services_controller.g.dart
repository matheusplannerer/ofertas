// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planos_services_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlanosRepositoryController on _PlanosRepositoryControllerBase, Store {
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

  @override
  String toString() {
    final string = '';
    return '{$string}';
  }
}
