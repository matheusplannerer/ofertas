import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/modules/login/models/erro_login_model.dart';
import 'package:ofertas/app/pages/splash/splash_controller.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  AuthController _auth = Modular.get();
  AppController appController = Modular.get();
  @observable
  String email = '';

  @observable
  String senha = '';

  @observable
  ErroLoginModel erro = ErroLoginModel();

  @observable
  AuthStatus status = AuthStatus.loading;

  @computed
  bool get hasError {
    if (erro.erroEmail || erro.erroLogin || erro.erroSenha) {
      setStatus(AuthStatus.error);
      return true;
    } else {
      return false;
    }
  }

  @action
  void setEmail(String value) => email = value.toLowerCase().trim();

  @action
  void setPass(String value) => senha = value;

  @action
  void setStatus(AuthStatus value) => status = value;

  @action
  void setErro(ErroLoginModel e) => erro = e;

  @action
  void validateFields() {
    _resetErrors();
    _validateSenha();
    _validateEmail();
  }

  @action
  void _validateEmail() {
    bool isValid = EmailValidator.validate(email);
    if (!isValid) {
      setErro(erro.copyWith(
          erroEmail: true, textErroEmail: "Insira um e-mail válido"));
      return;
    }
  }

  @action
  void _validateSenha() {
    if (senha.length < 6) {
      setErro(erro.copyWith(erroSenha: true, textErroSenha: "Senha inválida"));
      return;
    }
  }

  @action
  void _resetErrors() {
    setErro(ErroLoginModel());
  }

  @action
  Future<void> signInWithEmailAndPass() async {
    try {
      FirebaseUser _authInfos =
          await _auth.signInWithEmailAndPass(email, senha);
      UserModel _userInfos = await _auth.getUserInfos(_authInfos.uid);
      appController.setPages([
        appController.feed,
        appController.feedFiltro,
        appController.perfilEmpresa
      ]);
      Modular.to.pushReplacementNamed('/home');
    } catch (e) {
      setErro(erro.setErro(e));
    }
  }

  @action
  Future<void> signInGoogle() async {
    try {
      FirebaseUser _authInfos = await _auth.signInGoogle();
      UserModel _userInfos = await _auth.getUserInfos(_authInfos.uid);
      Modular.to.pushReplacementNamed('/home');
    } catch (e) {
      print("ALGUM ERRO NO SIGNIN GOOGLE");
      print(e.toString());
    }
  }
}
