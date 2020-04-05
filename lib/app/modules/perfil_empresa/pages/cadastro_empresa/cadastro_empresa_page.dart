import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/modules/perfil_empresa/pages/cadastro_empresa/cadastro_empresa_controller.dart';
import 'package:ofertas/app/shared/components/button/button_widget.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CadastroEmpresaPage extends StatefulWidget {
  final String title;
  const CadastroEmpresaPage({Key key, this.title = "CadastroEmpresa"})
      : super(key: key);

  @override
  _CadastroEmpresaPageState createState() => _CadastroEmpresaPageState();
}

class _CadastroEmpresaPageState
    extends ModularState<CadastroEmpresaPage, CadastroEmpresaController> {
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
        gradient: LinearGradient(
          colors: [Colors.orange[900], Colors.orange[300]],
        ),
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
                controller:
                    controller.signUpCompanyController.nomeUnidadeController,
                decoration: InputDecoration(
                  errorText: controller.signUpCompanyController.erroNomeUnidade
                      ? controller.signUpCompanyController.textErroNomeUnidade
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
              onChanged: controller.setTipo,
              value: controller.signUpCompanyController.tipo,
              icon: Icon(Icons.list),
              items: [
                ...controller.signUpCompanyController.categoriasAux,
              ],
            ),
          ),
          if (controller.signUpCompanyController.erroTipo)
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
                      controller:
                          controller.signUpCompanyController.cepController,
                      onChanged: controller.setCep,
                      inputFormatters: [controller.maskCep],
                      decoration: InputDecoration(
                        errorText: controller.signUpCompanyController.erroCep
                            ? controller.signUpCompanyController.textErroCep
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
                    controller.signUpCompanyController.validateCep();
                    if (controller.signUpCompanyController.erroCep) return;
                    showLoadingDialog();
                    await controller.signUpCompanyController.fetchCep();
                    hideLoadingDialog();
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
                controller:
                    controller.signUpCompanyController.logradouroController,
                decoration: InputDecoration(
                  errorText: controller.signUpCompanyController.erroLogradouro
                      ? controller.signUpCompanyController.textErroLogradouro
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
                      controller:
                          controller.signUpCompanyController.bairroController,
                      decoration: InputDecoration(
                        errorText: controller.signUpCompanyController.erroBairro
                            ? controller.signUpCompanyController.textErroBairro
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
                      controller:
                          controller.signUpCompanyController.estadoController,
                      decoration: InputDecoration(
                        errorText: controller.signUpCompanyController.erroEstado
                            ? "Ex: 'SP'"
                            : null,
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
                      controller:
                          controller.signUpCompanyController.numeroController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        errorText: controller.signUpCompanyController.erroNumero
                            ? controller.signUpCompanyController.textErroNumero
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
                      controller: controller
                          .signUpCompanyController.complementoController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        errorText:
                            controller.signUpCompanyController.erroComplemento
                                ? controller
                                    .signUpCompanyController.textErroComplemento
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
                controller:
                    controller.signUpCompanyController.telefoneController,
                decoration: InputDecoration(
                  errorText: controller.signUpCompanyController.erroTelefone
                      ? controller.signUpCompanyController.textErroTelefone
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
                controller: controller.signUpCompanyController.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  errorText: controller.signUpCompanyController.erroEmail
                      ? controller.signUpCompanyController.textErroEmail
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
                controller: controller.signUpCompanyController.siteController,
                keyboardType: TextInputType.url,
                decoration: InputDecoration(
                  errorText: controller.signUpCompanyController.erroSite
                      ? controller.signUpCompanyController.textErroSite
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
              controller.validateAll(
                  controller.appController.authInfos.uid, empresaID);
              if (controller.signUpCompanyController.hasError) return;

              showLoadingDialog(tapDismiss: false);
              var cadastrou =
                  await controller.signUpCompanyController.signUpCompany();
              if (!cadastrou) {
                hideLoadingDialog();
                Alert(
                  context: context,
                  title: "ERRO",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "VOLTAR",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      height: 60,
                      color: Colors.orange,
                    )
                  ],
                  type: AlertType.error,
                ).show();
                Modular.to.popUntil((Route<dynamic> route) => route.isFirst);
                return;
              }

              var aux = await controller.authController
                  .getUserInfos(controller.appController.authInfos.uid);
              controller.appController.setUser(aux);
              hideLoadingDialog();
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
