import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:ofertas/app/modules/navigation_bar/components/perfil_empresa/components/horarios/horarios_controller.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:provider/provider.dart';

class HorariosPage extends StatefulWidget {
  final String empresaID;
  final bool isDono;

  const HorariosPage({Key key, this.empresaID, this.isDono}) : super(key: key);

  @override
  _HorariosPageState createState() => _HorariosPageState();
}

class _HorariosPageState extends State<HorariosPage> {
  bool isDono;
  bool editable = false;

  HorariosController _controller = HorariosController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<GlobalService>(context);
    if (global.usuario.empresaPerfil == widget.empresaID) {
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
                        "",
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
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
                      cells: [
                        DataCell(
                          Checkbox(
                            value: _controller.domingo,
                            onChanged: (bool value) {
                              if (editable) {
                                _controller.setDomingo(value);
                              }
                            },
                          ),
                        ),
                        DataCell(
                          Text("Domingo"),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            height: 40,
                            child: TextField(
                              enabled: editable,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
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
                              enabled: editable,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Checkbox(
                            value: _controller.segunda,
                            onChanged: (bool value) {
                              if (editable) {
                                _controller.setSegunda(value);
                              }
                            },
                          ),
                        ),
                        DataCell(
                          Text("Segunda"),
                        ),
                        DataCell(
                          Container(
                            height: 40,
                            width: 70,
                            child: TextField(
                              enabled: editable,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
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
                              enabled: editable,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Checkbox(
                            value: _controller.terca,
                            onChanged: (bool value) {
                              if (editable) {
                                _controller.setTerca(value);
                              }
                            },
                          ),
                        ),
                        DataCell(Text("Terça")),
                        DataCell(
                          Container(
                            height: 40,
                            width: 70,
                            child: TextField(
                              enabled: editable,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
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
                              enabled: editable,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Checkbox(
                            value: _controller.quarta,
                            onChanged: (bool value) {
                              if (editable) {
                                _controller.setQuarta(value);
                              }
                            },
                          ),
                        ),
                        DataCell(
                          Text("Quarta"),
                        ),
                        DataCell(
                          Container(
                            height: 40,
                            width: 70,
                            child: TextField(
                              enabled: editable,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
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
                              enabled: editable,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Checkbox(
                            value: _controller.quinta,
                            onChanged: (bool value) {
                              if (editable) {
                                _controller.setQuinta(value);
                              }
                            },
                          ),
                        ),
                        DataCell(
                          Text("Quinta"),
                        ),
                        DataCell(
                          Container(
                            height: 40,
                            width: 70,
                            child: TextField(
                              enabled: editable,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
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
                              enabled: editable,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Checkbox(
                            value: _controller.sexta,
                            onChanged: (bool value) {
                              if (editable) {
                                _controller.setSexta(value);
                              }
                            },
                          ),
                        ),
                        DataCell(
                          Text("Sexta"),
                        ),
                        DataCell(
                          Container(
                            height: 40,
                            width: 70,
                            child: TextField(
                              enabled: editable,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
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
                              enabled: editable,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Checkbox(
                            value: _controller.sabado,
                            onChanged: (bool value) {
                              if (editable) {
                                _controller.setSabado(value);
                              }
                            },
                          ),
                        ),
                        DataCell(
                          Text("Sábado"),
                        ),
                        DataCell(
                          Container(
                            height: 40,
                            width: 70,
                            child: TextField(
                              enabled: editable,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
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
                              enabled: editable,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
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
                onPressed: () {},
              ),
            )
        ],
      ),
    );
  }
}
