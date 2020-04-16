import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/repositories/sign_up_user/repositories/signup_user_repository.dart';

part 'inserir_codigo_controller.g.dart';

class InserirCodigoController = _InserirCodigoControllerBase
    with _$InserirCodigoController;

abstract class _InserirCodigoControllerBase with Store {
  SignUpRepository _signUp = Modular.get();

  @observable
  String _email = '';
  @observable
  String _verificationId = '';

  @computed
  String get email => _email;
  @computed
  String get verificationId => _verificationId;

  @observable
  bool erroEmail = false;
  @observable
  bool erroId = false;

  @observable
  String textErroEmail;
  @observable
  String textErroId;

  @computed
  bool get hasError {
    if (erroEmail || erroId)
      return true;
    else
      return false;
  }

  @action
  void setEmail(String value) => _email = value;
  @action
  void setVerificationId(String value) => _verificationId = value;

  @action
  void _resetErrors() {
    erroEmail = false;
    erroId = false;
  }

  @action
  void validateEmail() {
    _resetErrors();
    _validateEmail();
  }

  @action
  void _validateEmail() {
    var isValid = EmailValidator.validate(_email);
    if (isValid) {
      erroEmail = false;
      return;
    } else {
      erroEmail = true;
      textErroEmail = "Insira um e-mail válido";
    }
  }

  @action
  Future validateId() async {
    try {
      var isValid =
          await _signUp.validateVerificationID(_email, _verificationId);
      if (isValid)
        return;
      else {
        erroId = true;
        textErroId = "ID inserido inválido";
      }
    } catch (e) {
      if (e.code == "EMAIL_NOT_FOUND") {
        erroEmail = true;
        textErroEmail = "E-mail cadastrado não encontrado";
      }
      if (e.code == "EMAIL_ALREADY_REGISTERED") {
        erroEmail = true;
        textErroEmail = "E-mail já cadastrado";
      }
      return;
    }
  }
}
