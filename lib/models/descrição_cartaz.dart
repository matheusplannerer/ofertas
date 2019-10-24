import 'package:flutter/material.dart';
import 'cartaz.dart';

class DadosCartaz extends StatefulWidget {
  _DadosCartazState createState() => _DadosCartazState();
}

class _DadosCartazState extends State<DadosCartaz> {
  var formKey = GlobalKey<FormState>();
  String nomeproduto = "";
  String informacoes = "";
  String precoantigo = "";
  String preconovo = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        color: Colors.red[300],
        child: Container(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 80.0),
                  ),
                  Text('Criando seu Cartaz',
                      style: TextStyle(color: Colors.white, fontSize: 25.0)),
                  Padding(
                    padding: EdgeInsets.only(top: 50.0),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          onSaved: (String value) {
                            nomeproduto = value;
                          },
                          decoration: InputDecoration(
                            labelText: "Nome do Produto",
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide()),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.0),
                        ),
                        TextFormField(
                          onSaved: (String value) {
                            informacoes = value;
                            print(informacoes);
                          },
                          decoration: InputDecoration(
                            labelText: "Informações (opcionais)",
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide()),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.0),
                        ),
                        TextFormField(
                          onSaved: (String value) {
                            precoantigo = value;
                          },
                          decoration: InputDecoration(
                            labelText: "Preço antigo",
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide()),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.0),
                        ),
                        TextFormField(
                          onSaved: (String value) {
                            preconovo = value;
                          },
                          decoration: InputDecoration(
                            labelText: "Preço da promoção",
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide()),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                      child: Text('Continuar'),
                      color: Colors.blueGrey[200],
                      textColor: Colors.white,
                      onPressed: () {
                        formKey.currentState.save();
                        print(nomeproduto);
                        print(informacoes);
                        print(precoantigo);
                        print(preconovo);
                         Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return CartazPage(nomeproduto,informacoes,precoantigo,preconovo);
                        }));
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
