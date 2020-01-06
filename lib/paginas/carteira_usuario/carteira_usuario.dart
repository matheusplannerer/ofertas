import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ofertas/controller/_yapay-services.dart';
import 'package:ofertas/global/global.dart';
import 'package:ofertas/paginas/carteira_usuario/pagamento_boleto.dart';
import 'package:ofertas/paginas/carteira_usuario/pagamento_credito.dart';

import 'package:provider/provider.dart';

class Carteira extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CarteiraState();
  }
}

class _CarteiraState extends State<Carteira> {
  YapayServices yapay = YapayServices();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var global = Provider.of<Global>(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 6,
            margin: EdgeInsets.all(30),
            // color: Colors.grey,
            child: Column(
              children: <Widget>[
                Text(
                  "CARTEIRA VIRTUAL",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                FutureBuilder<DocumentSnapshot>(
                  future: Firestore.instance
                      .collection('carteira')
                      .document(global.fbUser.uid)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData) {
                      if (snapshot.data.exists) {
                        return Text(
                          "R\$${snapshot.data.data['carteira'].toStringAsFixed(2)}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      } else {
                        Firestore.instance
                            .collection('carteira')
                            .document(global.fbUser.uid)
                            .setData({'carteira': 0.0});
                        return Text(
                          "R\$0,00",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }
                    } else {
                      return Text("ERRO");
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: MediaQuery.of(context).size.width - 50,
            child: RaisedButton(
              onPressed: () async {
                var forma = await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("MEIO DE PAGAMENTO"),
                    // actions: <Widget>[
                    //   FlatButton(
                    //     child: Text("Cancelar"),
                    //     onPressed: () {},
                    //   )
                    // ],
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FlatButton(
                            child: Text("CRÉDITO"),
                            onPressed: () {
                              Navigator.of(context).pop("credito");
                            },
                          ),
                          FlatButton(
                            child: Text("BOLETO"),
                            onPressed: () {
                              Navigator.of(context).pop("boleto");
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );

                if (forma.runtimeType != bool) {
                  if (forma == "boleto") {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PagamentoBoleto()));
                    // yapay.pagarBoleto(global.fbUser);
                  } else if (forma == "credito") {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PagamentoCredito()));
                  }
                }
              },
              child: Text("ADICIONAR FUNDOS"),
            ),
          )
        ],
      ),
    );
  }
}
