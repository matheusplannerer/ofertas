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

  final _$erroAtom = Atom(name: '_LoginBase.erro');

  @override
  ErroLoginModel get erro {
    _$erroAtom.context.enforceReadPolicy(_$erroAtom);
    _$erroAtom.reportObserved();
    return super.erro;
  }

  @override
  set erro(ErroLoginModel value) {
    _$erroAtom.context.conditionallyRunInAction(() {
      super.erro = value;
      _$erroAtom.reportChanged();
    }, _$erroAtom, name: '${_$erroAtom.name}_set');
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

  final _$signInWithEmailAndPassAsyncAction =
      AsyncAction('signInWithEmailAndPass');

  @override
  Future<void> signInWithEmailAndPass() {
    return _$signInWithEmailAndPassAsyncAction
        .run(() => super.signInWithEmailAndPass());
  }

  final _$signInGoogleAsyncAction = AsyncAction('signInGoogle');

  @override
  Future<void> signInGoogle() {
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
  void setErro(ErroLoginModel e) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.setErro(e);
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
        'email: ${email.toString()},senha: ${senha.toString()},erro: ${erro.toString()},status: ${status.toString()},hasError: ${hasError.toString()}';
    return '{$string}';
  }
}
