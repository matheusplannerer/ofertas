import 'package:flutter/material.dart';
import 'package:ofertas/CA001.dart';
import 'package:ofertas/CA004.dart';
import 'package:ofertas/CA006.dart';
import 'package:ofertas/controller/services.dart';
import 'package:provider/provider.dart';
import 'package:ofertas/global/global.dart';

class CadastroPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CadastroPageState();
  }
}

class _CadastroPageState extends State<CadastroPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  Services services = Services();

  bool isUsuario = true;

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<Global>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[100],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CA001()));
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'Cadastrar',
          style: TextStyle(fontSize: 19, color: Colors.white),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(height: 60),
            Text(
              'Google',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35, color: Colors.grey[400]),
            ),
            SizedBox(height: 10),
            Text(
              'Sign in with your Goolge Account',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.grey[400]),
            ),
            SizedBox(height: 30),
            Center(
              child: Card(
                color: Colors.grey[50],
                elevation: 1,
                margin: EdgeInsets.only(right: 35.0, left: 35.0),
                child: Column(
                  children: [
                    Icon(Icons.person_pin,
                        color: Colors.blueGrey[200], size: 90),
                    Container(
                      margin: EdgeInsets.only(right: 25.0, left: 25.0, top: 20),
                      child: TextField(
                        controller: _email,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          hintText: 'Email',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 25.0, left: 25.0, top: 5),
                      child: TextField(
                        controller: _password,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          hintText: 'Password',
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        CheckboxListTile(
                          title: Text("USUÁRIO"),
                          value: isUsuario,
                          onChanged: (value) {
                            setState(() {
                              isUsuario = value;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text("EMPRESA"),
                          value: !isUsuario,
                          onChanged: (value) {
                            setState(() {
                              isUsuario = !value;
                            });
                          },
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 25, right: 25, top: 20.0, bottom: 15.0),
                      child: Center(
                        child: ButtonTheme(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          minWidth: 290.0,
                          height: 40.0,
                          child: RaisedButton(
                            color: Colors.blueGrey[300],
                            textColor: Colors.white,
                            onPressed: () async {
                              if (isUsuario) {
                                //Cadastro de usuario joga no feed
                                var data = await services.auth
                                    .signUp(_email.text, _password.text);

                              } else {
                                //Cadastro de empresa joga no cadastroEmpresa CA006
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CA006()));

                              }

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => CA004()));
                            },
                            child: Text(
                              'CADASTRAR',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
