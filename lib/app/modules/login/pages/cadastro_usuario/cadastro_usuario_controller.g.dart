// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_usuario_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroUsuarioController on _CadastroUsuarioBase, Store {
  Computed<bool> _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError)).value;

  final _$_CadastroUsuarioBaseActionController =
      ActionController(name: '_CadastroUsuarioBase');

  @override
  void setNome(String value) {
    final _$actionInfo = _$_CadastroUsuarioBaseActionController.startAction();
    try {
      return super.setNome(value);
    } finally {
      _$_CadastroUsuarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setContato(String value) {
    final _$actionInfo = _$_CadastroUsuarioBaseActionController.startAction();
    try {
      return super.setContato(value);
    } finally {
      _$_CadastroUsuarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_CadastroUsuarioBaseActionController.startAction();
    try {
      return super.setEmail(value);
    } finally {
      _$_CadastroUsuarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String value) {
    final _$actionInfo = _$_CadastroUsuarioBaseActionController.startAction();
    try {
      return super.setSenha(value);
    } finally {
      _$_CadastroUsuarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmaSenha(String value) {
    final _$actionInfo = _$_CadastroUsuarioBaseActionController.startAction();
    try {
      return super.setConfirmaSenha(value);
    } finally {
      _$_CadastroUsuarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErroCadastro(String value) {
    final _$actionInfo = _$_CadastroUsuarioBaseActionController.startAction();
    try {
      return super.setErroCadastro(value);
    } finally {
      _$_CadastroUsuarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateFields() {
    final _$actionInfo = _$_CadastroUsuarioBaseActionController.startAction();
    try {
      return super.validateFields();
    } finally {
      _$_CadastroUsuarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'hasError: ${hasError.toString()}';
    return '{$string}';
  }
}
