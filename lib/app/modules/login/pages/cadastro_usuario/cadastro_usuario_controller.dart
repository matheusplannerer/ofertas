import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/modules/login/models/erro_cadastro_model.dart';
import 'package:ofertas/app/modules/login/pages/inserir_codigo/inserir_codigo_controller.dart';
import 'package:ofertas/app/pages/splash/splash_controller.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';
import 'package:ofertas/app/shared/repositories/sign_up_user/signup_user_controller.dart';

part 'cadastro_usuario_controller.g.dart';

class CadastroUsuarioController = _CadastroUsuarioBase
    with _$CadastroUsuarioController;

abstract class _CadastroUsuarioBase with Store {
  var maskFormatterCelular = MaskTextInputFormatter(
      mask: '(##)#####-####', filter: {"#": RegExp(r'[0-9]')});

  InserirCodigoController inserirCodigoController = Modular.get();
  SignUpController signUpController = Modular.get();
  AuthController authController = Modular.get();
  AppController appController = Modular.get();

  @observable
  ErroCadastroModel erro = ErroCadastroModel();
  @observable
  UserModel _userInfos = UserModel();
  @observable
  String confirmaSenha;

  @computed
  bool get hasError {
    if (erro.erroContato ||
        erro.erroEmail ||
        erro.erroSenha ||
        erro.erroEmail) {
      return true;
    } else
      return false;
  }

  @action
  void setNome(String value) {
    _userInfos.nome = value.toUpperCase();
  }

  @action
  void setContato(String value) {
    _userInfos.celular = value.trim().toLowerCase();
  }

  @action
  void setEmail(String value) {
    _userInfos.email = value.toLowerCase().trim();
  }

  @action
  void setSenha(String value) {
    _userInfos.senha = value;
  }

  @action
  void setConfirmaSenha(String value) {
    confirmaSenha = value;
  }

  @action
  void _resetErrors() {
    erro = ErroCadastroModel();
  }

  @action
  void _validateNomeCompleto() {
    int numeroLetras = _userInfos.nome.replaceAll(" ", "").length;
    if (_userInfos.nome.contains('0') ||
        _userInfos.nome.contains('1') ||
        _userInfos.nome.contains('2') ||
        _userInfos.nome.contains('3') ||
        _userInfos.nome.contains('4') ||
        _userInfos.nome.contains('5') ||
        _userInfos.nome.contains('6') ||
        _userInfos.nome.contains('7') ||
        _userInfos.nome.contains('8') ||
        _userInfos.nome.contains('9') ||
        _userInfos.nome.length <= 2 ||
        numeroLetras <= 2) {
      erro =
          erro.copyWith(textErroNome: "Insira um nome válido", erroNome: true);
    } else {
      erro = erro.copyWith(erroNome: false);
    }
  }

  @action
  void _validateEmail() {
    bool isValid = EmailValidator.validate(_userInfos.email);
    if (!isValid) {
      erro = erro.copyWith(
          textErroEmail: "Insira um e-mail válido", erroEmail: true);
    } else {
      erro = erro.copyWith(erroEmail: false);
    }
  }

  @action
  void _validateContato() {
    if (_userInfos.celular.length <= 7) {
      erro = erro.copyWith(
          erroContato: true, textErroContato: "Insira um contato válido");
    } else {
      erro = erro.copyWith(erroContato: false);
    }
  }

  @action
  void _validateSenha() {
    if (_userInfos.senha != confirmaSenha) {
      erro = erro.copyWith(
          erroSenha: true, textErroSenha: "As senhas não coincidem");
      return;
    }

    if (_userInfos.senha.length < 6) {
      print('SENHA FRACA');
      erro = erro.copyWith(
          erroSenha: true, textErroSenha: "Insira uma senha mais forte");
      return;
    }

    erro = erro.copyWith(erroSenha: false);
  }

  @action
  void validateFields() {
    _resetErrors();
    _validateSenha();
    _validateContato();
    _validateEmail();
    _validateNomeCompleto();
  }

  @action
  Future<FirebaseUser> signUp() async {
    try {
      var _authInfos =
          await signUpController.createUserWithEmailAndPassword(_userInfos);
      _userInfos.id = _authInfos.uid;
      await signUpController.createUserCollection(_userInfos);
      await signUpController.updateSolicitacoesAceitas(
          _userInfos, inserirCodigoController.verificationId);
      appController.setPages([
        appController.feed,
        appController.feedFiltro,
        appController.perfilEmpresa,
      ]);
      authController.setAuthInfos(_authInfos);
      authController.setUserInfos(_userInfos);
      authController.setStatus(AuthStatus.signedIn);
      Modular.to.pushReplacementNamed('/home');
      return _authInfos;
    } catch (e) {
      erro = erro.setErro(e);
      authController.setStatus(AuthStatus.signedOff);
      return null;
    }
  }
}
