import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/pages/splash/splash_controller.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  AuthController auth = Modular.get();
  AppController appController = Modular.get();
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

  @computed
  bool get hasError {
    if (erroEmail || erroLogin || erroSenha)
      return true;
    else
      return false;
  }

  @action
  void setEmail(String value) => email = value.toLowerCase().trim();

  @action
  void setPass(String value) => senha = value;

  @action
  void setStatus(AuthStatus value) => status = value;

  @action
  Future<bool> loginWithEmailAndPassword() async {
    if (hasError) return false;
    try {
      FirebaseUser _authInfos = await auth.signInWithEmailAndPass(email, senha);
      var _userInfos = await auth.getUserInfos(_authInfos);
      if (_userInfos == null)
        throw PlatformException(code: "ERROR_USER_NOT_FOUND");

      AppController appController = Modular.get();
      appController.signIn(_authInfos, _userInfos);
      setStatus(AuthStatus.signedIn);
      return true;
    } catch (e) {
      var erro = (e as PlatformException);
      if (erro.code == "ERROR_USER_NOT_FOUND") {
        erroEmail = true;
        textErroEmail = "E-mail não cadastrado";
        status = AuthStatus.error;
        return false;
      }

      if (erro.code == "ERROR_WRONG_PASSWORD") {
        erroSenha = true;
        textErroSenha = "Senha inválida";
        status = AuthStatus.error;
        return false;
      }

      if (erro.code is String) {
        erroLogin = true;
        textErroLogin = "Tente novamente mais tarde";
        status = AuthStatus.error;
        return false;
      }

      return false;
    }
  }

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
      erroEmail = true;
      textErroEmail = "Insira um e-mail válido";
      return;
    }
    erroEmail = false;
  }

  @action
  void _validateSenha() {
    if (senha.length < 6) {
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
  Future<FirebaseUser> signInGoogle() async {
    // TODO: implement signInGoogle
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser _authInfos =
        (await auth.signInWithCredential(credential));
    if (_authInfos is FirebaseUser) {
      final UserModel _userInfos = await auth.getUserInfos(_authInfos);
      if (_userInfos == null) {
        UserModel aux = UserModel(
            celular: _authInfos.phoneNumber,
            email: _authInfos.email,
            empresaPerfil: '',
            nome: _authInfos.displayName,
            usuarioID: _authInfos.uid);
        await Firestore.instance
            .collection('usuarios')
            .document(_authInfos.uid)
            .setData(aux.toJson());
      }
      appController.signIn(_authInfos, _userInfos);
      print("signed in " + _authInfos.displayName);
      return _authInfos;
    }
    return null;
  }
}
