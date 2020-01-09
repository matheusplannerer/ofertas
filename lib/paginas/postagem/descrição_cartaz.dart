import 'package:flutter/material.dart';
import 'package:ofertas/models/produtos.dart';

class DadosCartaz extends StatefulWidget {
  _DadosCartazState createState() => _DadosCartazState();
}

class _DadosCartazState extends State<DadosCartaz> {
  @override
  Widget build(BuildContext context) {
    OfertaModel cartaz = OfertaModel();
    // TODO: implement build
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
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nome do Produto",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide()),
                    ),
                    onSaved: (String value) {
                      cartaz.nomeProduto = value;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Informações (opcionais)",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide()),
                    ),
                    onSaved: (String value) {
                      cartaz.infos = value;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Preço antigo",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide()),
                    ),
                    onSaved: (String value) {
                      cartaz.preco = value;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Preço da promoção",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide()),
                    ),
                    onSaved: (String value) {
                      cartaz.desconto = value;
                    },
                  ),
                  RaisedButton(
                    onPressed: () {
                     
                      print(cartaz.nomeProduto);
                      print(cartaz.infos);
                      print(cartaz.preco);
                      print(cartaz.desconto);
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
