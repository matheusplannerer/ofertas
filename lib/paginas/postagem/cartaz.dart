import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ofertas/controller/services.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cartaz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CartazState();
  }
}

class _CartazState extends State<Cartaz> {
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


      setState(() {});
      return bs64;
    } catch (e) {
      print(e);
    }
  }

  TextEditingController field1 = TextEditingController();
  TextEditingController field2 = TextEditingController();
  TextEditingController field3 = TextEditingController();

  // Widget horizontalLine() => Padding(
  //       padding: EdgeInsets.symmetric(horizontal: 16.0),
  //       child: Container(
  //         width: ScreenUtil.getInstance().setWidth(120),
  //         height: 1.0,
  //         color: Colors.black,
  //       ),
  //     );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        gradient:
            LinearGradient(colors: [Colors.orange[900], Colors.orange[300]]),
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
                Container(
                  height: 400,
                  width: 285,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 90),
                      ),
                      AutoSizeText(
                        field1.text,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Xampolo',
                          color: Colors.red,
                          fontSize: 80,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      AutoSizeText(
                        field2.text,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Xampolo',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: <Widget>[
                          AutoSizeText(
                            'R\$ ',
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: 'Xampolo',
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 40,
                            ),
                          ),
                          AutoSizeText(
                            field3.text,
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: 'Xampolo',
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 90,
                            ),
                          ),
                        ],
                      ),
                    ],
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
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Valor com desconto",
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
