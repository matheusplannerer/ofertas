// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  Computed<FirebaseUser> _$fbUserComputed;

  @override
  FirebaseUser get fbUser =>
      (_$fbUserComputed ??= Computed<FirebaseUser>(() => super.fbUser)).value;
  Computed<bool> _$signedInComputed;

  @override
  bool get signedIn =>
      (_$signedInComputed ??= Computed<bool>(() => super.signedIn)).value;

  final _$emailAtom = Atom(name: '_AuthControllerBase.email');

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

  final _$senhaAtom = Atom(name: '_AuthControllerBase.senha');

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

  final _$erroEmailAtom = Atom(name: '_AuthControllerBase.erroEmail');

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

  final _$erroSenhaAtom = Atom(name: '_AuthControllerBase.erroSenha');

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

  final _$erroLoginAtom = Atom(name: '_AuthControllerBase.erroLogin');

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

  final _$textErroEmailAtom = Atom(name: '_AuthControllerBase.textErroEmail');

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

  final _$textErroSenhaAtom = Atom(name: '_AuthControllerBase.textErroSenha');

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

  final _$textErroLoginAtom = Atom(name: '_AuthControllerBase.textErroLogin');

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

  final _$statusAtom = Atom(name: '_AuthControllerBase.status');

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

  final _$_fbUserAtom = Atom(name: '_AuthControllerBase._fbUser');

  @override
  FirebaseUser get _fbUser {
    _$_fbUserAtom.context.enforceReadPolicy(_$_fbUserAtom);
    _$_fbUserAtom.reportObserved();
    return super._fbUser;
  }

  @override
  set _fbUser(FirebaseUser value) {
    _$_fbUserAtom.context.conditionallyRunInAction(() {
      super._fbUser = value;
      _$_fbUserAtom.reportChanged();
    }, _$_fbUserAtom, name: '${_$_fbUserAtom.name}_set');
  }

  final _$userAtom = Atom(name: '_AuthControllerBase.user');

  @override
  UserModel get user {
    _$userAtom.context.enforceReadPolicy(_$userAtom);
    _$userAtom.reportObserved();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.context.conditionallyRunInAction(() {
      super.user = value;
      _$userAtom.reportChanged();
    }, _$userAtom, name: '${_$userAtom.name}_set');
  }

  final _$getUserInfosAsyncAction = AsyncAction('getUserInfos');

  @override
  Future<UserModel> getUserInfos() {
    return _$getUserInfosAsyncAction.run(() => super.getUserInfos());
  }

  final _$setFbUserAsyncAction = AsyncAction('setFbUser');

  @override
  Future<FirebaseUser> setFbUser(FirebaseUser value) {
    return _$setFbUserAsyncAction.run(() => super.setFbUser(value));
  }

  final _$loginWithGoogleAsyncAction = AsyncAction('loginWithGoogle');

  @override
  Future<dynamic> loginWithGoogle() {
    return _$loginWithGoogleAsyncAction.run(() => super.loginWithGoogle());
  }

  final _$loginWithEmailAndPasswordAsyncAction =
      AsyncAction('loginWithEmailAndPassword');

  @override
  Future<dynamic> loginWithEmailAndPassword() {
    return _$loginWithEmailAndPasswordAsyncAction
        .run(() => super.loginWithEmailAndPassword());
  }

  final _$signOutAsyncAction = AsyncAction('signOut');

  @override
  Future<dynamic> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction();
    try {
      return super.setEmail(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPass(String value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction();
    try {
      return super.setPass(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUser(UserModel value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction();
    try {
      return super.setUser(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _updateStatus(AuthStatus value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction();
    try {
      return super._updateStatus(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateFields(String email, String pass) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction();
    try {
      return super.validateFields(email, pass);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _validateEmail(String _email) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction();
    try {
      return super._validateEmail(_email);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _validateSenha(String _senha) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction();
    try {
      return super._validateSenha(_senha);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _resetErrors() {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction();
    try {
      return super._resetErrors();
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'email: ${email.toString()},senha: ${senha.toString()},erroEmail: ${erroEmail.toString()},erroSenha: ${erroSenha.toString()},erroLogin: ${erroLogin.toString()},textErroEmail: ${textErroEmail.toString()},textErroSenha: ${textErroSenha.toString()},textErroLogin: ${textErroLogin.toString()},status: ${status.toString()},user: ${user.toString()},fbUser: ${fbUser.toString()},signedIn: ${signedIn.toString()}';
    return '{$string}';
  }
}
