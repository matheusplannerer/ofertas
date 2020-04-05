import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/modules/perfil_empresa_feed/pages/horarios_feed/horarios_feed_controller.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';

class HorariosFeedPage extends StatefulWidget {
  final PerfilEmpresaModel empresa;

  final String title;
  HorariosFeedPage({Key key, this.title = "HorariosFeed", this.empresa});

  @override
  _HorariosFeedPageState createState() => _HorariosFeedPageState();
}

class _HorariosFeedPageState extends State<HorariosFeedPage> {
  // PerfilEmpresaFeedCon
  HorariosFeedController controller;
  bool editable = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = HorariosFeedController(widget.empresa);
  }

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
