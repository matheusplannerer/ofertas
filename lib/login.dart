import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ofertas/CA001.dart';
import 'package:ofertas/cadastro.dart';
import 'package:ofertas/controller/services.dart';
import 'package:ofertas/global/global.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _login = TextEditingController();
  TextEditingController _password = TextEditingController();

  Services services = Services();

  FirebaseUser fbUser;

  bool errorMsg = false;

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<Global>(context);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Center(
            child: Image.asset('assets/mogi.jpg'),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
            child: TextField(
              controller: _login,
              decoration: InputDecoration(labelText: "E-MAIL"),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
            child: TextField(
              controller: _password,
              decoration: InputDecoration(labelText: "SENHA"),
            ),
          ),
          if (errorMsg)
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
              child: Text(
                "E-mail ou senha incorretos",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red),
              ),
            ),
          SizedBox(height: 30),
          Container(
            child: RaisedButton(
              child: Text("ENTRAR"),
              onPressed: () async {
                fbUser = await services.auth.login(_login.text, _password.text);

                if (fbUser != null) {
                  //Logou com sucesso
                  global.fbUser = fbUser;

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) =>
                          CA001())); //Ver certinho qual a página inicial
                } else {
                  setState(() {
                    errorMsg = true;
                  });
                }
              },
            ),
          ),
          SizedBox(height: 15),
          Container(
            child: RaisedButton(
              child: Text("CADASTRAR"),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CadastroPage()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
