import 'teste.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';

class AmostraPage extends StatelessWidget {
  AmostraPage(this.image);
String image;

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
   onPressed: (){

   },
 )

          ],
        ),
      ),
    );
  }
}