// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inserir_codigo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InserirCodigoController on _InserirCodigoControllerBase, Store {
  Computed<String> _$emailComputed;

  @override
  String get email =>
      (_$emailComputed ??= Computed<String>(() => super.email)).value;
  Computed<String> _$verificationIdComputed;

  @override
  String get verificationId => (_$verificationIdComputed ??=
          Computed<String>(() => super.verificationId))
      .value;
  Computed<bool> _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError)).value;

  final _$_emailAtom = Atom(name: '_InserirCodigoControllerBase._email');

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

  final _$_verificationIdAtom =
      Atom(name: '_InserirCodigoControllerBase._verificationId');

  @override
  String get _verificationId {
    _$_verificationIdAtom.context.enforceReadPolicy(_$_verificationIdAtom);
    _$_verificationIdAtom.reportObserved();
    return super._verificationId;
  }

  @override
  set _verificationId(String value) {
    _$_verificationIdAtom.context.conditionallyRunInAction(() {
      super._verificationId = value;
      _$_verificationIdAtom.reportChanged();
    }, _$_verificationIdAtom, name: '${_$_verificationIdAtom.name}_set');
  }

  final _$erroEmailAtom = Atom(name: '_InserirCodigoControllerBase.erroEmail');

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

  final _$erroIdAtom = Atom(name: '_InserirCodigoControllerBase.erroId');

  @override
  bool get erroId {
    _$erroIdAtom.context.enforceReadPolicy(_$erroIdAtom);
    _$erroIdAtom.reportObserved();
    return super.erroId;
  }

  @override
  set erroId(bool value) {
    _$erroIdAtom.context.conditionallyRunInAction(() {
      super.erroId = value;
      _$erroIdAtom.reportChanged();
    }, _$erroIdAtom, name: '${_$erroIdAtom.name}_set');
  }

  final _$textErroEmailAtom =
      Atom(name: '_InserirCodigoControllerBase.textErroEmail');

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

  final _$textErroIdAtom =
      Atom(name: '_InserirCodigoControllerBase.textErroId');

  @override
  String get textErroId {
    _$textErroIdAtom.context.enforceReadPolicy(_$textErroIdAtom);
    _$textErroIdAtom.reportObserved();
    return super.textErroId;
  }

  @override
  set textErroId(String value) {
    _$textErroIdAtom.context.conditionallyRunInAction(() {
      super.textErroId = value;
      _$textErroIdAtom.reportChanged();
    }, _$textErroIdAtom, name: '${_$textErroIdAtom.name}_set');
  }

  final _$validateIdAsyncAction = AsyncAction('validateId');

  @override
  Future<dynamic> validateId() {
    return _$validateIdAsyncAction.run(() => super.validateId());
  }

  final _$_InserirCodigoControllerBaseActionController =
      ActionController(name: '_InserirCodigoControllerBase');

  @override
  void setEmail(String value) {
    final _$actionInfo =
        _$_InserirCodigoControllerBaseActionController.startAction();
    try {
      return super.setEmail(value);
    } finally {
      _$_InserirCodigoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVerificationId(String value) {
    final _$actionInfo =
        _$_InserirCodigoControllerBaseActionController.startAction();
    try {
      return super.setVerificationId(value);
    } finally {
      _$_InserirCodigoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _resetErrors() {
    final _$actionInfo =
        _$_InserirCodigoControllerBaseActionController.startAction();
    try {
      return super._resetErrors();
    } finally {
      _$_InserirCodigoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail() {
    final _$actionInfo =
        _$_InserirCodigoControllerBaseActionController.startAction();
    try {
      return super.validateEmail();
    } finally {
      _$_InserirCodigoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _validateEmail() {
    final _$actionInfo =
        _$_InserirCodigoControllerBaseActionController.startAction();
    try {
      return super._validateEmail();
    } finally {
      _$_InserirCodigoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'erroEmail: ${erroEmail.toString()},erroId: ${erroId.toString()},textErroEmail: ${textErroEmail.toString()},textErroId: ${textErroId.toString()},email: ${email.toString()},verificationId: ${verificationId.toString()},hasError: ${hasError.toString()}';
    return '{$string}';
  }
}
