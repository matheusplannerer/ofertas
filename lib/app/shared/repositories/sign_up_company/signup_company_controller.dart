import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';
import 'package:ofertas/app/shared/repositories/sign_up_company/repositories/signup_company_repository_interface.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
part 'signup_company_controller.g.dart';

class SignUpCompanyController = _SignUpCompanyControllerBase
    with _$SignUpCompanyController;

abstract class _SignUpCompanyControllerBase with Store {
  ISignUpCompanyRepository _signUpCompanyRepository = Modular.get();

  _SignUpCompanyControllerBase() {
    for (var i = 0; i < categorias.length; i++) {
      DropdownMenuItem<String> aux = DropdownMenuItem<String>(
        child: Text(categorias[i]),
        value: categorias[i],
      );

      categoriasAux.add(aux);
    }
  }

  List<String> categorias = [
    "Supermercados",
    "Alimentação fora do lar e com delivery",
    "Alimentação e Bebidas",
    "Entretenimento e Lazer",
    "Vestuário, Calçado e Acessórios",
    "Serviços Residencias e Empresariais",
    "Veículos e transporte",
    "Beleza, Estética e Bem-estar",
    "Mãe, Bebê e Criança",
    "Animais",
    "Varejo",
    "Educação",
    "Imóveis",
    "Saúde",
    "Financeiras",
    "Construção, Reformas e Casa",
    "Agronegócio",
    "Indústria e Fábricas",
    "Comunicação",
    "Outros - Serviços",
    "Outros - Produtos",
    "Outros - Geral",
  ];

  List<DropdownMenuItem<String>> categoriasAux = [];

  //Observables

  @observable
  TextEditingController nomeUnidadeController = TextEditingController();
  @observable
  TextEditingController subCategoriaController = TextEditingController();
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
  @observable
  String _subcategoria = '';

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
  String textErroSubcategoria = '';

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
  @observable
  bool erroSubcategoria = false;

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
  String get subcategoria => _subcategoria;

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
        erroSubcategoria ||
        erroTipo) {
      return true;
    }
    return false;
  }

  @action
  void setNomeUnidade(String value) {
    _nomeUnidade = value.toUpperCase();
  }

  @action
  void setTipo(String value) {
    _tipo = value;
  }

  @action
  void setCep(String value) {
    _cep = value;
  }

  @action
  void setLogradouro(String value) {
    _logradouro = value.toUpperCase();
  }

  @action
  void setBairro(String value) {
    _bairro = value.toUpperCase();
  }

  @action
  void setEstado(String value) {
    _estado = value.toUpperCase();
  }

  @action
  void setNumero(String value) {
    _numero = value;
  }

  @action
  void setComplemento(String value) {
    _complemento = value.toUpperCase();
  }

  @action
  void setTelefone(String value) {
    _telefone = value;
  }

  @action
  void setEmail(String value) {
    _email = value.toLowerCase().trim();
  }

  @action
  void setSite(String value) {
    _site = value.toLowerCase().trim();
  }

  @action
  void setSubcategoria(String value) => _subcategoria = value.toUpperCase();

  @action
  void _validateNomeUnidade() {
    if (_nomeUnidade.length < 3) {
      erroNomeUnidade = true;
      textErroNomeUnidade = 'Mínimo de 3 caracteres';
    } else {
      erroNomeUnidade = false;
      textErroNomeUnidade = '';
    }
  }

  @action
  void _validateLogradouro() {
    if (_logradouro.length < 3) {
      erroLogradouro = true;
      textErroLogradouro = 'Mínimo de 3 caracteres';
    } else {
      erroLogradouro = false;
      textErroLogradouro = '';
    }
  }

  @action
  void _validateBairro() {
    if (_bairro.length < 3) {
      erroBairro = true;
      textErroBairro = 'Mínimo de 3 caracteres';
    } else {
      erroBairro = false;
      textErroBairro = '';
    }
  }

  @action
  void _validateEstado() {
    if (_estado.length != 2) {
      erroEstado = true;
      textErroEstado = 'Ex: "SP"';
    } else {
      erroEstado = false;
      textErroEstado = '';
    }
  }

  @action
  void _validateNumero() {
    if (_numero.length == 0) {
      erroNumero = true;
      textErroNumero = 'Insira um número válido';
    } else {
      erroNumero = false;
      textErroNumero = '';
    }
  }

  @action
  void _validateComplemento() {}

  @action
  void _validateTelefone() {
    if (_telefone.length < 5) {
      erroTelefone = true;
      textErroTelefone = 'Mínimo de 5 caracteres';
    } else {
      erroTelefone = false;
      textErroTelefone = '';
    }
  }

  @action
  void _validateEmail() {
    bool isValid = EmailValidator.validate(_email);
    if (!isValid) {
      textErroEmail = 'Insira um e-mail válido';
      erroEmail = true;
    } else {
      erroEmail = false;
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
  void _validateSite() {}

  @action
  void validateFields(String fbUid, String empID) {
    _validateBairro();
    _validateComplemento();
    _validateEmail();
    _validateEstado();
    _validateLogradouro();
    _validateNomeUnidade();
    _validateNumero();
    _validateSite();
    _validateTelefone();
    if (!hasError) {
      _atualizaCadastro(fbUid, empID);
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
    cadastro.subcategoria = _subcategoria;
  }

  @action
  Future fetchCep() async {
    var data = await _signUpCompanyRepository.fetchCep(cep);
    setLogradouro(data.logradouro);
    logradouroController =
        TextEditingController(text: data.logradouro.toUpperCase());
    setBairro(data.bairro);
    bairroController = TextEditingController(text: data.bairro.toUpperCase());
    setEstado(data.uf);
    estadoController = TextEditingController(text: data.uf.toUpperCase());
  }

  @action
  Future<bool> signUpCompany() async {
    try {
      var aux = await _signUpCompanyRepository.signUpCompany(cadastro);
      return aux;
    } catch (e) {
      return throw e;
    }
  }
}
