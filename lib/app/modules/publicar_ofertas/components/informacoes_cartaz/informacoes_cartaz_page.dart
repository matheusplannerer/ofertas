import 'package:flutter/material.dart';

class InformacoesCartazPage extends StatefulWidget {
  final String title;
  const InformacoesCartazPage({Key key, this.title = "InformacoesCartaz"})
      : super(key: key);

  @override
  _InformacoesCartazPageState createState() => _InformacoesCartazPageState();
}

class _InformacoesCartazPageState extends State<InformacoesCartazPage> {
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
