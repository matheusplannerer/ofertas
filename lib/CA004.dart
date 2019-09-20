import 'package:flutter/material.dart';
import 'package:ofertas/CA002.dart';
import 'package:ofertas/CA005.dart';

class CA004 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CA002()));
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'C A D A S T R O',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              SizedBox(height: 30),
              Text(
                'Cadastro da empresa',
                style: TextStyle(fontSize: 25, color: Colors.grey[800]),
              ),
              Wrap(
                children: <Widget>[
                  Text(
                    'Complete as informações abaixo para Realizar seu cadastro',
                    style: TextStyle(fontSize: 18, color: Colors.grey[400]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.height / 2,
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Como vai aparecer no app',
                          labelText: 'Nome da empresa',
                        ),
                        onSaved: (String value) {},
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'trocar por uma lista',
                          labelText:
                              'Categoria principal de atuação da Empresa',
                        ),
                        onSaved: (String value) {},
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: '(XX) X XXXX-XXXX',
                          labelText: 'Celular',
                        ),
                        onSaved: (String value) {},
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'ofertas@ofertas.com',
                          labelText: 'E-mail (utilizado para acesso ao app) ',
                        ),
                        onSaved: (String value) {},
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText:
                              'Mínimo de 6 caracteres e ao menos 1 número',
                          labelText: 'Senha (utilizado para acesso ao app)',
                        ),
                        onSaved: (String value) {},
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Confirme sua senha',
                        ),
                        onSaved: (String value) {},
                      ),
                      Row(
                        children: <Widget>[
                          Checkbox(
                            value: checkbox,
                            onChanged: (bool value) {
                              setState(
                                () {
                                  checkbox = value;
                                },
                              );
                            },
                          ),
                          Text("Eu li e concordo com os termos de uso"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ButtonTheme(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
                minWidth: 250.0,
                height: 50.0,
                child: RaisedButton(
                  color: Colors.green[300],
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CA005()));
                  },
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
