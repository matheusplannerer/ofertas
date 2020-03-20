import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';

part 'cadastro_empresa_controller.g.dart';

class CadastroEmpresaController = _CadastroEmpresaBase
    with _$CadastroEmpresaController;

abstract class _CadastroEmpresaBase with Store {
//Mascaras
  var maskCep = MaskTextInputFormatter(
      filter: {"#": RegExp(r'[0-9]')}, mask: "#####-###");

  var maskTelefone = MaskTextInputFormatter(
      filter: {"#": RegExp(r'[0-9]')}, mask: "###########");

  List<String> categorias = [
    "Agro, Comércio e Indústria",
    "Alimentos e Bebidas",
    "Animais",
    "Antiguidades",
    "Arte e Artesanato",
    "Artigos Religiosos",
    "Bebes",
    "Brinquedos",
    "Calçados, Roupas e Bolsas",
    "Câmeras e Acessorios",
    "Casa, Móveis e Decoração",
    "Celular e Telefone",
    "Coleções e Comics",
    "Construção",
    "Diversos e Outros",
    "Educação",
    "Eletrônicos",
    "Eletrodomésticos",
    "Esportes",
    "Festas e Eventos",
    "Filme e seriados",
    "Gráficas e Impressão",
    "Games e Jogos",
    "Informática",
    "Imóveis",
    "Jóias e Relógios",
    "Limpeza",
    "Livros",
    "Marketing e Internet",
    "Motoristas Particulares",
    "Música",
    "Saúde e Beleza",
    "Uso Pessoal",
    "Utensílios Domésticos",
    "Veículos",
    "Viagens e Turismo"
  ];

  List<DropdownMenuItem> categoriasAux = [];

  _CadastroEmpresaBase() {
    for (var i = 0; i < categorias.length; i++) {
      DropdownMenuItem<String> aux = DropdownMenuItem<String>(
        child: Text(categorias[i]),
        value: categorias[i],
      );

      categoriasAux.add(aux);
    }
  }

//Observables
  @observable
  TextEditingController nomeUnidadeController = TextEditingController();
  @observable
  TextEditingController tipoController = TextEditingController();
  @observable
  TextEditingController cepController = TextEditingController();
  @observable
  TextEditingController logradouroController = TextEditingController();
  @observable
  TextEditingController bairroController = TextEditingController();
  @observable
  TextEditingController estadoController = TextEditingController();
  @observable
  TextEditingController numeroController = TextEditingController();
  @observable
  TextEditingController complementoController = TextEditingController();
  @observable
  TextEditingController telefoneController = TextEditingController();
  @observable
  TextEditingController emailController = TextEditingController();
  @observable
  TextEditingController siteController = TextEditingController();

  @observable
  PerfilEmpresaModel cadastro = PerfilEmpresaModel();
  @observable
  String _nomeUnidade = '';
  @observable
  String _tipo;
  @observable
  String _cep = '';
  @observable
  String _logradouro = '';
  @observable
  String _bairro = '';
  @observable
  String _estado = '';
  @observable
  String _numero = '';
  @observable
  String _complemento = '';
  @observable
  String _telefone = '';
  @observable
  String _email = '';
  @observable
  String _site = '';

  @computed
  String get nomeUnidade => _nomeUnidade;
  @computed
  String get tipo => _tipo;
  @computed
  String get cep => _cep;
  @computed
  String get logradouro => _logradouro;
  @computed
  String get bairro => _bairro;
  @computed
  String get estado => _estado;
  @computed
  String get numero => _numero;
  @computed
  String get complemento => _complemento;
  @computed
  String get telefone => _telefone;
  @computed
  String get email => _email;
  @computed
  String get site => _site;
  @computed
  bool get hasError {
    if (erroBairro ||
        erroCep ||
        erroComplemento ||
        erroEmail ||
        erroEstado ||
        erroLogradouro ||
        erroNomeUnidade ||
        erroNumero ||
        erroSite ||
        erroTelefone ||
        erroTipo) {
      return true;
    }
    return false;
  }

  @observable
  String textErroNomeUnidade = '';
  @observable
  String textErroTipo = '';
  @observable
  String textErroCep = '';
  @observable
  String textErroLogradouro = '';
  @observable
  String textErroBairro = '';
  @observable
  String textErroEstado = '';
  @observable
  String textErroNumero = '';
  @observable
  String textErroComplemento = '';
  @observable
  String textErroTelefone = '';
  @observable
  String textErroEmail = '';
  @observable
  String textErroSite = '';

  @observable
  bool erroNomeUnidade = false;
  @observable
  bool erroTipo = false;
  @observable
  bool erroCep = false;
  @observable
  bool erroLogradouro = false;
  @observable
  bool erroBairro = false;
  @observable
  bool erroEstado = false;
  @observable
  bool erroNumero = false;
  @observable
  bool erroComplemento = false;
  @observable
  bool erroTelefone = false;
  @observable
  bool erroEmail = false;
  @observable
  bool erroSite = false;

//Actions

  @action
  void setNomeUnidade(String value) {
    _nomeUnidade = value;
    // nomeUnidadeController = TextEditingController(text: _nomeUnidade);
    // cadastro = PerfilEmpresaModel.fromObj(cadastro);
  }

  @action
  void setTipo(String value) {
    _tipo = value;
  }

  @action
  void setCep(String value) {
    _cep = value;
    // cepController = TextEditingController(text: _cep);
    // cadastro = PerfilEmpresaModel.fromObj(cadastro);
  }

  @action
  void setLogradouro(String value) {
    _logradouro = value;
    // logradouroController = TextEditingController(text: _logradouro);
    // cadastro = PerfilEmpresaModel.fromObj(cadastro);
  }

