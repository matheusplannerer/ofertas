import 'package:firebase_storage/firebase_storage.dart';
import 'package:load/load.dart';

import 'teste.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:convert';

class AmostraPage extends StatelessWidget {
  AmostraPage(this.image);
  String image;

  bool subiu = false;

  void uploadFoto(String imageAux) async {
    StorageReference ref = FirebaseStorage.instance.ref();
    ref
        .child('cartaz2.jpg')
        .putData(base64Decode(imageAux))
        .onComplete
        .then((data) {
      subiu = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.memory(base64Decode(image)),
            Padding(padding: EdgeInsets.only(top: 30)),
            RaisedButton(
              color: Colors.orange,
              child: Text('Postar'),
              onPressed: () async {
                uploadFoto(image);
                showLoadingDialog();
                await Future.delayed(Duration(seconds: 5));
                hideLoadingDialog();
                Navigator.of(context)
                    .popUntil((Route<dynamic> route) => route.isFirst);
              },
            )
          ],
        ),
      ),
    );
  }
}
