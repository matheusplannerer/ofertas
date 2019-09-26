import 'package:flutter/material.dart';
import 'package:ofertas/CA0011.dart';

class CA0010 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CaixinhaPage(),
    );
  }
}

class CaixinhaPage extends StatefulWidget {
  @override
  _CaixinhaPage createState() => _CaixinhaPage();
}

class _CaixinhaPage extends State<CaixinhaPage> {
  bool checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'C A D A S T R O',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 30),
          Column(
            children: <Widget>[
              Text(
                'Confirmação de documentos',
                textAlign: TextAlign.center,
              ),
              Text(
                'Nome da empresa no app',
                textAlign: TextAlign.center,
              ),
              Container(
                width: MediaQuery.of(context).size.height / 2,
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'N° do CNPJ',
                          labelText: 'CNPJ',
                        ),
                        onSaved: (String value) {},
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Insira Razão Social',
                          labelText: 'Razão Social',
                        ),
                        onSaved: (String value) {},
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Nome Fantasia',
                          labelText: 'Insira o nome fantasia',
                        ),
                        onSaved: (String value) {},
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 1.7,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Inscrição Municipal',
                                labelText: 'Insira inscrição municipal',
                              ),
                              onSaved: (String value) {},
                            ),
                          ),
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
                          Text('Isento'),
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Insira nome do sócio 1',
                          labelText: 'Nome do sócio 1',
                        ),
                        onSaved: (String value) {},
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: '(XX) XXXXX - XXXX',
                          labelText: 'Contato sócio 1',
                        ),
                        onSaved: (String value) {},
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'exemplo@ofertas.com',
                          labelText: 'E-mail do sócio 1',
                        ),
                        onSaved: (String value) {},
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Imsira o CPF do sócio 1',
                          labelText: 'CPF do sócio 1',
                        ),
                        onSaved: (String value) {},
                      ),
                    ],
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
                    context, MaterialPageRoute(builder: (context) => CA0011()));
              },
              child: Text(
                'Enviar',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
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