  @action
  void setBairro(String value) {
    _bairro = value;
    // bairroController = TextEditingController(text: _bairro);
    // cadastro = PerfilEmpresaModel.fromObj(cadastro);
  }

  @action
  void setEstado(String value) {
    _estado = value;
    // estadoController = TextEditingController(text: _estado);
    // cadastro = PerfilEmpresaModel.fromObj(cadastro);
  }

  @action
  void setNumero(String value) {
    _numero = value;
    // numeroController = TextEditingController(text: _numero);
    // cadastro = PerfilEmpresaModel.fromObj(cadastro);
  }

  @action
  void setComplemento(String value) {
    _complemento = value;
    // complementoController = TextEditingController(text: _complemento);
    // cadastro = PerfilEmpresaModel.fromObj(cadastro);
  }

  @action
  void setTelefone(String value) {
    _telefone = value;
    // telefoneController = TextEditingController(text: _telefone);
    // cadastro = PerfilEmpresaModel.fromObj(cadastro);
  }

  @action
  void setEmail(String value) {
    _email = value;
    // emailController = TextEditingController(text: _email);
    // cadastro = PerfilEmpresaModel.fromObj(cadastro);
  }

  @action
  void setSite(String value) {
    _site = value;
    // siteController = TextEditingController(text: _site);
    // cadastro = PerfilEmpresaModel.fromObj(cadastro);
  }

  @action
  void validateNomeUnidade() {
    if (_nomeUnidade.length < 3) {
      erroNomeUnidade = true;
      textErroNomeUnidade = 'Mínimo de 3 caracteres';
    } else {
      erroNomeUnidade = false;
      textErroNomeUnidade = '';
    }
  }

  @action
  void validateLogradouro() {
    if (_logradouro.length < 3) {
      erroLogradouro = true;
      textErroLogradouro = 'Mínimo de 3 caracteres';
    } else {
      erroLogradouro = false;
      textErroLogradouro = '';
    }
  }

  @action
  void validateBairro() {
    if (_bairro.length < 3) {
      erroBairro = true;
      textErroBairro = 'Mínimo de 3 caracteres';
    } else {
      erroBairro = false;
      textErroBairro = '';
    }
  }

  @action
  void validateEstado() {
    if (_estado.length != 2) {
      erroEstado = true;
      textErroEstado = 'Ex: "SP"';
    } else {
      erroEstado = false;
      textErroEstado = '';
    }
  }

  @action
  void validateNumero() {
    if (_numero.length == 0) {
      erroNumero = true;
      textErroNumero = 'Insira um número válido';
    } else {
      erroNumero = false;
      textErroNumero = '';
    }
  }

  @action
  void validateComplemento() {}

  @action
  void validateTelefone() {
    if (_telefone.length < 5) {
      erroTelefone = true;
      textErroTelefone = 'Mínimo de 5 caracteres';
    } else {
      erroTelefone = false;
      textErroTelefone = '';
    }
  }

  @action
  void validateEmail() {
    if (_email.length < 3 || !_email.contains("@")) {
      erroEmail = true;
      textErroEmail = 'Insira um e-mail válido';
    } else {
      erroEmail = false;
      textErroEmail = '';
    }
  }

  @action
  void validateSite() {}

  @action
  void validateAll(String fbUid, String empID) {
    //Setters
    setBairro(bairroController.text.toUpperCase().trimRight().trimLeft());
    setCep(cepController.text);
    setComplemento(
        complementoController.text.toUpperCase().trimRight().trimLeft());
    setEmail(emailController.text.toLowerCase().trimRight().trimLeft());
    setEstado(estadoController.text.toUpperCase());
    setLogradouro(
        logradouroController.text.toUpperCase().trimLeft().trimRight());
    setNomeUnidade(
        nomeUnidadeController.text.toUpperCase().trimLeft().trimRight());
    setNumero(numeroController.text.trimRight().trimLeft());
    setSite(siteController.text.toLowerCase().trimRight().trimLeft());
    setTelefone(telefoneController.text);
    //Validators
    validateBairro();
    validateCep();
    validateComplemento();
    validateEmail();
    validateEstado();
    validateLogradouro();
    validateNomeUnidade();
    validateNumero();
    validateSite();
    validateTelefone();

    if (!hasError) {
      _atualizaCadastro(fbUid, empID);
    }
  }

  @action
  void validateCep() {
    if (_cep.length != 9) {
      erroCep = true;
      textErroCep = "Insira um CEP válido";
    } else {
      erroCep = false;
      textErroCep = '';
    }
  }

  @action
  void _atualizaCadastro(String fbUid, String empId) {
    cadastro.nomeEmpresa = _nomeUnidade;
    cadastro.bairro = _bairro;
    cadastro.categoria = _tipo;
    cadastro.empresaID = empId;
    cadastro.cep = _cep;
    cadastro.complemento = _complemento;
    cadastro.donoEmpresa = fbUid;
    cadastro.email = _email;
    cadastro.estado = _estado;
    cadastro.logradouro = _logradouro;
    cadastro.numero = _numero;
    cadastro.site = _site;
    cadastro.telefone = _telefone;
  }

  @observable
  int value = 0;

  Future<void> errorDialog(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Modular.navigatorKey.currentState.pop();
                },
              )
            ],
            title: Text("Algo deu errado!"),
            content: SingleChildScrollView(
              child: Text(
                  "Se o problema persistir, entre em contato com o suporte"),
            ),
          );
        });
  }

  @action
  void increment() {
    value++;
  }
}
