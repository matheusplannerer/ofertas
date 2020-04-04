// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fotos_empresa_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FotosEmpresaController on _FotosEmpresaControllerBase, Store {
  final _$empresaAtom = Atom(name: '_FotosEmpresaControllerBase.empresa');

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

  final _$valueAtom = Atom(name: '_FotosEmpresaControllerBase.value');

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

  final _$_FotosEmpresaControllerBaseActionController =
      ActionController(name: '_FotosEmpresaControllerBase');

  @override
  void increment() {
    final _$actionInfo =
        _$_FotosEmpresaControllerBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_FotosEmpresaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'empresa: ${empresa.toString()},value: ${value.toString()}';
    return '{$string}';
  }
}
