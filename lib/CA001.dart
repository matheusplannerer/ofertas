import 'package:flutter/material.dart';
import 'package:ofertas/CA002.dart';
import 'package:ofertas/main.dart';
import 'package:ofertas/CA004.dart';
import 'package:ofertas/CA003.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          title: Text(
            'CADASTRO',
            textAlign: TextAlign.center,
          ),titleSpacing: 0.3,
        ),
        body: Column(
          children:[
            Card(
              child: Image.asset('assets/mogi.jpg', scale: 1.5),
              margin: EdgeInsets.all(10),
            ),
            Text(
              'Você está a poucos cliques de divulgar suas ofertas para a cidade inteira!',
              textScaleFactor: 10,
              style: TextStyle(fontSize: 2),
              textAlign: TextAlign.center,
            ),
            SizedBox(width: 1),
            ButtonTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0)),
              minWidth: 350.0,
              height: 50.0,
              child: RaisedButton(
                color: Colors.blueGrey[300],
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CA004()));
                },
                child: Text(
                  'CADASTRE COM E-MAIL',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              width: 1,
            ),
            Text(
              'OU',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 1,
            ),

            ButtonTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0)),
              minWidth: 350.0,
              height: 50.0,
              child: RaisedButton(
                color: Colors.blueGrey[300],
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CA002()));
                },
                child: Text(
                  'CADASTRE COM FACEBOOK',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              width: 1,
            ),
            ButtonTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0)),
              minWidth: 350.0,
              height: 50.0,
              child: RaisedButton(
                color: Colors.blueGrey[300],
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CA003()));
                },
                child: Text(
                  'CADASTRE COM GOOGLE',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ));
  }
}
