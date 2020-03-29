import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
import 'package:ofertas/app/shared/repositories/auth/repositories/auth_repository_interface.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _authRepository = Modular.get();

  _AuthControllerBase() {
    _authRepository
        .getUser()
        .then(setFbUser)
        .then(_authRepository.getUserInfos)
        .then(setUser)
        .then((data) {
      if (fbUser != null && user != null)
        _updateStatus(AuthStatus.loggedIn);
      else
        _updateStatus(AuthStatus.loggedOff);
    }).catchError((e) {
      _updateStatus(AuthStatus.error);
      print("ERRO");
    });
  }

  @observable
  String email;

  @observable
  String senha;

  @observable
  bool erroEmail = false;
  @observable
  bool erroSenha = false;
  @observable
  bool erroLogin = false;

  @observable
  String textErroEmail = '';
  @observable
  String textErroSenha = '';
  @observable
  String textErroLogin = '';

  @observable
  AuthStatus status = AuthStatus.loading;

  @observable
  FirebaseUser _fbUser;

  @observable
  UserModel user;

  @computed
  FirebaseUser get fbUser => _fbUser;

  @computed
  bool get signedIn => fbUser != null ? true : false;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPass(String value) => senha = value;

  @action
  void setUser(UserModel value) => user = value;

  @action
  Future<UserModel> getUserInfos() async {
    var userModel = await _authRepository.getUserInfos(fbUser);
    setUser(userModel);
    return userModel;
  }

  @action
  Future<FirebaseUser> setFbUser(FirebaseUser value) async {
    _fbUser = value;
    if (fbUser != null) {
      return value;
    } else {
      return null;
    }
  }

  @action
  Future loginWithGoogle() async {
    setFbUser(await _authRepository.signInGoogle());
    _updateStatus(AuthStatus.loggedIn);
  }

  @action
  void _updateStatus(AuthStatus value) {
    status = value;
  }

  @action
  Future loginWithEmailAndPassword() async {
    try {
      FirebaseUser fb =
          await _authRepository.signInEmailAndPassword(email, senha);
      setFbUser(fb);
      var userAux = await _authRepository.getUserInfos(fbUser);
      setUser(userAux);
      _updateStatus(AuthStatus.loggedIn);
    } catch (e) {
      var erro = (e as PlatformException);
      if (erro.code == "ERROR_USER_NOT_FOUND") {
        erroEmail = true;
        textErroEmail = "E-mail não cadastrado";
        status = AuthStatus.error;
        return;
      }

      if (erro.code == "ERROR_WRONG_PASSWORD") {
        erroSenha = true;
        textErroSenha = "Senha inválida";
        status = AuthStatus.error;
        return;
      }

      if (erro.code is String) {
        erroLogin = true;
        textErroLogin = "Tente novamente mais tarde";
        status = AuthStatus.error;
        return;
      }

      _resetErrors();
    }
  }

  @action
  void validateFields(String email, String pass) {
    setEmail(email);
    setPass(pass);
    erroLogin = false;
    _validateSenha(senha);
    _validateEmail(email);
  }

  @action
  void _validateEmail(String _email) {
    bool isValid = EmailValidator.validate(email);
    if (!isValid) {
      erroEmail = true;
      textErroEmail = "Insira um e-mail válido";
      return;
    }
    erroEmail = false;
  }

  @action
  void _validateSenha(String _senha) {
    if (_senha.length < 6) {
      erroSenha = true;
      textErroSenha = "Senha inválida";
      return;
    }
    erroSenha = false;
  }

  @action
  void _resetErrors() {
    erroEmail = false;
    erroSenha = false;
    erroLogin = false;
  }

  @action
  Future signOut() async {
    await _authRepository.signOut();
    setFbUser(null);
  }
}

enum AuthStatus { loading, loggedIn, loggedOff, error }
