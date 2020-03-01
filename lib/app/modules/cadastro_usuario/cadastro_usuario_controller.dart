import 'package:email_validator/email_validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/models/user_model.dart';

part 'cadastro_usuario_controller.g.dart';

class CadastroUsuarioController = _CadastroUsuarioBase
    with _$CadastroUsuarioController;

abstract class _CadastroUsuarioBase with Store {
  var maskFormatterCelular = MaskTextInputFormatter(
      mask: '###########', filter: {"#": RegExp(r'[0-9]')});

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

  @action
  void atualizaContato() {
    usuario.nome = _nomeCompleto.toUpperCase();
    usuario.celular = _contato;
    usuario.email = _email.toLowerCase();
    usuario.senha = _senha;
  }

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

  String get nome => _nomeCompleto;
  String get email => _email;
  String get senha => _senha;
  String get confirmSenha => _confirmSenha;
  String get contato => _contato;

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
      textErroValidateSenha = 'Senha muito fraca';
      return;
    }

    erroSenha = false;
    textErroValidateSenha = '';
  }

  @action
  bool validateFields() {
    _validateSenha();
    _validateContato();
    _validateEmail();
    _validateNomeCompleto();
  }

  @computed
  bool get hasError {
    if (erroSenha || erroContato || erroEmail || erroNome) return true;

    return false;
  }
}
