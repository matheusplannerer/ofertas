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

  final _$emailAtom = Atom(name: '_LoginBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$senhaAtom = Atom(name: '_LoginBase.senha');

  @override
  String get senha {
    _$senhaAtom.context.enforceReadPolicy(_$senhaAtom);
    _$senhaAtom.reportObserved();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.context.conditionallyRunInAction(() {
      super.senha = value;
      _$senhaAtom.reportChanged();
    }, _$senhaAtom, name: '${_$senhaAtom.name}_set');
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

  final _$statusAtom = Atom(name: '_LoginBase.status');

  @override
  AuthStatus get status {
    _$statusAtom.context.enforceReadPolicy(_$statusAtom);
    _$statusAtom.reportObserved();
    return super.status;
  }

  @override
  set status(AuthStatus value) {
    _$statusAtom.context.conditionallyRunInAction(() {
      super.status = value;
      _$statusAtom.reportChanged();
    }, _$statusAtom, name: '${_$statusAtom.name}_set');
  }

  final _$loginWithEmailAndPasswordAsyncAction =
      AsyncAction('loginWithEmailAndPassword');

  @override
  Future<bool> loginWithEmailAndPassword() {
    return _$loginWithEmailAndPasswordAsyncAction
        .run(() => super.loginWithEmailAndPassword());
  }

  final _$signInGoogleAsyncAction = AsyncAction('signInGoogle');

  @override
  Future<FirebaseUser> signInGoogle() {
    return _$signInGoogleAsyncAction.run(() => super.signInGoogle());
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
  void setPass(String value) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.setPass(value);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatus(AuthStatus value) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.setStatus(value);
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
  void _resetErrors() {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super._resetErrors();
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'email: ${email.toString()},senha: ${senha.toString()},erroEmail: ${erroEmail.toString()},erroSenha: ${erroSenha.toString()},erroLogin: ${erroLogin.toString()},textErroEmail: ${textErroEmail.toString()},textErroSenha: ${textErroSenha.toString()},textErroLogin: ${textErroLogin.toString()},status: ${status.toString()},hasError: ${hasError.toString()}';
    return '{$string}';
  }
}
