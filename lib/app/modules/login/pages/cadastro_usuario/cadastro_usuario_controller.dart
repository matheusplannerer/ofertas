import 'package:email_validator/email_validator.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';
import 'package:ofertas/app/shared/repositories/sign_up_user/signup_user_controller.dart';

part 'cadastro_usuario_controller.g.dart';

class CadastroUsuarioController = _CadastroUsuarioBase
    with _$CadastroUsuarioController;

abstract class _CadastroUsuarioBase with Store {
  var maskFormatterCelular = MaskTextInputFormatter(
      mask: '(##)#####-####', filter: {"#": RegExp(r'[0-9]')});

  SignUpController signUpController = Modular.get();
  AuthController authController = Modular.get();

  @action
  void setNome(String value) {
    signUpController.setNome(value);
  }

  @action
  void setContato(String value) {
    signUpController.setContato(value);
  }

  @action
  void setEmail(String value) {
    signUpController.setEmail(value);
  }

  @action
  void setSenha(String value) {
    signUpController.setSenha(value);
  }

  @action
  void setConfirmaSenha(String value) {
    signUpController.setConfirmaSenha(value);
  }

  @action
  void setErroCadastro(String value) {
    signUpController.setErroCadastro(value);
  }

  @action
  void validateFields() {
    signUpController.validateFields();
  }

  @computed
  bool get hasError {
    if (signUpController.hasError) return true;

    return false;
  }
}
