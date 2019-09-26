import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:ofertas/CA002.dart';
import 'package:ofertas/controller/CA001-controller.dart';
import 'package:ofertas/main.dart';
import 'package:ofertas/CA004.dart';
import 'package:ofertas/CA003.dart';

void main() => runApp(MyApp());

class CA001 extends StatelessWidget {
  final CA001Controller _loginController = CA001Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(
          'CADASTRO',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            child: Image.asset('assets/mogi.jpg', scale: 1.5),
            margin: EdgeInsets.all(10),
          ),
          Text(
            'Você está a poucos cliques de divulgar suas ofertas para a cidade inteira!',
            textScaleFactor: 12,
            style: TextStyle(fontSize: 2),
            textAlign: TextAlign.center,
          ),
          ButtonTheme(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5.0)),
            minWidth: 325.0,
            height: 50.0,
            child: RaisedButton(
              color: Colors.blueGrey[300],
              textColor: Colors.white,
              onPressed: () async {
                showLoadingDialog();
                var fbUser = await _loginController.login('', '');
                hideLoadingDialog();
                if (fbUser == null) {
                  //não logou

                } else {
                  // logou
                  
                }
              },
              child: Text(
                'ENTRAR',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          SizedBox(height: 10),
          ButtonTheme(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5.0)),
            minWidth: 325.0,
            height: 50.0,
            child: RaisedButton(
              color: Colors.blueGrey[300],
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => CA004()));
              },
              child: Text(
                'CADASTRE COM E-MAIL',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          Text(
            'OU',
            textAlign: TextAlign.center,
          ),
          ButtonTheme(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5.0)),
            minWidth: 325.0,
            height: 50.0,
            child: FlatButton.icon(
              icon: Icon(Icons.face),
              color: Colors.blueGrey[300],
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => CA002()));
              },
              label: Text(
                'CADASTRE COM FACEBOOK',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          ButtonTheme(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5.0)),
            minWidth: 325.0,
            height: 50.0,
            child: FlatButton.icon(
              icon: Icon(Icons.group),
              color: Colors.blueGrey[300],
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => CA003()));
              },
              label: Text(
                'CADASTRE COM GOOGLE',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
