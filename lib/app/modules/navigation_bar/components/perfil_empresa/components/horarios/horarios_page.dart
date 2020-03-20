import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/modules/navigation_bar/components/perfil_empresa/components/horarios/horarios_controller.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:provider/provider.dart';

class HorariosPage extends StatefulWidget {
  final PerfilEmpresaModel empresa;
  final bool isDono;

  const HorariosPage({Key key, this.empresa, this.isDono}) : super(key: key);

  @override
  _HorariosPageState createState() => _HorariosPageState();
}

class _HorariosPageState extends State<HorariosPage> {
  bool isDono;
  bool editable = false;

  PerfilEmpresaModel empresa;

  HorariosController _controller;

  @override
  void initState() {
    // TODO: implement initState
    empresa = widget.empresa;
    _controller = HorariosController();
    _controller.updateFields(widget.empresa);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<GlobalService>(context);
    if (global.usuario.empresaPerfil == widget.empresa.empresaID) {
      print("isDono");
      isDono = true;
    } else {
      print("N IS DONO");
      isDono = false;
    }

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
                      selected: _controller.domingo,
                      onSelectChanged: (value) {
                        if (editable) {
                          _controller.setDomingo(value);
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
                              controller: _controller.domingoTextFieldInicio,
                              enabled: editable,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.datetime,
                              inputFormatters: [_controller.maskDomIni],
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
                              controller: _controller.domingoTextFieldFim,
                              inputFormatters: [_controller.maskDomFim],
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
                      selected: _controller.segunda,
                      onSelectChanged: (value) {
                        if (editable) {
                          _controller.setSegunda(value);
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
                              controller: _controller.segundaTextFieldInicio,
                              inputFormatters: [_controller.maskSegIni],
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
                              controller: _controller.segundaTextFieldFim,
                              inputFormatters: [_controller.maskSegFim],
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
                      selected: _controller.terca,
                      onSelectChanged: (value) {
                        if (editable) {
                          _controller.setTerca(value);
                        }
                      },
                      cells: [
                        DataCell(Text("Terça")),
                        DataCell(
                          Container(
                            height: 40,
                            width: 70,
                            child: TextField(
                              controller: _controller.tercaTextFieldInicio,
                              inputFormatters: [_controller.maskTerIni],
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
                              controller: _controller.tercaTextFieldFim,
                              inputFormatters: [_controller.maskTerFim],
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
                      selected: _controller.quarta,
                      onSelectChanged: (value) {
                        if (editable) {
                          _controller.setQuarta(value);
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
                              controller: _controller.quartaTextFieldInicio,
                              inputFormatters: [_controller.maskQuaIni],
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
                              controller: _controller.quartaTextFieldFim,
                              inputFormatters: [_controller.maskQuaFim],
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
                      selected: _controller.quinta,
                      onSelectChanged: (value) {
                        if (editable) {
                          _controller.setQuinta(value);
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
                              controller: _controller.quintaTextFieldInicio,
                              inputFormatters: [_controller.maskQuiIni],
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
                              controller: _controller.quintaTextFieldFim,
                              inputFormatters: [_controller.maskQuiFim],
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
                      selected: _controller.sexta,
                      onSelectChanged: (value) {
                        if (editable) {
                          _controller.setSexta(value);
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
                              controller: _controller.sextaTextFieldInicio,
                              inputFormatters: [_controller.maskSexIni],
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
                              controller: _controller.sextaTextFieldFim,
                              inputFormatters: [_controller.maskSexFim],
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
                      selected: _controller.sabado,
                      onSelectChanged: (value) {
                        if (editable) {
                          _controller.setSabado(value);
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
                              controller: _controller.sabadoTextFieldInicio,
                              inputFormatters: [_controller.maskSabIni],
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
                              controller: _controller.sabadoTextFieldFim,
                              inputFormatters: [_controller.maskSabFim],
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
                  empresa = await _controller.updateHorarios(widget.empresa);
                  _controller.updateFields(empresa);
                  hideLoadingDialog();
                  global.actualNavigator.currentState.pop();
                },
              ),
            )
        ],
      ),
    );
  }
}
