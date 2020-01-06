import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:load/load.dart';
import 'package:ofertas/controller/_yapay-services.dart';
import 'package:ofertas/global/global.dart';
import 'package:provider/provider.dart';

class PagamentoBoleto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PagamentoBoletoState();
  }
}

class _PagamentoBoletoState extends State<PagamentoBoleto> {
  YapayServices yapay = YapayServices();

  TextEditingController nome = TextEditingController();
  TextEditingController valor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<Global>(context);
    // TODO: implement build
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
              controller: nome,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(),
                ),
                labelText: 'Nome completo',
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
              var response = await yapay.pagarBoleto(
                global.fbUser,
                nome: nome.text,
                valor: double.tryParse(valor.text),
              );
              hideLoadingDialog();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => _Boleto(
                        url: response.data['urlPagamento'],
                      )));
            },
            child: Text("GERAR BOLETO"),
          ),
        ],
      ),
    );
  }
}

class _Boleto extends StatefulWidget {
  final String url;
  _Boleto({this.url});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BoletoView(url: url);
  }
}

class _BoletoView extends State<_Boleto> {
  final String url;
  _BoletoView({this.url});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebviewScaffold(
      url: "https://www.google.com.br",
      mediaPlaybackRequiresUserGesture: false,
      appBar: AppBar(
        title: const Text('Widget WebView'),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        color: Colors.redAccent,
        child: const Center(
          child: Text('Waiting.....'),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.autorenew),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
