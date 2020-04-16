// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_infos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditInfosController on _EditInfosControllerBase, Store {
  final _$empresaAtom = Atom(name: '_EditInfosControllerBase.empresa');

  @override
  PerfilEmpresaModel get empresa {
    _$empresaAtom.context.enforceReadPolicy(_$empresaAtom);
    _$empresaAtom.reportObserved();
    return super.empresa;
  }

  @override
  set empresa(PerfilEmpresaModel value) {
    _$empresaAtom.context.conditionallyRunInAction(() {
      super.empresa = value;
      _$empresaAtom.reportChanged();
    }, _$empresaAtom, name: '${_$empresaAtom.name}_set');
  }

  final _$updateEmpresaAsyncAction = AsyncAction('updateEmpresa');

  @override
  Future<dynamic> updateEmpresa() {
    return _$updateEmpresaAsyncAction.run(() => super.updateEmpresa());
  }

  final _$_EditInfosControllerBaseActionController =
      ActionController(name: '_EditInfosControllerBase');

  @override
  void initEmpresa(PerfilEmpresaModel value) {
    final _$actionInfo =
        _$_EditInfosControllerBaseActionController.startAction();
    try {
      return super.initEmpresa(value);
    } finally {
      _$_EditInfosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'empresa: ${empresa.toString()}';
    return '{$string}';
  }
}
