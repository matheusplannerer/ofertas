import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:ofertas/controller/services.dart';
import 'package:ofertas/global/global.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:ofertas/models/classes_usuarios.dart';
import 'package:ofertas/paginas/perfil/perfil_empresa.dart';
import 'package:ofertas/services/via_cep_services.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class CadastroEmpresa extends StatefulWidget {
  CadastroEmpresa();

  @override
  _CadastroEmpresaState createState() => _CadastroEmpresaState();
}

class _CadastroEmpresaState extends State<CadastroEmpresa> {
  _CadastroEmpresaState();

  PerfilEmpresa cadastro = PerfilEmpresa();

  var formKey = GlobalKey<FormState>();

  Services services = Services();

//Controladores de erros
  bool _erroNomeUnidade = false;
  bool _erroCategoria = false;
  bool _erroCep = false;
  bool _erroLogradouro = false;
  bool _erroBairro = false;
  bool _erroEstado = false;
  bool _erroNumero = false;
  bool _erroComplemennto = false;
  bool _erroTelefone = false;
  bool _erroEmail = false;
  bool _erroSite = false;

//Controladores
  TextEditingController _nomeUnidade = TextEditingController();
  TextEditingController _tipo = TextEditingController();
  TextEditingController _cep = TextEditingController();
  TextEditingController _logradouro = TextEditingController();
  TextEditingController _bairro = TextEditingController();
  TextEditingController _estado = TextEditingController();
  TextEditingController _numero = TextEditingController();
  TextEditingController _complemento = TextEditingController();
  TextEditingController _telefone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _site = TextEditingController();
  TextEditingController _horaAbertura = TextEditingController();
  TextEditingController _horaFechamento = TextEditingController();

//Mascaras
  var maskCep = MaskTextInputFormatter(
      filter: {"#": RegExp(r'[0-9]')}, mask: "#####-###");

  var maskTelefone = MaskTextInputFormatter(
      filter: {"#": RegExp(r'[0-9]')}, mask: "###########");

//Funções de validação
  void _validateNomeUnidade(String text) {
    if (text.length >= 24) {
      setState(() {
        _erroNomeUnidade = true;
      });
    } else {
      setState(() {
        _erroNomeUnidade = false;
      });
    }
  }

  void _validateCategoria() {
    if (cadastro.categoria == '') {
      setState(() {
        _erroCategoria = true;
      });
    } else {
      setState(() {
        _erroCategoria = false;
      });
    }
  }

  void _validateCep(String text) {
    if (text.length != 9) {
      setState(() {
        _erroCep = true;
      });
    } else {
      setState(() {
        _erroCep = false;
      });
    }
  }

  void _validateLogradouro(String text) {
    if (text.length < 5) {
      setState(() {
        _erroLogradouro = true;
      });
    } else {
      _erroLogradouro = false;
    }
  }

  void _validateBairro(String text) {
    if (text.length < 5) {
      setState(() {
        _erroBairro = true;
      });
    } else {
      _erroBairro = false;
    }
  }

  void _validateUF(String text) {
    if (text.length != 2) {
      setState(() {
        _erroEstado = true;
      });
    } else {
      _erroEstado = false;
    }
  }

  void _validateNumero(String text) {
    if (text.replaceAll(" ", "").length == 0) {
      setState(() {
        _erroNumero = true;
      });
    } else {
      setState(() {
        _erroNumero = false;
      });
    }
  }

  void _validateComplemento(String text) {}

  void _validateTelefone(String text) {
    if (text.length <= 5) {
      setState(() {
        _erroTelefone = true;
      });
    } else {
      setState(() {
        _erroTelefone = false;
      });
    }
  }

  void _validateEmail(String text) {
    if (!text.contains("@") || text.length < 5) {
      setState(() {
        _erroEmail = true;
      });
    } else {
      setState(() {
        _erroEmail = false;
      });
    }
  }

  void _validateSite(String text) {}

  bool _allValid() {
    _validateBairro(_bairro.text.trim());
    _validateCategoria();
    _validateCep(_cep.text.trim());
    _validateComplemento(_complemento.text.trim());
    _validateEmail(_email.text.trim());
    _validateLogradouro(_logradouro.text.trim());
    _validateNomeUnidade(_nomeUnidade.text.trim());
    _validateNumero(_numero.text.trim());
    _validateSite(_site.text.trim());
    _validateTelefone(_telefone.text.trim());
    _validateUF(_estado.text.trim());

    if (!_erroBairro &&
        !_erroCategoria &&
        !_erroCep &&
        !_erroComplemennto &&
        !_erroEmail &&
        !_erroEstado &&
        !_erroLogradouro &&
        !_erroNomeUnidade &&
        !_erroNumero &&
        !_erroSite &&
        !_erroTelefone) {
      return true;
    } else
      return false;
  }

