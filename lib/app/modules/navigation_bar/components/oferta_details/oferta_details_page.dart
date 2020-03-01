import 'package:flutter/material.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';

class OfertaDetailsPage extends StatefulWidget {
  final OfertaModel oferta;
  final String title;
  const OfertaDetailsPage({Key key, this.title = "OfertaDetails", this.oferta})
      : super(key: key);

  @override
  _OfertaDetailsPageState createState() => _OfertaDetailsPageState();
}

class _OfertaDetailsPageState extends State<OfertaDetailsPage> {
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
