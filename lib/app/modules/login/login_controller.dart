import 'package:email_validator/email_validator.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  //OBSERVABLES
  @observable
  String _email = '';
  @observable
  String _senha = '';

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

  String get email => _email;
  String get senha => _senha;

  @computed
  bool get hasError {
    if (erroEmail || erroSenha || erroLogin) return true;
    return false;
  }

  //ACTIONS

  @action
  void setEmail(String value) {
    _email = value.toLowerCase().trim();
  }

  @action
  void setSenha(String value) {
    _senha = value;
  }

  @action
  void setErroLogin(String value) {
    erroLogin = true;
    textErroLogin = value;
  }

  @action
  void _validateEmail() {
    bool isValid = EmailValidator.validate(_email);
    if (!isValid) {
      erroEmail = true;
      textErroEmail = "Insira um e-mail válido";
      return;
    }

    erroEmail = false;
  }

  @action
  void _validateSenha() {
    if (_senha.length < 6) {
      erroSenha = true;
      textErroSenha = "Senha inválida";
      return;
    }
    erroSenha = false;
  }

  @action
  void validateFields() {
    erroLogin = false;
    _validateSenha();
    _validateEmail();
  }
}
