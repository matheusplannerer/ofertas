import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:ofertas/controller/_yapay-services.dart';
import 'package:ofertas/global/global.dart';
import 'package:provider/provider.dart';

class PagamentoCredito extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PagamentoCreditoState();
  }
}

class _PagamentoCreditoState extends State<PagamentoCredito> {
  YapayServices yapay = YapayServices();

  TextEditingController nome = TextEditingController();
  TextEditingController numeroCartao = TextEditingController();
  TextEditingController validade = TextEditingController();
  TextEditingController cvv = TextEditingController();
  TextEditingController valor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var global = Provider.of<Global>(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              keyboardType: TextInputType.text,
              validator: (String value) {
                if (value.length >= 1) {
                  return null;
                } else {
                  return "Campo inválido";
                }
              },
              onSaved: (String value) {},
              controller: numeroCartao,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(),
                ),
                labelText: 'Numero do Cartão',
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: cvv,
              keyboardType: TextInputType.number,
              validator: (String value) {
                if (value.length >= 1) {
                  return null;
                } else {
                  return "Campo inválido";
                }
              },
              onSaved: (String value) {},
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(),
                ),
                labelText: 'CVV',
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: nome,
              keyboardType: TextInputType.text,
              validator: (String value) {
                if (value.length >= 1) {
                  return null;
                } else {
                  return "Campo inválido";
                }
              },
              onSaved: (String value) {},
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(),
                ),
                labelText: 'Nome do cartão',
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: validade,
              keyboardType: TextInputType.text,
              validator: (String value) {
                if (value.length >= 1) {
                  return null;
                } else {
                  return "Campo inválido";
                }
              },
              onSaved: (String value) {},
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(),
                ),
                labelText: 'Validade',
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: valor,
              keyboardType: TextInputType.number,
              validator: (String value) {
                if (value.length >= 1) {
                  return null;
                } else {
                  return "Campo inválido";
                }
              },
              onSaved: (String value) {},
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(),
                ),
                labelText: 'Valor',
              ),
            ),
          ),
          SizedBox(height: 10),
          RaisedButton(
            onPressed: () async {
              showLoadingDialog(tapDismiss: false);
              var response = await yapay.pagarCredito(
                  double.tryParse(valor.text), global.fbUser);
              hideLoadingDialog();
              if (response) {
                Navigator.of(context)
                    .popUntil((Route<dynamic> route) => route.isFirst);
              }
            },
            child: Text("REALIZAR PAGAMENTO"),
          ),
        ],
      ),
    );
  }
}
