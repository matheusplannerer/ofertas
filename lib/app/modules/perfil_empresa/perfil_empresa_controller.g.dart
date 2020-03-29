// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_empresa_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerfilEmpresaController on _PerfilEmpresaControllerBase, Store {
  Computed<bool> _$isDonoComputed;

  @override
  bool get isDono =>
      (_$isDonoComputed ??= Computed<bool>(() => super.isDono)).value;

  final _$empresaModelAtom =
      Atom(name: '_PerfilEmpresaControllerBase.empresaModel');

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

  final _$streamAtom = Atom(name: '_PerfilEmpresaControllerBase.stream');

  @override
  Stream<DocumentSnapshot> get stream {
    _$streamAtom.context.enforceReadPolicy(_$streamAtom);
    _$streamAtom.reportObserved();
    return super.stream;
  }

  @override
  set stream(Stream<DocumentSnapshot> value) {
    _$streamAtom.context.conditionallyRunInAction(() {
      super.stream = value;
      _$streamAtom.reportChanged();
    }, _$streamAtom, name: '${_$streamAtom.name}_set');
  }

  final _$getImageAsyncAction = AsyncAction('getImage');

  @override
  Future<File> getImage(int value) {
    return _$getImageAsyncAction.run(() => super.getImage(value));
  }

  final _$_PerfilEmpresaControllerBaseActionController =
      ActionController(name: '_PerfilEmpresaControllerBase');

  @override
  void setStream(Stream<DocumentSnapshot> value) {
    final _$actionInfo =
        _$_PerfilEmpresaControllerBaseActionController.startAction();
    try {
      return super.setStream(value);
    } finally {
      _$_PerfilEmpresaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateModel(PerfilEmpresaModel model) {
    final _$actionInfo =
        _$_PerfilEmpresaControllerBaseActionController.startAction();
    try {
      return super.updateModel(model);
    } finally {
      _$_PerfilEmpresaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'empresaModel: ${empresaModel.toString()},stream: ${stream.toString()},isDono: ${isDono.toString()}';
    return '{$string}';
  }
}
