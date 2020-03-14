// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empresa_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EmpresaController on _EmpresaBase, Store {
  final _$empresaModelAtom = Atom(name: '_EmpresaBase.empresaModel');

  @override
  PerfilEmpresaModel get empresaModel {
    _$empresaModelAtom.context.enforceReadPolicy(_$empresaModelAtom);
    _$empresaModelAtom.reportObserved();
    return super.empresaModel;
  }

  @override
  set empresaModel(PerfilEmpresaModel value) {
    _$empresaModelAtom.context.conditionallyRunInAction(() {
      super.empresaModel = value;
      _$empresaModelAtom.reportChanged();
    }, _$empresaModelAtom, name: '${_$empresaModelAtom.name}_set');
  }

  final _$getImageAsyncAction = AsyncAction('getImage');

  @override
  Future<File> getImage(int value) {
    return _$getImageAsyncAction.run(() => super.getImage(value));
  }

  final _$_EmpresaBaseActionController = ActionController(name: '_EmpresaBase');

  @override
  void updateModel(PerfilEmpresaModel model) {
    final _$actionInfo = _$_EmpresaBaseActionController.startAction();
    try {
      return super.updateModel(model);
    } finally {
      _$_EmpresaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'empresaModel: ${empresaModel.toString()}';
    return '{$string}';
  }
}
