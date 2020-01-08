import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ofertas/models/produtos.dart';
import 'package:ofertas/paginas/postagem/concluir_oferta.dart';

class InformacoesOferta extends StatefulWidget {
  InformacoesOferta({this.base64, this.imageFile, this.empresaID});
  final File imageFile;
  final String base64;
  final String empresaID;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InformacoesOfertaState();
  }
}

class _InformacoesOfertaState extends State<InformacoesOferta> {
  OfertaModel produto;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    produto = OfertaModel();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onSaved: (String value) {
                      produto.produto = value.toUpperCase();
                    },
                    decoration: InputDecoration(
                      labelStyle:
                          TextStyle(color: Colors.grey[700], fontSize: 15),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Produto',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    onSaved: (String value) {
                      produto.preco = value;
                    },
                    decoration: InputDecoration(
                      labelStyle:
                          TextStyle(color: Colors.grey[700], fontSize: 15),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Valor',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    onSaved: (String value) {
                      produto.desconto = value;
                    },
                    decoration: InputDecoration(
                      labelStyle:
                          TextStyle(color: Colors.grey[700], fontSize: 15),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Valor com desconto (opcional)',
                    ),
                  ),
                  SizedBox(height: 10),
                  FlatButton(
                    color: Colors.orange,
                    child: Text(
                      "Validade da oferta",
                      textAlign: TextAlign.start,
                    ),
                    onPressed: () async {
                      var dateTime = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().subtract(
                          Duration(days: 1),
                        ),
                        lastDate: DateTime.now().add(
                          Duration(days: 365),
                        ),
                      );
                      produto.validade = Timestamp.fromDate(dateTime);
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    maxLength: 120,
                    onSaved: (String value) {
                      produto.infos = value;
                    },
                    decoration: InputDecoration(
                      labelStyle:
                          TextStyle(color: Colors.grey[700], fontSize: 15),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Informações adicionais',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
          Center(
            child: RaisedButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  formKey.currentState.save();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ConcluirOferta(
                        produto: produto,
                        base64: widget.base64 != null ? widget.base64 : null,
                        imageFile:
                            widget.imageFile != null ? widget.imageFile : null,
                        empresaID: widget.empresaID,
                      ),
                    ),
                  );
                }
              },
              child: Text("AVANÇAR"),
            ),
          ),
        ],
      ),
    );
  }
}
