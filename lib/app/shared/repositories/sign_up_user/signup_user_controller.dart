import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';
import 'package:ofertas/app/shared/repositories/sign_up_user/repositories/signup_user_repository_interface.dart';
part 'signup_user_controller.g.dart';

class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  ISignUpRepository _signUpRepository = Modular.get();

  UserModel usuario = UserModel();

  @observable
  String _nomeCompleto = '';
  @observable
  String _email = '';
  @observable
  String _senha = '';
  @observable
  String _confirmSenha = '';
  @observable
  String _contato = '';

  @observable
  bool erroNome = false;
  @observable
  bool erroContato = false;
  @observable
  bool erroEmail = false;
  @observable
  bool erroSenha = false;

  @observable
  String textErroValidateNome = '';
  @observable
  String textErroValidateContato = '';
  @observable
  String textErroValidateEmail = '';
  @observable
  String textErroValidateSenha = '';

  @observable
  String erroCadastro = '';

  @computed
  bool get hasError {
    if (erroSenha || erroContato || erroEmail || erroNome) return true;

    return false;
  }

  String get nome => _nomeCompleto;
  String get email => _email;
  String get senha => _senha;
  String get confirmSenha => _confirmSenha;
  String get contato => _contato;

  @action
  void _atualizaContato() {
    usuario.nome = _nomeCompleto.toUpperCase();
    usuario.celular = _contato;
    usuario.email = _email.toLowerCase();
    usuario.senha = _senha;
  }

  @action
  Future<FirebaseUser> createUserWithEmailAndPass() async {
    try {
      var fbUser =
          await _signUpRepository.createUserWithEmailAndPassword(email, senha);
      fbUser.sendEmailVerification();
      usuario.usuarioID = fbUser.uid;
      await _signUpRepository.createUserCollection(usuario);
      AppController appController = Modular.get();
      appController.signIn(fbUser, usuario);
      return fbUser;
    } catch (e) {
      PlatformException erro = (e as PlatformException);
      if (erro.code == "ERROR_WEAK_PASSWORD") {
        erroSenha = true;
        textErroValidateSenha = 'Senha fraca';
        return null;
      }

      if (erro.code == "ERROR_INVALID_EMAIL") {
        erroEmail = true;
        textErroValidateEmail = "E-mail inválido";
        return null;
      }

      if (erro.code == "ERROR_EMAIL_ALREADY_IN_USE") {
        erroEmail = true;
        textErroValidateEmail = "E-mail já está em uso";
        return null;
      }
      return null;
    }
    // return;
  }

  @action
  void _resetErrors() {
    erroContato = false;
    erroEmail = false;
    erroNome = false;
    erroSenha = false;
  }

  @action
  void setNome(String value) {
    _nomeCompleto = value.toUpperCase();
  }

  @action
  void setContato(String value) {
    _contato = value;
  }

  @action
  void setEmail(String value) {
    _email = value.toLowerCase();
  }

  @action
  void setSenha(String value) {
    _senha = value;
  }

  @action
  void setConfirmaSenha(String value) {
    _confirmSenha = value;
  }

  @action
  void setErroCadastro(String value) {
    erroCadastro = value;
  }

  @action
  void _validateNomeCompleto() {
    int numeroLetras = _nomeCompleto.replaceAll(" ", "").length;
    if (_nomeCompleto.contains('0') ||
        _nomeCompleto.contains('1') ||
        _nomeCompleto.contains('2') ||
        _nomeCompleto.contains('3') ||
        _nomeCompleto.contains('4') ||
        _nomeCompleto.contains('5') ||
        _nomeCompleto.contains('6') ||
        _nomeCompleto.contains('7') ||
        _nomeCompleto.contains('8') ||
        _nomeCompleto.contains('9') ||
        _nomeCompleto.length <= 2 ||
        numeroLetras <= 2) {
      textErroValidateNome = 'Insira um nome válido';
      erroNome = true;
    } else {
      erroNome = false;
    }
  }

  @action
  void _validateEmail() {
    bool isValid = EmailValidator.validate(_email);
    if (!isValid) {
      textErroValidateEmail = 'Insira um e-mail válido';
      erroEmail = true;
    } else {
      erroEmail = false;
    }
  }

  @action
  void _validateContato() {
    if (_contato.length <= 5) {
      erroContato = true;
      textErroValidateContato = 'Insira um contato válido';
    } else {
      erroContato = false;
    }
  }

  @action
  void _validateSenha() {
    if (_senha != _confirmSenha) {
      erroSenha = true;
      textErroValidateSenha = 'As senhas não coincidem';
      return;
    }

    if (_senha.length < 6) {
      print('SENHA RUIM');
      erroSenha = true;
      textErroValidateSenha = 'Senha fraca';
      return;
    }

    erroSenha = false;
    textErroValidateSenha = '';
  }

  @action
  void validateFields() {
    _resetErrors();
    _atualizaContato();
    _validateSenha();
    _validateContato();
    _validateEmail();
    _validateNomeCompleto();
  }
}
