import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/modules/cadastro_empresa/cadastro_empresa_controller.dart';
import 'package:ofertas/app/modules/cadastro_empresa/services/cadastro_empresa_service.dart';
import 'package:ofertas/app/modules/cadastro_empresa/services/via_cep_service.dart';
import 'package:ofertas/app/shared/components/button/button_widget.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:provider/provider.dart';

class CadastroEmpresaPage extends StatefulWidget {
  final String title;
  const CadastroEmpresaPage({Key key, this.title = "CadastroEmpresa"})
      : super(key: key);

  @override
  _CadastroEmpresaPageState createState() => _CadastroEmpresaPageState();
}

class _CadastroEmpresaPageState extends State<CadastroEmpresaPage> {
  var _cadastroController = CadastroEmpresaController();

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<GlobalService>(context);
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
          Text(
            "Complete as informações abaixo para finalizar seu cadastro.",
            style: TextStyle(color: Colors.grey[700], fontSize: 20),
          ),
          SizedBox(height: 20),
          Observer(
            builder: (_) {
              return TextField(
                controller: _cadastroController.nomeUnidadeController,
                decoration: InputDecoration(
                  errorText: _cadastroController.erroNomeUnidade
                      ? _cadastroController.textErroNomeUnidade
                      : null,
                  labelStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
                  labelText: 'Nome da Unidade',
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(),
                  ),
                ),
                keyboardType: TextInputType.text,
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            alignment: Alignment.center,
            child: DropdownButton<String>(
              hint: Text("CATEGORIA"),
              onChanged: _cadastroController.setTipo,
              value: _cadastroController.tipo,
              icon: Icon(Icons.list),
              items: [
                ..._cadastroController.categoriasAux,
              ],
            ),
          ),
          if (_cadastroController.erroTipo)
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
                child: Observer(
                  builder: (_) {
                    return TextField(
                      controller: _cadastroController.cepController,
                      onChanged: _cadastroController.setCep,
                      inputFormatters: [_cadastroController.maskCep],
                      decoration: InputDecoration(
                        errorText: _cadastroController.erroCep
                            ? _cadastroController.textErroCep
                            : null,
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
                    );
                  },
                ),
              ),
              Container(
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    _cadastroController.validateCep();
                    if (_cadastroController.erroCep) return;
                    final aux = _cadastroController.cep;
                    showLoadingDialog();
                    var data = await ViaCepService().fetchCep(cep: aux);
                    hideLoadingDialog();
                    _cadastroController.setLogradouro(data.logradouro);
                    _cadastroController.logradouroController =
                        TextEditingController(
                            text: data.logradouro.toUpperCase());
                    _cadastroController.setBairro(data.bairro);
                    _cadastroController.bairroController =
                        TextEditingController(text: data.bairro.toUpperCase());
                    _cadastroController.setEstado(data.uf);
                    _cadastroController.estadoController =
                        TextEditingController(text: data.uf.toUpperCase());
                  },
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
          Observer(
            builder: (_) {
              return TextField(
                controller: _cadastroController.logradouroController,
                decoration: InputDecoration(
                  errorText: _cadastroController.erroLogradouro
                      ? _cadastroController.textErroLogradouro
                      : null,
                  labelStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(),
                  ),
                  labelText: 'Logradouro',
                ),
                keyboardType: TextInputType.text,
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width - 150,
                child: Observer(
                  builder: (_) {
                    return TextField(
                      controller: _cadastroController.bairroController,
                      decoration: InputDecoration(
                        errorText: _cadastroController.erroBairro
                            ? _cadastroController.textErroBairro
                            : null,
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
                    );
                  },
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Observer(
                  builder: (_) {
                    return TextField(
                      controller: _cadastroController.estadoController,
                      decoration: InputDecoration(
                        errorText:
                            _cadastroController.erroEstado ? "Ex: 'SP'" : null,
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
                    );
                  },
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
                child: Observer(
                  builder: (_) {
                    return TextField(
                      controller: _cadastroController.numeroController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        errorText: _cadastroController.erroNumero
                            ? _cadastroController.textErroNumero
                            : null,
                        labelStyle:
                            TextStyle(color: Colors.grey[700], fontSize: 15),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(),
                        ),
                        labelText: 'Numero',
                      ),
                    );
                  },
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Observer(
                  builder: (_) {
                    return TextField(
                      controller: _cadastroController.complementoController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        errorText: _cadastroController.erroComplemento
                            ? _cadastroController.textErroComplemento
                            : null,
                        labelStyle:
                            TextStyle(color: Colors.grey[700], fontSize: 15),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(),
                        ),
                        labelText: 'Complemento',
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
          Observer(
            builder: (_) {
              return TextField(
                keyboardType: TextInputType.number,
                controller: _cadastroController.telefoneController,
                decoration: InputDecoration(
                  errorText: _cadastroController.erroTelefone
                      ? _cadastroController.textErroTelefone
                      : null,
                  labelStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide()),
                  labelText: 'Telefone',
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
          Observer(
            builder: (_) {
              return TextField(
                controller: _cadastroController.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  errorText: _cadastroController.erroEmail
                      ? _cadastroController.textErroEmail
                      : null,
                  labelStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide()),
                  labelText: 'E-mail',
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
          Observer(
            builder: (_) {
              return TextField(
                controller: _cadastroController.siteController,
                keyboardType: TextInputType.url,
                decoration: InputDecoration(
                  errorText: _cadastroController.erroSite
                      ? _cadastroController.textErroSite
                      : null,
                  labelStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide()),
                  labelText: 'Site',
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
          ButtonWidget(
            height: 60,
            onTap: () async {
              var empresaID = Firestore.instance
                  .collection('empresas')
                  .document()
                  .documentID;
              _cadastroController.validateAll(global.fbUser.uid, empresaID);
              if (_cadastroController.hasError) return;

              showLoadingDialog(tapDismiss: false);
              var _service = CadastroEmpresaService();
              var cadastrou = await _service.cadastrarEmpresa(
                  _cadastroController.cadastro, global.fbUser);
              if (!cadastrou) {
                hideLoadingDialog();
                await _cadastroController.errorDialog(context);
                Modular.navigatorKey.currentState
                    .popUntil((Route<dynamic> route) => route.isFirst);
                return;
              }
              hideLoadingDialog();
              global.setEmpresaLogada(_cadastroController.cadastro);
              Modular.navigatorKey.currentState
                  .popUntil((Route<dynamic> route) => route.isFirst);
            },
            text: "CADASTRAR",
            width: MediaQuery.of(context).size.width - 60,
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
        ],
      ),
    );
  }
}
