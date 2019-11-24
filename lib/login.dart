import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:ofertas/Dashboard.dart';
import 'package:ofertas/perfil_usuario.dart';
import 'package:ofertas/CA001.dart';
import 'package:ofertas/controller/services.dart';
import 'package:ofertas/global/global.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _login = TextEditingController();
  TextEditingController _password = TextEditingController();

  Services services = Services();

  FirebaseUser fbUser;

  bool errorMsg = false;

  bool isUsuario = false;
  bool isEmpresa = false;

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<Global>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('INÍCIO'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Image.asset('assets/mogi.jpg', scale: 1.2),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 15, 0, 5),
              child: TextField(
                controller: _login,
                decoration: InputDecoration(labelText: "E-MAIL"),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
              child: TextField(
                obscureText: true,
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
                textColor: Colors.white,
                color: Colors.orange,
                child: Text("ENTRAR"),
                onPressed: () async {
                  showLoadingDialog();
                  fbUser =
                      await services.auth.login(_login.text, _password.text);
                  hideLoadingDialog();

                  if (fbUser != null) {
                    //Logou com sucesso
                    global.fbUser = fbUser;

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            Dashboard())); //Ver certinho qual a página inicial
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
                color: Colors.orange,
                textColor: Colors.white,
                child: Text("CADASTRAR"),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => CA001()));
                },
              ),
            ),
            SizedBox(height: 15),
            Container(
              child: RaisedButton(
                color: Colors.orange,
                textColor: Colors.white,
                child: Text("RECUPERAR SENHA"),
                onPressed: () async {
                  TextEditingController email = TextEditingController();
                  var recuperou = await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Insira o e-mail de recuperação"),
                          content: TextField(
                            controller: email,
                            decoration: InputDecoration(labelText: "EMAIL"),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("CANCELAR"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            FlatButton(
                              child: Text("RECUPERAR"),
                              onPressed: () async {
                                showLoadingDialog();
                                await Services()
                                    .auth
                                    .recoveryPassword(email.text);
                                hideLoadingDialog();
                                Navigator.of(context).pop(true);
                              },
                            ),
                          ],
                        );
                      });
                  // if (recuperou) {
                  //   Scaffold.of(context).showSnackBar(
                  //     SnackBar(
                  //       duration: Duration(seconds: 3),
                  //       content:
                  //           Text("E-mail de recuperação enviado com sucesso"),
                  //     ),
                  //   );
                  // }
                },
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
