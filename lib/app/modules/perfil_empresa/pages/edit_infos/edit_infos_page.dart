import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:load/load.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:ofertas/app/modules/perfil_empresa/pages/edit_infos/edit_infos_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_controller.dart';
import 'package:ofertas/app/shared/components/button/button_widget.dart';
import 'package:ofertas/app/shared/models/endereco_model.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:ofertas/app/shared/repositories/routes/route_controller.dart';
import 'package:ofertas/app/shared/repositories/sign_up_company/repositories/signup_company_repository.dart';
import 'package:ofertas/app/shared/repositories/sign_up_company/signup_company_controller.dart';

class EditInfosPage extends StatefulWidget {
  final String title;
  const EditInfosPage({Key key, this.title = "EditInfos"}) : super(key: key);

  @override
  _EditInfosPageState createState() => _EditInfosPageState();
}

class _EditInfosPageState extends State<EditInfosPage> {
  PerfilEmpresaController controller = Modular.get();
  SignUpCompanyController signUpCompanyController = Modular.get();
  EditInfosController _editController = EditInfosController();

  bool editable = true;

  //Mascaras
  var maskCep = MaskTextInputFormatter(
      filter: {"#": RegExp(r'[0-9]')}, mask: "#####-###");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _editController.initEmpresa(controller.empresa);
    controller.horariosController.updateFields(_editController.empresa);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        gradient: LinearGradient(
          colors: [
            Colors.orange[900],
            Colors.orange[300],
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                GestureDetector(
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Column(
                            children: <Widget>[
                              Text("Foto de perfil"),
                              SizedBox(height: 20),
                              Divider(color: Colors.black, height: 6),
                            ],
                          ),
                          content: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text("ESCOLHER FOTO"),
                                  onTap: () async {
                                    Navigator.of(context).pop();
                                    var img = await controller.getImage(0);
                                    if (img == null) return;
                                    // await Future.delayed(
                                    //     Duration(seconds: 1));
                                    showLoadingDialog(tapDismiss: false);
                                    await controller.uploadImage(
                                      _editController.empresa.empresaID,
                                      _editController.empresa.foto,
                                      img,
                                    );
                                    hideLoadingDialog();
                                    controller.fetchPage();
                                    controller.routeController.tab2Nav.pop();
                                  },
                                ),
                                ListTile(
                                  title: Text("TIRAR FOTO"),
                                  onTap: () async {
                                    Navigator.of(context).pop();
                                    var img = await controller.getImage(1);
                                    if (img == null) return;
                                    // await Future.delayed(
                                    //     Duration(seconds: 1));
                                    showLoadingDialog(tapDismiss: false);
                                    await controller.uploadImage(
                                      _editController.empresa.empresaID,
                                      _editController.empresa.foto,
                                      img,
                                    );
                                    hideLoadingDialog();
                                    controller.fetchPage();
                                    controller.routeController.tab2Nav.pop();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange, width: 2.0),
                      borderRadius: BorderRadius.circular(90),
                      color: _editController.empresa == null
                          ? Colors.grey[300]
                          : Colors.transparent,
                      image: _editController.empresa != null
                          ? DecorationImage(
                              fit: BoxFit.cover,
                              image: _editController.empresa.foto != null
                                  ? NetworkImage(
                                      _editController.empresa.foto,
                                    )
                                  : AssetImage(
                                      'assets/mogi.png',
                                    ),
                            )
                          : null,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "  Nome da empresa",
                  textAlign: TextAlign.left,
                ),
                TextField(
                  onChanged: (nome) =>
                      _editController.empresa.nomeEmpresa = nome.toUpperCase(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: _editController.empresa.nomeEmpresa,
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "  Email para contato",
                  textAlign: TextAlign.left,
                ),
                TextField(
                  onChanged: (email) => _editController.empresa.email =
                      email.toLowerCase().trim(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: _editController.empresa.email,
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "  Telefone para contato",
                  textAlign: TextAlign.left,
                ),
                TextField(
                  onChanged: (contato) =>
                      _editController.empresa.telefone = contato,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: _editController.empresa.telefone,
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "  CEP",
                  textAlign: TextAlign.left,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width - 100,
                      child: Observer(
                        builder: (_) {
                          return TextField(
                            inputFormatters: [maskCep],
                            onChanged: (cep) =>
                                _editController.empresa.cep = cep,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(),
                              ),
                              hintText: _editController.empresa.cep,
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
                          //Validate cep
                          SignUpCompanyRepository _repo = Modular.get();
                          showLoadingDialog();
                          EnderecoModel data;
                          try {
                            data = await _repo.fetchCep(controller.empresa.cep);
                            hideLoadingDialog();
                            controller.empresa.bairro = data.bairro;
                            controller.empresa.estado = data.uf;
                            controller.empresa.logradouro = data.logradouro;
                          } catch (e) {
                            hideLoadingDialog();
                          }
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "  Endereço",
                  textAlign: TextAlign.left,
                ),
                TextField(
                  onChanged: (rua) =>
                      _editController.empresa.logradouro = rua.toUpperCase(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: _editController.empresa.logradouro,
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "  Bairro",
                  textAlign: TextAlign.left,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 150,
                      child: Observer(
                        builder: (_) {
                          return TextField(
                            onChanged: (bairro) => _editController
                                .empresa.bairro = bairro.toUpperCase(),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(),
                              ),
                              hintText: _editController.empresa.bairro,
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
                            onChanged: (estado) => _editController
                                .empresa.estado = estado.toUpperCase(),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(),
                              ),
                              hintText: _editController.empresa.estado,
                            ),
                            keyboardType: TextInputType.text,
                          );
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 150,
                      child: Observer(
                        builder: (_) {
                          return TextField(
                            onChanged: (complemento) => _editController.empresa
                                .complemento = complemento.toUpperCase(),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(),
                              ),
                              hintText:
                                  _editController.empresa.complemento != ""
                                      ? _editController.empresa.complemento
                                      : "Complemento",
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
                            onChanged: (numero) =>
                                _editController.empresa.numero = numero,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(),
                              ),
                              hintText: _editController.empresa.numero,
                            ),
                            keyboardType: TextInputType.text,
                          );
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(width: 15),
                Text(
                  "  Site",
                  textAlign: TextAlign.left,
                ),
                TextField(
                  onChanged: (site) =>
                      _editController.empresa.site = site.toLowerCase().trim(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: _editController.empresa.site != ""
                        ? _editController.empresa.site
                        : "Site",
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(height: 8),
                Observer(
                  builder: (_) {
                    return SingleChildScrollView(
                      child: DataTable(
                        columnSpacing: 25,
                        columns: [
                          DataColumn(
                            label: Text(
                              "Dia",
                              style: TextStyle(color: Colors.orange),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "Abre às:",
                              style: TextStyle(color: Colors.orange),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "Fecha às:",
                              style: TextStyle(color: Colors.orange),
                            ),
                          ),
                        ],
                        rows: [
                          DataRow(
                            selected: controller.horariosController.domingo,
                            onSelectChanged: (value) {
                              if (editable) {
                                controller.horariosController.setDomingo(value);
                              }
                            },
                            cells: [
                              DataCell(
                                Text("Domingo"),
                              ),
                              DataCell(
                                Container(
                                  width: 70,
                                  height: 40,
                                  child: TextField(
                                    controller: controller.horariosController
                                        .domingoTextFieldInicio,
                                    enabled: editable,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.datetime,
                                    inputFormatters: [
                                      controller.horariosController.maskDomIni
                                    ],
                                    decoration: InputDecoration(
                                      hintText: '-',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  height: 40,
                                  width: 70,
                                  child: TextField(
                                    controller: controller
                                        .horariosController.domingoTextFieldFim,
                                    inputFormatters: [
                                      controller.horariosController.maskDomFim
                                    ],
                                    enabled: editable,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      hintText: '-',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            selected: controller.horariosController.segunda,
                            onSelectChanged: (value) {
                              if (editable) {
                                controller.horariosController.setSegunda(value);
                              }
                            },
                            cells: [
                              DataCell(
                                Text("Segunda"),
                              ),
                              DataCell(
                                Container(
                                  height: 40,
                                  width: 70,
                                  child: TextField(
                                    controller: controller.horariosController
                                        .segundaTextFieldInicio,
                                    inputFormatters: [
                                      controller.horariosController.maskSegIni
                                    ],
                                    enabled: editable,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      hintText: '-',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  height: 40,
                                  width: 70,
                                  child: TextField(
                                    controller: controller
                                        .horariosController.segundaTextFieldFim,
                                    inputFormatters: [
                                      controller.horariosController.maskSegFim
                                    ],
                                    enabled: editable,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      hintText: '-',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            selected: controller.horariosController.terca,
                            onSelectChanged: (value) {
                              if (editable) {
                                controller.horariosController.setTerca(value);
                              }
                            },
                            cells: [
                              DataCell(Text("Terça")),
                              DataCell(
                                Container(
                                  height: 40,
                                  width: 70,
                                  child: TextField(
                                    controller: controller.horariosController
                                        .tercaTextFieldInicio,
                                    inputFormatters: [
                                      controller.horariosController.maskTerIni
                                    ],
                                    enabled: editable,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      hintText: '-',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  height: 40,
                                  width: 70,
                                  child: TextField(
                                    controller: controller
                                        .horariosController.tercaTextFieldFim,
                                    inputFormatters: [
                                      controller.horariosController.maskTerFim
                                    ],
                                    enabled: editable,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      hintText: '-',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            selected: controller.horariosController.quarta,
                            onSelectChanged: (value) {
                              if (editable) {
                                controller.horariosController.setQuarta(value);
                              }
                            },
                            cells: [
                              DataCell(
                                Text("Quarta"),
                              ),
                              DataCell(
                                Container(
                                  height: 40,
                                  width: 70,
                                  child: TextField(
                                    controller: controller.horariosController
                                        .quartaTextFieldInicio,
                                    inputFormatters: [
                                      controller.horariosController.maskQuaIni
                                    ],
                                    enabled: editable,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      hintText: '-',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  height: 40,
                                  width: 70,
                                  child: TextField(
                                    controller: controller
                                        .horariosController.quartaTextFieldFim,
                                    inputFormatters: [
                                      controller.horariosController.maskQuaFim
                                    ],
                                    enabled: editable,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      hintText: '-',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            selected: controller.horariosController.quinta,
                            onSelectChanged: (value) {
                              if (editable) {
                                controller.horariosController.setQuinta(value);
                              }
                            },
                            cells: [
                              DataCell(
                                Text("Quinta"),
                              ),
                              DataCell(
                                Container(
                                  height: 40,
                                  width: 70,
                                  child: TextField(
                                    controller: controller.horariosController
                                        .quintaTextFieldInicio,
                                    inputFormatters: [
                                      controller.horariosController.maskQuiIni
                                    ],
                                    enabled: editable,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      hintText: '-',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  height: 40,
                                  width: 70,
                                  child: TextField(
                                    controller: controller
                                        .horariosController.quintaTextFieldFim,
                                    inputFormatters: [
                                      controller.horariosController.maskQuiFim
                                    ],
                                    enabled: editable,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      hintText: '-',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            selected: controller.horariosController.sexta,
                            onSelectChanged: (value) {
                              if (editable) {
                                controller.horariosController.setSexta(value);
                              }
                            },
                            cells: [
                              DataCell(
                                Text("Sexta"),
                              ),
                              DataCell(
                                Container(
                                  height: 40,
                                  width: 70,
                                  child: TextField(
                                    controller: controller.horariosController
                                        .sextaTextFieldInicio,
                                    inputFormatters: [
                                      controller.horariosController.maskSexIni
                                    ],
                                    enabled: editable,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      hintText: '-',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  height: 40,
                                  width: 70,
                                  child: TextField(
                                    controller: controller
                                        .horariosController.sextaTextFieldFim,
                                    inputFormatters: [
                                      controller.horariosController.maskSexFim
                                    ],
                                    enabled: editable,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      hintText: '-',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            selected: controller.horariosController.sabado,
                            onSelectChanged: (value) {
                              if (editable) {
                                controller.horariosController.setSabado(value);
                              }
                            },
                            cells: [
                              DataCell(
                                Text("Sábado"),
                              ),
                              DataCell(
                                Container(
                                  height: 40,
                                  width: 70,
                                  child: TextField(
                                    controller: controller.horariosController
                                        .sabadoTextFieldInicio,
                                    inputFormatters: [
                                      controller.horariosController.maskSabIni
                                    ],
                                    enabled: editable,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      hintText: '-',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  height: 40,
                                  width: 70,
                                  child: TextField(
                                    controller: controller
                                        .horariosController.sabadoTextFieldFim,
                                    inputFormatters: [
                                      controller.horariosController.maskSabFim
                                    ],
                                    enabled: editable,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      hintText: '-',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                ButtonWidget(
                  height: 50,
                  margin: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width - 80,
                  onTap: () async {
                    showLoadingDialog(tapDismiss: false);
                    try {
                      await _editController.updateEmpresa();
                      await controller.fetchPage();
                      hideLoadingDialog();
                      RouteController route = Modular.get();
                      route.tab2Nav.pop();
                    } catch (e) {
                      hideLoadingDialog();
                    }
                  },
                  text: "SALVAR",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
