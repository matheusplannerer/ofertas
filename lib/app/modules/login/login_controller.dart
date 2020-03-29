import 'package:email_validator/email_validator.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  AuthController _authController = Modular.get();

  //OBSERVABLES
  @observable
  String _email = '';
  @observable
  String _senha = '';

  String get email => _email;
  String get senha => _senha;

  @action
  void setEmail(String value) {
    _email = value.toLowerCase().trim();
    _authController.setEmail(email);
  }

  @action
  void setSenha(String value) {
    _senha = value;
    _authController.setPass(senha);
  }

  @computed
  bool get hasError {
    if (_authController.status == AuthStatus.error ||
        _authController.erroEmail ||
        _authController.erroLogin ||
        _authController.erroSenha) return true;
    return false;
  }

  @computed
  bool get erroSenha => _authController.erroSenha;

  @computed
  bool get erroEmail => _authController.erroEmail;

  @computed
  bool get erroLogin => _authController.erroLogin;

  @computed
  String get textErroSenha => _authController.textErroSenha;

  @computed
  String get textErroEmail => _authController.textErroEmail;

  @computed
  String get textErroLogin => _authController.textErroLogin;

  //ACTIONS

  @action
  Future signInWithEmailAndPass() async {
    await _authController.loginWithEmailAndPassword();
  }

  @action
  void validateFields() {
    _authController.validateFields(email, senha);
  }
}
