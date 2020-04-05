import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/modules/perfil_empresa/pages/horarios/horarios_controller.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:provider/provider.dart';

class HorariosPage extends StatefulWidget {
  final PerfilEmpresaModel empresa;
  final bool isDono;

  HorariosPage({Key key, this.empresa, this.isDono}) {
    print("NÃO ERA P ABRIR HORARIOSPAGE");
  }

  @override
  _HorariosPageState createState() => _HorariosPageState();
}

class _HorariosPageState extends State<HorariosPage> {
  bool isDono;
  bool editable = false;
  HorariosController controller = HorariosController();
  PerfilEmpresaModel empresa;

  @override
  void initState() {
    // TODO: implement initState
    empresa = widget.empresa;
    if (controller.appController.userInfos.empresaPerfil ==
        widget.empresa.empresaID) {
      print("isDono");
      isDono = true;
    } else {
      print("N IS DONO");
      isDono = false;
    }

    controller.updateFields(widget.empresa);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isDono) editable = true;
    // TODO: implement build
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        // elevation: 0,
        // backgroundColor: primaryColor,
        title: Text(
          'HORÁRIOS',
          style: TextStyle(
              fontSize: 22,
              fontFamily: "Poppins-Bold",
              color: Colors.white,
              letterSpacing: .6),
        ),
        gradient: LinearGradient(
          colors: [
            Colors.orange[900],
            Colors.orange[300],
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
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
                      selected: controller.domingo,
                      onSelectChanged: (value) {
                        if (editable) {
                          controller.setDomingo(value);
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
                              controller: controller.domingoTextFieldInicio,
                              enabled: editable,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.datetime,
                              inputFormatters: [controller.maskDomIni],
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
                              controller: controller.domingoTextFieldFim,
                              inputFormatters: [controller.maskDomFim],
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
                      selected: controller.segunda,
                      onSelectChanged: (value) {
                        if (editable) {
                          controller.setSegunda(value);
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
                              controller: controller.segundaTextFieldInicio,
                              inputFormatters: [controller.maskSegIni],
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
                              controller: controller.segundaTextFieldFim,
                              inputFormatters: [controller.maskSegFim],
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
                      selected: controller.terca,
                      onSelectChanged: (value) {
                        if (editable) {
                          controller.setTerca(value);
                        }
                      },
                      cells: [
                        DataCell(Text("Terça")),
                        DataCell(
                          Container(
                            height: 40,
                            width: 70,
                            child: TextField(
                              controller: controller.tercaTextFieldInicio,
                              inputFormatters: [controller.maskTerIni],
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
                              controller: controller.tercaTextFieldFim,
                              inputFormatters: [controller.maskTerFim],
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
                      selected: controller.quarta,
                      onSelectChanged: (value) {
                        if (editable) {
                          controller.setQuarta(value);
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
                              controller: controller.quartaTextFieldInicio,
                              inputFormatters: [controller.maskQuaIni],
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
                              controller: controller.quartaTextFieldFim,
                              inputFormatters: [controller.maskQuaFim],
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
                      selected: controller.quinta,
                      onSelectChanged: (value) {
                        if (editable) {
                          controller.setQuinta(value);
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
                              controller: controller.quintaTextFieldInicio,
                              inputFormatters: [controller.maskQuiIni],
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
                              controller: controller.quintaTextFieldFim,
                              inputFormatters: [controller.maskQuiFim],
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
                      selected: controller.sexta,
                      onSelectChanged: (value) {
                        if (editable) {
                          controller.setSexta(value);
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
                              controller: controller.sextaTextFieldInicio,
                              inputFormatters: [controller.maskSexIni],
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
                              controller: controller.sextaTextFieldFim,
                              inputFormatters: [controller.maskSexFim],
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
                      selected: controller.sabado,
                      onSelectChanged: (value) {
                        if (editable) {
                          controller.setSabado(value);
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
                              controller: controller.sabadoTextFieldInicio,
                              inputFormatters: [controller.maskSabIni],
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
                              controller: controller.sabadoTextFieldFim,
                              inputFormatters: [controller.maskSabFim],
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
          if (isDono)
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.orange,
                textColor: Colors.white,
                child: Text("SALVAR"),
                onPressed: () async {
                  showLoadingDialog(tapDismiss: false);
                  empresa = await controller.updateHorarios(widget.empresa);
                  controller.updateFields(empresa);
                  hideLoadingDialog();
                  controller.routeController.actualNavigator.currentState.pop();
                },
              ),
            )
        ],
      ),
    );
  }
}
