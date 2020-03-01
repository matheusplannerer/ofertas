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

  final _$_nomeCompletoAtom = Atom(name: '_CadastroUsuarioBase._nomeCompleto');

  @override
  String get _nomeCompleto {
    _$_nomeCompletoAtom.context.enforceReadPolicy(_$_nomeCompletoAtom);
    _$_nomeCompletoAtom.reportObserved();
    return super._nomeCompleto;
  }

  @override
  set _nomeCompleto(String value) {
    _$_nomeCompletoAtom.context.conditionallyRunInAction(() {
      super._nomeCompleto = value;
      _$_nomeCompletoAtom.reportChanged();
    }, _$_nomeCompletoAtom, name: '${_$_nomeCompletoAtom.name}_set');
  }

  final _$_emailAtom = Atom(name: '_CadastroUsuarioBase._email');

  @override
  String get _email {
    _$_emailAtom.context.enforceReadPolicy(_$_emailAtom);
    _$_emailAtom.reportObserved();
    return super._email;
  }

  @override
  set _email(String value) {
    _$_emailAtom.context.conditionallyRunInAction(() {
      super._email = value;
      _$_emailAtom.reportChanged();
    }, _$_emailAtom, name: '${_$_emailAtom.name}_set');
  }

  final _$_senhaAtom = Atom(name: '_CadastroUsuarioBase._senha');

  @override
  String get _senha {
    _$_senhaAtom.context.enforceReadPolicy(_$_senhaAtom);
    _$_senhaAtom.reportObserved();
    return super._senha;
  }

  @override
  set _senha(String value) {
    _$_senhaAtom.context.conditionallyRunInAction(() {
      super._senha = value;
      _$_senhaAtom.reportChanged();
    }, _$_senhaAtom, name: '${_$_senhaAtom.name}_set');
  }

  final _$_confirmSenhaAtom = Atom(name: '_CadastroUsuarioBase._confirmSenha');

  @override
  String get _confirmSenha {
    _$_confirmSenhaAtom.context.enforceReadPolicy(_$_confirmSenhaAtom);
    _$_confirmSenhaAtom.reportObserved();
    return super._confirmSenha;
  }

  @override
  set _confirmSenha(String value) {
    _$_confirmSenhaAtom.context.conditionallyRunInAction(() {
      super._confirmSenha = value;
      _$_confirmSenhaAtom.reportChanged();
    }, _$_confirmSenhaAtom, name: '${_$_confirmSenhaAtom.name}_set');
  }

  final _$_contatoAtom = Atom(name: '_CadastroUsuarioBase._contato');

  @override
  String get _contato {
    _$_contatoAtom.context.enforceReadPolicy(_$_contatoAtom);
    _$_contatoAtom.reportObserved();
    return super._contato;
  }

  @override
  set _contato(String value) {
    _$_contatoAtom.context.conditionallyRunInAction(() {
      super._contato = value;
      _$_contatoAtom.reportChanged();
    }, _$_contatoAtom, name: '${_$_contatoAtom.name}_set');
  }

  final _$erroNomeAtom = Atom(name: '_CadastroUsuarioBase.erroNome');

  @override
  bool get erroNome {
    _$erroNomeAtom.context.enforceReadPolicy(_$erroNomeAtom);
    _$erroNomeAtom.reportObserved();
    return super.erroNome;
  }

  @override
  set erroNome(bool value) {
    _$erroNomeAtom.context.conditionallyRunInAction(() {
      super.erroNome = value;
      _$erroNomeAtom.reportChanged();
    }, _$erroNomeAtom, name: '${_$erroNomeAtom.name}_set');
  }

  final _$erroContatoAtom = Atom(name: '_CadastroUsuarioBase.erroContato');

  @override
  bool get erroContato {
    _$erroContatoAtom.context.enforceReadPolicy(_$erroContatoAtom);
    _$erroContatoAtom.reportObserved();
    return super.erroContato;
  }

  @override
  set erroContato(bool value) {
    _$erroContatoAtom.context.conditionallyRunInAction(() {
      super.erroContato = value;
      _$erroContatoAtom.reportChanged();
    }, _$erroContatoAtom, name: '${_$erroContatoAtom.name}_set');
  }

  final _$erroEmailAtom = Atom(name: '_CadastroUsuarioBase.erroEmail');

  @override
  bool get erroEmail {
    _$erroEmailAtom.context.enforceReadPolicy(_$erroEmailAtom);
    _$erroEmailAtom.reportObserved();
    return super.erroEmail;
  }

  @override
  set erroEmail(bool value) {
    _$erroEmailAtom.context.conditionallyRunInAction(() {
      super.erroEmail = value;
      _$erroEmailAtom.reportChanged();
    }, _$erroEmailAtom, name: '${_$erroEmailAtom.name}_set');
  }

  final _$erroSenhaAtom = Atom(name: '_CadastroUsuarioBase.erroSenha');

  @override
  bool get erroSenha {
    _$erroSenhaAtom.context.enforceReadPolicy(_$erroSenhaAtom);
    _$erroSenhaAtom.reportObserved();
    return super.erroSenha;
  }

  @override
  set erroSenha(bool value) {
    _$erroSenhaAtom.context.conditionallyRunInAction(() {
      super.erroSenha = value;
      _$erroSenhaAtom.reportChanged();
    }, _$erroSenhaAtom, name: '${_$erroSenhaAtom.name}_set');
  }

  final _$textErroValidateNomeAtom =
      Atom(name: '_CadastroUsuarioBase.textErroValidateNome');

  @override
  String get textErroValidateNome {
    _$textErroValidateNomeAtom.context
        .enforceReadPolicy(_$textErroValidateNomeAtom);
    _$textErroValidateNomeAtom.reportObserved();
    return super.textErroValidateNome;
  }

  @override
  set textErroValidateNome(String value) {
    _$textErroValidateNomeAtom.context.conditionallyRunInAction(() {
      super.textErroValidateNome = value;
      _$textErroValidateNomeAtom.reportChanged();
    }, _$textErroValidateNomeAtom,
        name: '${_$textErroValidateNomeAtom.name}_set');
  }

  final _$textErroValidateContatoAtom =
      Atom(name: '_CadastroUsuarioBase.textErroValidateContato');

  @override
  String get textErroValidateContato {
    _$textErroValidateContatoAtom.context
        .enforceReadPolicy(_$textErroValidateContatoAtom);
    _$textErroValidateContatoAtom.reportObserved();
    return super.textErroValidateContato;
  }

  @override
  set textErroValidateContato(String value) {
    _$textErroValidateContatoAtom.context.conditionallyRunInAction(() {
      super.textErroValidateContato = value;
      _$textErroValidateContatoAtom.reportChanged();
    }, _$textErroValidateContatoAtom,
        name: '${_$textErroValidateContatoAtom.name}_set');
  }

  final _$textErroValidateEmailAtom =
      Atom(name: '_CadastroUsuarioBase.textErroValidateEmail');

  @override
  String get textErroValidateEmail {
    _$textErroValidateEmailAtom.context
        .enforceReadPolicy(_$textErroValidateEmailAtom);
    _$textErroValidateEmailAtom.reportObserved();
    return super.textErroValidateEmail;
  }

  @override
  set textErroValidateEmail(String value) {
    _$textErroValidateEmailAtom.context.conditionallyRunInAction(() {
      super.textErroValidateEmail = value;
      _$textErroValidateEmailAtom.reportChanged();
    }, _$textErroValidateEmailAtom,
        name: '${_$textErroValidateEmailAtom.name}_set');
  }

  final _$textErroValidateSenhaAtom =
      Atom(name: '_CadastroUsuarioBase.textErroValidateSenha');

  @override
  String get textErroValidateSenha {
    _$textErroValidateSenhaAtom.context
        .enforceReadPolicy(_$textErroValidateSenhaAtom);
    _$textErroValidateSenhaAtom.reportObserved();
    return super.textErroValidateSenha;
  }

  @override
  set textErroValidateSenha(String value) {
    _$textErroValidateSenhaAtom.context.conditionallyRunInAction(() {
      super.textErroValidateSenha = value;
      _$textErroValidateSenhaAtom.reportChanged();
    }, _$textErroValidateSenhaAtom,
        name: '${_$textErroValidateSenhaAtom.name}_set');
  }

  final _$erroCadastroAtom = Atom(name: '_CadastroUsuarioBase.erroCadastro');

  @override
  String get erroCadastro {
    _$erroCadastroAtom.context.enforceReadPolicy(_$erroCadastroAtom);
    _$erroCadastroAtom.reportObserved();
    return super.erroCadastro;
  }

  @override
  set erroCadastro(String value) {
    _$erroCadastroAtom.context.conditionallyRunInAction(() {
      super.erroCadastro = value;
      _$erroCadastroAtom.reportChanged();
    }, _$erroCadastroAtom, name: '${_$erroCadastroAtom.name}_set');
  }

  final _$_CadastroUsuarioBaseActionController =
      ActionController(name: '_CadastroUsuarioBase');

  @override
  void atualizaContato() {
    final _$actionInfo = _$_CadastroUsuarioBaseActionController.startAction();
    try {
      return super.atualizaContato();
    } finally {
      _$_CadastroUsuarioBaseActionController.endAction(_$actionInfo);
    }
  }

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
  bool validateFields() {
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
        'erroNome: ${erroNome.toString()},erroContato: ${erroContato.toString()},erroEmail: ${erroEmail.toString()},erroSenha: ${erroSenha.toString()},textErroValidateNome: ${textErroValidateNome.toString()},textErroValidateContato: ${textErroValidateContato.toString()},textErroValidateEmail: ${textErroValidateEmail.toString()},textErroValidateSenha: ${textErroValidateSenha.toString()},erroCadastro: ${erroCadastro.toString()},hasError: ${hasError.toString()}';
    return '{$string}';
  }
}
