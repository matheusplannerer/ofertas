import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ofertas/controller/_yapay-services.dart';

class Teste extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TesteState();
  }
}

class _TesteState extends State<Teste> {
  YapayServices yapay = YapayServices();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Center(
            child: RaisedButton(
              onPressed: () async {
              },
              child: Text("TESTE"),
            ),
          )
        ],
      ),
    );
  }
}
