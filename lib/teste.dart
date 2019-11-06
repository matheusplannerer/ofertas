import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ofertas/controller/services.dart';

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

  TextEditingController field1 = TextEditingController();
  TextEditingController field2 = TextEditingController();
  TextEditingController field3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          RepaintBoundary(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: 400,
                  width: 350,
                  child: Image.asset(
                    "assets/cartaz.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  // top: 150,
                  // right: 50,
                  child: Text(
                    field1.text,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 170,
                  right: 160,
                  child: Text(
                    field2.text,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Positioned(
                  // top: 150,
                  // right: 50,
                  bottom: 100,
                  child: Text(
                    field3.text,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: RaisedButton(
              child: Text("TESTE"),
              onPressed: () async {},
            ),
          ),
          TextFormField(
            controller: field1,
          ),
          TextFormField(
            controller: field2,
          ),
          TextFormField(
            controller: field3,
          ),
        ],
      ),
    );
  }
}
