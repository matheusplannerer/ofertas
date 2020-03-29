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
  Computed<bool> _$erroSenhaComputed;

  @override
  bool get erroSenha =>
      (_$erroSenhaComputed ??= Computed<bool>(() => super.erroSenha)).value;
  Computed<bool> _$erroEmailComputed;

  @override
  bool get erroEmail =>
      (_$erroEmailComputed ??= Computed<bool>(() => super.erroEmail)).value;
  Computed<bool> _$erroLoginComputed;

  @override
  bool get erroLogin =>
      (_$erroLoginComputed ??= Computed<bool>(() => super.erroLogin)).value;
  Computed<String> _$textErroSenhaComputed;

  @override
  String get textErroSenha =>
      (_$textErroSenhaComputed ??= Computed<String>(() => super.textErroSenha))
          .value;
  Computed<String> _$textErroEmailComputed;

  @override
  String get textErroEmail =>
      (_$textErroEmailComputed ??= Computed<String>(() => super.textErroEmail))
          .value;
  Computed<String> _$textErroLoginComputed;

  @override
  String get textErroLogin =>
      (_$textErroLoginComputed ??= Computed<String>(() => super.textErroLogin))
          .value;

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

  final _$signInWithEmailAndPassAsyncAction =
      AsyncAction('signInWithEmailAndPass');

  @override
  Future<dynamic> signInWithEmailAndPass() {
    return _$signInWithEmailAndPassAsyncAction
        .run(() => super.signInWithEmailAndPass());
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
        'hasError: ${hasError.toString()},erroSenha: ${erroSenha.toString()},erroEmail: ${erroEmail.toString()},erroLogin: ${erroLogin.toString()},textErroSenha: ${textErroSenha.toString()},textErroEmail: ${textErroEmail.toString()},textErroLogin: ${textErroLogin.toString()}';
    return '{$string}';
  }
}
