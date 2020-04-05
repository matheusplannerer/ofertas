import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:mobx/mobx.dart';

part 'solicitar_acesso_controller.g.dart';

class SolicitarAcessoController = _SolicitarAcessoControllerBase
    with _$SolicitarAcessoController;

abstract class _SolicitarAcessoControllerBase with Store {
  @observable
  String nome = '';
  @observable
  String contato = '';
  @observable
  String email = '';
  @observable
  String empresa = '';

  @observable
  bool erroNome = false;
  @observable
  bool erroContato = false;
  @observable
  bool erroEmail = false;
  @observable
  bool erroEmpresa = false;

  @observable
  String textErroNome = '';
  @observable
  String textErroContato = '';
  @observable
  String textErroEmail = '';
  @observable
  String textErroEmpresa = '';

  @computed
  bool get hasError {
    if (erroContato || erroEmail || erroEmpresa || erroNome)
      return true;
    else
      return false;
  }

  @action
  void _resetErrors() {
    erroContato = false;
    erroEmail = false;
    erroEmpresa = false;
    erroNome = false;
  }

  @action
  void validateFields() {
    _resetErrors();
    _validateContato();
    _validateEmail();
    _validateEmpresa();
    _validateNome();
  }

  @action
  void _validateNome() {
    if (nome.length < 3) {
      erroNome = true;
      textErroNome = 'Insira um nome válido';
      return;
    }
  }

  @action
  void _validateContato() {
    if (contato.length < 8) {
      erroContato = true;
      textErroContato = 'Insira um contato válido';
      return;
    }
  }

  @action
  void _validateEmail() {
    erroEmail = !EmailValidator.validate(email);
    if (erroEmail) {
      textErroEmail = "Insira um e-mail válido";
      return;
    }
  }

  @action
  void _validateEmpresa() {
    if (empresa.length < 4) {
      erroEmpresa = true;
      textErroEmpresa = "Insira uma empresa válida";
      return;
    }
    return;
  }

  @action
  void setNome(String value) => nome = value;
  @action
  void setContato(String value) => contato = value;
  @action
  void setEmail(String value) => email = value;
  @action
  void setEmpresa(String value) => empresa = value;

  @action
  Future<bool> sendRequest() async {
    validateFields();
    if (hasError) return false;
    try {
      await _registerRequest();
      return true;
    } catch (e) {
      return false;
    }
  }

  @action
  Future _registerRequest() async {
    var id =
        Firestore.instance.collection('solicitacoes').document().documentID;
    return Firestore.instance.collection('solicitacoes').document(id).setData({
      'nome': nome,
      'contato': contato,
      'email': email,
      'empresa': empresa,
      'id': id
    });
  }
}
