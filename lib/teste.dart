import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ofertas/controller/services.dart';

class Teste extends StatelessWidget {
  
  Services services = Services();

  String email;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RaisedButton(
          child: Text("TESTE"),
          onPressed: () async {
            
          },
        ),
      ),
    );
  }
}
