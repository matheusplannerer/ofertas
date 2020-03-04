import 'package:flutter/material.dart';

class InformacoesUploadPage extends StatefulWidget {
  final String title;
  const InformacoesUploadPage({Key key, this.title = "InformacoesUpload"})
      : super(key: key);

  @override
  _InformacoesUploadPageState createState() => _InformacoesUploadPageState();
}

class _InformacoesUploadPageState extends State<InformacoesUploadPage> {
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
