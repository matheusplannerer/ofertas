import 'package:flutter/material.dart';
import 'package:ofertas/CA001.dart';
import 'package:ofertas/CA005.dart';


class CadastroUsuario extends StatelessWidget {
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
                context, MaterialPageRoute(builder: (context) => CA001()));
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'CADASTRO',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                SizedBox(height: 30),
                Text(
                  'Cadastro do usuário',
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
                            labelText: 'Nome completo',
                          ),
                          onSaved: (String value) {},
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'XXX.XXX.XXX-XX',
                            labelText: 'CPF',
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
                          children: [
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
                            Text('Li e concordo com os termos'),
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
                    color: Colors.blueGrey[200],
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CA005()));
                    },
                    child: Text(
                      'CONTINUAR',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