  List<DropdownMenuItem> categoriasAux = [];

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < categorias.length; i++) {
      DropdownMenuItem aux = DropdownMenuItem(
        child: Text(categorias[i]),
        value: categorias[i],
      );

      categoriasAux.add(aux);
    }
  }

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<Global>(context);
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
          "CADASTRO",
          style: TextStyle(
              fontFamily: "Poppins-Bold",
              color: Colors.white,
              letterSpacing: .6),
        ),
        centerTitle: true,
        gradient:
            LinearGradient(colors: [Colors.orange[900], Colors.orange[300]]),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: <Widget>[
          SizedBox(height: 30),
          Text("Complete as informações abaixo para finalizar seu cadastro.",
              style: TextStyle(color: Colors.grey[700], fontSize: 20)),
          SizedBox(height: 20),
          TextField(
            controller: _nomeUnidade,
            decoration: InputDecoration(
              errorText: _erroNomeUnidade ? "Máximo 26 caracteres" : null,
              labelStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
              labelText: 'Nome da Unidade',
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(),
              ),
            ),
            keyboardType: TextInputType.text,
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            alignment: Alignment.center,
            child: DropdownButton(
              hint: Text("CATEGORIA"),
              onChanged: (data) {
                setState(() {
                  cadastro.categoria = data;
                });
              },
              value: cadastro.categoria,
              icon: Icon(Icons.list),
              items: [...categoriasAux],
            ),
          ),
          if (_erroCategoria)
            Text(
              "Escolha uma categoria",
              style: TextStyle(color: Colors.red),
              textAlign: TextAlign.left,
            ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width - 100,
                child: TextField(
                  controller: _cep,
                  inputFormatters: [maskCep],
                  decoration: InputDecoration(
                    errorText: _erroCep ? "Insira um CEP Válido" : null,
                    labelStyle:
                        TextStyle(color: Colors.grey[700], fontSize: 15),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                    labelText: 'CEP',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    final aux = _cep.text;
                    showLoadingDialog();
                    var data = await ViaCepService().fetchCep(cep: aux);
                    hideLoadingDialog();
                    setState(() {
                      _logradouro =
                          TextEditingController(text: data.logradouro);
                      _bairro = TextEditingController(text: data.bairro);
                      _estado = TextEditingController(text: data.uf);
                    });
                  },
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
          TextField(
            controller: _logradouro,
            decoration: InputDecoration(
              errorText: _erroLogradouro ? "Mínimo 5 caracteres" : null,
              labelStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(),
              ),
              labelText: 'Logradouro',
            ),
            keyboardType: TextInputType.number,
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width - 150,
                child: TextField(
                  controller: _bairro,
                  decoration: InputDecoration(
                    errorText: _erroBairro ? "Mínimo 5 caracteres" : null,
                    labelStyle:
                        TextStyle(color: Colors.grey[700], fontSize: 15),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Bairro',
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: TextField(
                  controller: _estado,
                  decoration: InputDecoration(
                    errorText: _erroEstado ? "Ex: 'SP'" : null,
                    labelStyle:
                        TextStyle(color: Colors.grey[700], fontSize: 15),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Estado',
                  ),
                  keyboardType: TextInputType.text,
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _numero,
                  decoration: InputDecoration(
                    errorText: _erroNumero ? "Campo inválido" : null,
                    labelStyle:
                        TextStyle(color: Colors.grey[700], fontSize: 15),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Numero',
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _complemento,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    errorText: _erroComplemennto ? "Campo inválido" : null,
                    labelStyle:
                        TextStyle(color: Colors.grey[700], fontSize: 15),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Complemento',
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: _telefone,
            decoration: InputDecoration(
              errorText: _erroTelefone ? "Insira um contato válido" : null,
              labelStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide()),
              labelText: 'Telefone',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
          TextField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              errorText: _erroEmail ? "E-mail inválido" : null,
              labelStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide()),
              labelText: 'E-mail',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
          TextField(
            controller: _site,
            keyboardType: TextInputType.url,
            decoration: InputDecoration(
              errorText: _erroSite ? "Site inválido" : null,
              labelStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide()),
              labelText: 'Site',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
          FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.grey[700]),
            ),
            textColor: Colors.grey[700],
            padding: EdgeInsets.all(20.0),
            onPressed: () async {
              cadastro.horaInicio = _horaAbertura.text;
              cadastro.horaTermino = _horaFechamento.text;
              cadastro.bairro = _bairro.text.toUpperCase().trim();
              cadastro.cep = _cep.text.trim();
              cadastro.complemento = _complemento.text.toUpperCase();
              cadastro.donoEmpresa = global.fbUser.uid;
              cadastro.email = _email.text.toLowerCase().trim();
              cadastro.empresaID = Firestore.instance
                  .collection('empresas')
                  .document()
                  .documentID;
              cadastro.estado = _estado.text.toUpperCase().trim();
              cadastro.funcionamento = {};
              cadastro.horaInicio = '';
              cadastro.horaTermino = '';
              cadastro.logradouro = _logradouro.text.toUpperCase().trim();
              cadastro.nomeEmpresa = _nomeUnidade.text.toUpperCase().trim();
              cadastro.numero = _numero.text.trim();
              cadastro.site = _site.text.toLowerCase().trim();
              cadastro.telefone = _telefone.text.trim();
            

              if (!_allValid()) return;
              showLoadingDialog(tapDismiss: false);
              var cadastrou = await services.firestore
                  .cadastrarEmpresa(cadastro, global.fbUser);
              if (!cadastrou) {
                hideLoadingDialog();
                await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actions: <Widget>[
                          FlatButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
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
                Navigator.of(context)
                    .popUntil((Route<dynamic> route) => route.isFirst);
                return;
              }
              hideLoadingDialog();
              Navigator.of(context)
                  .popUntil((Route<dynamic> route) => route.isFirst);
            },
            child: Text(
              "CADASTRAR",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
        ],
      ),
    );
  }
}

class BasicTimeField extends StatelessWidget {
  final format = DateFormat("HH:mm");

  final String text;
  final TextEditingController controller;
  BasicTimeField({this.text, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DateTimePickerFormField(
          textAlign: TextAlign.center,
          inputType: InputType.time,
          controller: controller,
          timePicker: (context) async {
            var horaInicio = await showTimePicker(
              context: context,
              initialTime: TimeOfDay(hour: 7, minute: 0),
            );
            return horaInicio;
          },
          format: format,
        ),
        Text(text),
      ],
    );
  }
}
