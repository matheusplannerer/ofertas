// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginBase, Store {
  Computed<bool> _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError)).value;

  final _$_emailAtom = Atom(name: '_LoginBase._email');

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

  final _$_senhaAtom = Atom(name: '_LoginBase._senha');

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

  final _$erroEmailAtom = Atom(name: '_LoginBase.erroEmail');

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

  final _$erroSenhaAtom = Atom(name: '_LoginBase.erroSenha');

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

  final _$erroLoginAtom = Atom(name: '_LoginBase.erroLogin');

  @override
  bool get erroLogin {
    _$erroLoginAtom.context.enforceReadPolicy(_$erroLoginAtom);
    _$erroLoginAtom.reportObserved();
    return super.erroLogin;
  }

  @override
  set erroLogin(bool value) {
    _$erroLoginAtom.context.conditionallyRunInAction(() {
      super.erroLogin = value;
      _$erroLoginAtom.reportChanged();
    }, _$erroLoginAtom, name: '${_$erroLoginAtom.name}_set');
  }

  final _$textErroEmailAtom = Atom(name: '_LoginBase.textErroEmail');

  @override
  String get textErroEmail {
    _$textErroEmailAtom.context.enforceReadPolicy(_$textErroEmailAtom);
    _$textErroEmailAtom.reportObserved();
    return super.textErroEmail;
  }

  @override
  set textErroEmail(String value) {
    _$textErroEmailAtom.context.conditionallyRunInAction(() {
      super.textErroEmail = value;
      _$textErroEmailAtom.reportChanged();
    }, _$textErroEmailAtom, name: '${_$textErroEmailAtom.name}_set');
  }

  final _$textErroSenhaAtom = Atom(name: '_LoginBase.textErroSenha');

  @override
  String get textErroSenha {
    _$textErroSenhaAtom.context.enforceReadPolicy(_$textErroSenhaAtom);
    _$textErroSenhaAtom.reportObserved();
    return super.textErroSenha;
  }

  @override
  set textErroSenha(String value) {
    _$textErroSenhaAtom.context.conditionallyRunInAction(() {
      super.textErroSenha = value;
      _$textErroSenhaAtom.reportChanged();
    }, _$textErroSenhaAtom, name: '${_$textErroSenhaAtom.name}_set');
  }

  final _$textErroLoginAtom = Atom(name: '_LoginBase.textErroLogin');

  @override
  String get textErroLogin {
    _$textErroLoginAtom.context.enforceReadPolicy(_$textErroLoginAtom);
    _$textErroLoginAtom.reportObserved();
    return super.textErroLogin;
  }

  @override
  set textErroLogin(String value) {
    _$textErroLoginAtom.context.conditionallyRunInAction(() {
      super.textErroLogin = value;
      _$textErroLoginAtom.reportChanged();
    }, _$textErroLoginAtom, name: '${_$textErroLoginAtom.name}_set');
  }

  final _$_LoginBaseActionController = ActionController(name: '_LoginBase');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String value) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.setSenha(value);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErroLogin(String value) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.setErroLogin(value);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _validateEmail() {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super._validateEmail();
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _validateSenha() {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super._validateSenha();
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateFields() {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.validateFields();
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'erroEmail: ${erroEmail.toString()},erroSenha: ${erroSenha.toString()},erroLogin: ${erroLogin.toString()},textErroEmail: ${textErroEmail.toString()},textErroSenha: ${textErroSenha.toString()},textErroLogin: ${textErroLogin.toString()},hasError: ${hasError.toString()}';
    return '{$string}';
  }
}
