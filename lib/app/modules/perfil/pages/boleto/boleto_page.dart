import 'package:flutter/material.dart';

class BoletoPage extends StatefulWidget {
  final String title;
  const BoletoPage({Key key, this.title = "Boleto"}) : super(key: key);

  @override
  _BoletoPageState createState() => _BoletoPageState();
}

class _BoletoPageState extends State<BoletoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
