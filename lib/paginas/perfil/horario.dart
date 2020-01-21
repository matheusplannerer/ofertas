import 'package:flutter/material.dart';
import 'perfil_empresa.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class Horarios extends StatefulWidget {
  _HorariosPageState createState() => _HorariosPageState();
}

class _HorariosPageState extends State<Horarios> {
  bool _valorDomingo = true;
  bool _valorSegunda = true;
  bool _valorTerca = true;
  bool _valorQuarta = true;
  bool _valorQuinta = true;
  bool _valorSexta = true;
  bool _valorSabado = true;

  @override
  Widget build(BuildContext context) {
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
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            SingleChildScrollView(
              child: DataTable(
                columnSpacing: 25,
                columns: [
                  DataColumn(
                      label: Text(
                    "",
                    style: TextStyle(color: Colors.orange),
                  )),
                  DataColumn(
                      label: Text(
                    "Dia",
                    style: TextStyle(color: Colors.orange),
                  )),
                  DataColumn(
                      label: Text(
                    "Abre às:",
                    style: TextStyle(color: Colors.orange),
                  )),
                  DataColumn(
                      label: Text(
                    "Fecha às:",
                    style: TextStyle(color: Colors.orange),
                  )),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Checkbox(
                      value: _valorDomingo,
                      onChanged: (bool novoValor) {
                        setState(() {
                          _valorDomingo = novoValor;
                        });
                      },
                    )),
                    DataCell(Text("Domingo")),
                    DataCell(
                      Container(
                        width: 70,
                        height: 40,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.datetime,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        height: 40,
                        width: 70,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.datetime,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(Checkbox(
                      value: _valorSegunda,
                      onChanged: (bool novoValor) {
                        setState(() {
                          _valorSegunda = novoValor;
                        });
                      },
                    )),
                    DataCell(Text("Segunda")),
                    DataCell(
                      Container(
                        height: 40,
                        width: 70,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.datetime,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        height: 40,
                        width: 70,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.datetime,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(Checkbox(
                      value: _valorTerca,
                      onChanged: (bool novoValor) {
                        setState(() {
                          _valorTerca = novoValor;
                        });
                      },
                    )),
                    DataCell(Text("Terça")),
                    DataCell(
                      Container(
                        height: 40,
                        width: 70,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.datetime,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        height: 40,
                        width: 70,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.datetime,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(Checkbox(
                      value: _valorQuarta,
                      onChanged: (bool novoValor) {
                        setState(() {
                          _valorQuarta = novoValor;
                        });
                      },
                    )),
                    DataCell(Text("Quarta")),
                    DataCell(
                      Container(
                        height: 40,
                        width: 70,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.datetime,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        height: 40,
                        width: 70,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.datetime,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(Checkbox(
                      value: _valorQuinta,
                      onChanged: (bool novoValor) {
                        setState(() {
                          _valorQuinta = novoValor;
                        });
                      },
                    )),
                    DataCell(Text("Quinta")),
                    DataCell(
                      Container(
                        height: 40,
                        width: 70,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.datetime,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        height: 40,
                        width: 70,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.datetime,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(Checkbox(
                      value: _valorSexta,
                      onChanged: (bool novoValor) {
                        setState(() {
                          _valorSexta = novoValor;
                        });
                      },
                    )),
                    DataCell(Text("Sexta")),
                    DataCell(
                      Container(
                        height: 40,
                        width: 70,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.datetime,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        height: 40,
                        width: 70,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.datetime,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(Checkbox(
                      value: _valorSabado,
                      onChanged: (bool novoValor) {
                        setState(() {
                          _valorSabado = novoValor;
                        });
                      },
                    )),
                    DataCell(Text("Sábado")),
                    DataCell(
                      Container(
                        height: 40,
                        width: 70,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.datetime,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        height: 40,
                        width: 70,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.datetime,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.orange,
                textColor: Colors.white,
                child: Text("SALVAR"),
                onPressed: (){},
              ),
            )
          ],
        ));
  }
}