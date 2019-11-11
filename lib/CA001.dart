import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:ofertas/CA006.dart';
import 'package:ofertas/Dashboard.dart';
import 'package:ofertas/controller/services.dart';
import 'package:ofertas/CA004.dart';
import 'package:ofertas/cadastro_usuario.dart';
import 'package:ofertas/login.dart';
import 'package:ofertas/Dashboard.dart';

class CA001 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CA001();
  }
}

class _CA001 extends State<CA001> {
  bool isUsuario = false;
  bool isEmpresa = false;
  bool errorMsg = false;

  final Services services = Services();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'CADASTRO',
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(50),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/mogi.jpg', scale: 1.5),
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
              child: FlatButton.icon(
                icon: Icon(Icons.email),
                color: Colors.blueGrey[200],
                textColor: Colors.white,
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        title: Text('Cadastrar como:'),
                        children: [
                          SimpleDialogOption(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CadastroUsuario()));
                            },
                            child:
                                Text('Usuário', style: TextStyle(fontSize: 18)),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard()));
                            },
                            child:
                                Text('Empresa', style: TextStyle(fontSize: 18)),
                          ),
                        ],
                      );
                    },
                  );
                },
                label: Text(
                  'CADASTRE COM E-MAIL',
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
                icon: Icon(Icons.face),
                color: Colors.blueGrey[200],
                textColor: Colors.white,
                onPressed: () {},
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
                color: Colors.blueGrey[200],
                textColor: Colors.white,
                onPressed: () {},
                label: Text(
                  'CADASTRE COM GOOGLE',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
