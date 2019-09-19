import 'package:flutter/material.dart';
import 'package:ofertas/CA002.dart';
import 'package:ofertas/main.dart';
import 'package:ofertas/CA004.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text(
            'CADASTRO',
            textAlign: TextAlign.center,
          ),titleSpacing: 0.3,
        ),
        body: Column(
          children: <Widget>[
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
            SizedBox(width: 0.5),
            RaisedButton(
              onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => CA004()));
              },
              color: Colors.blue,
              child: Text(
                'Cadastre com e-mail',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 0.25,
            ),
            Text(
              'OU',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 0.25,
            ),
            RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CA002()));
              },
              color: Colors.blue,
              child: Text(
                'Cadastre com Facebook',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 0.25,
            ),
            RaisedButton(
              onPressed: (){},
              color: Colors.blue,
              child: Text(
                'Cadastre com Gmail',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }
}
