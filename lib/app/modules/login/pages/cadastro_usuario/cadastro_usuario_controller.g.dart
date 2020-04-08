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

  final _$erroAtom = Atom(name: '_CadastroUsuarioBase.erro');

  @override
  ErroCadastroModel get erro {
    _$erroAtom.context.enforceReadPolicy(_$erroAtom);
    _$erroAtom.reportObserved();
    return super.erro;
  }

  @override
  set erro(ErroCadastroModel value) {
    _$erroAtom.context.conditionallyRunInAction(() {
      super.erro = value;
      _$erroAtom.reportChanged();
    }, _$erroAtom, name: '${_$erroAtom.name}_set');
  }

  final _$_userInfosAtom = Atom(name: '_CadastroUsuarioBase._userInfos');

  @override
  UserModel get _userInfos {
    _$_userInfosAtom.context.enforceReadPolicy(_$_userInfosAtom);
    _$_userInfosAtom.reportObserved();
    return super._userInfos;
  }

  @override
  set _userInfos(UserModel value) {
    _$_userInfosAtom.context.conditionallyRunInAction(() {
      super._userInfos = value;
      _$_userInfosAtom.reportChanged();
    }, _$_userInfosAtom, name: '${_$_userInfosAtom.name}_set');
  }

  final _$confirmaSenhaAtom = Atom(name: '_CadastroUsuarioBase.confirmaSenha');

  @override
  String get confirmaSenha {
    _$confirmaSenhaAtom.context.enforceReadPolicy(_$confirmaSenhaAtom);
    _$confirmaSenhaAtom.reportObserved();
    return super.confirmaSenha;
  }

  @override
  set confirmaSenha(String value) {
    _$confirmaSenhaAtom.context.conditionallyRunInAction(() {
      super.confirmaSenha = value;
      _$confirmaSenhaAtom.reportChanged();
    }, _$confirmaSenhaAtom, name: '${_$confirmaSenhaAtom.name}_set');
  }

  final _$signUpAsyncAction = AsyncAction('signUp');

  @override
  Future<FirebaseUser> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

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
  void _resetErrors() {
    final _$actionInfo = _$_CadastroUsuarioBaseActionController.startAction();
    try {
      return super._resetErrors();
    } finally {
      _$_CadastroUsuarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _validateNomeCompleto() {
    final _$actionInfo = _$_CadastroUsuarioBaseActionController.startAction();
    try {
      return super._validateNomeCompleto();
    } finally {
      _$_CadastroUsuarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _validateEmail() {
    final _$actionInfo = _$_CadastroUsuarioBaseActionController.startAction();
    try {
      return super._validateEmail();
    } finally {
      _$_CadastroUsuarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _validateContato() {
    final _$actionInfo = _$_CadastroUsuarioBaseActionController.startAction();
    try {
      return super._validateContato();
    } finally {
      _$_CadastroUsuarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _validateSenha() {
    final _$actionInfo = _$_CadastroUsuarioBaseActionController.startAction();
    try {
      return super._validateSenha();
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
    final string =
        'erro: ${erro.toString()},confirmaSenha: ${confirmaSenha.toString()},hasError: ${hasError.toString()}';
    return '{$string}';
  }
}
