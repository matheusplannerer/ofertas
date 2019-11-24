import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ofertas/controller/services.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:ofertas/amostra.dart';

class Teste extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TesteState();
  }
}

class _TesteState extends State<Teste> {
  Services services = Services();
  String email;
  GlobalKey _globalKey = new GlobalKey();

  Future<String> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary boundary =
          _globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);

      print(pngBytes);
      print(bs64);

      // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      //   return AmostraPage(bs64);
      // }));
      setState(() {});
      return bs64;
    } catch (e) {
      print(e);
    }
  }

  TextEditingController field1 = TextEditingController();
  TextEditingController field2 = TextEditingController();
  TextEditingController field3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: [
          RepaintBoundary(
            key: _globalKey,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: 400,
                  width: 350,
                  child: Image.asset(
                    "assets/cartaz2.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 110,
                  child: Text(
                    field1.text,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 140,
                  right: 160,
                  child: Text(
                    field2.text,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Positioned(
                  // top: 150,
                  // right: 50,
                  bottom: 80,
                  child: Text(
                    field3.text,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Nome do Produto",
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide()),
            ),
            onChanged: (nome) {
              setState(() {});
              // setState(() {
              //  field1.text = nome;
              // });
            },
            controller: field1,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Informaçoes extras",
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide()),
            ),
            onChanged: (nome) {
              setState(() {});
              // setState(() {
              //  field2.text = nome;
              // });
            },
            controller: field2,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Preço",
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide()),
            ),
            onChanged: (nome) {
              setState(() {});

              // setState(() {
              //  field3.text = nome;
              // });
            },
            controller: field3,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Container(
            child: RaisedButton(
              color: Colors.orange,
              child: Text('Visualizar Cartaz'),
              onPressed: () async {
                var base64 = await _capturePng();
                Navigator.of(context).pop(base64);
              },
            ),
          ),
        ],
      ),
    );
  }
}
