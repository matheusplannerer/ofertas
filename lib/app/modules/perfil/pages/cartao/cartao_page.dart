import 'package:flutter/material.dart';

class CartaoPage extends StatefulWidget {
  final String title;
  const CartaoPage({Key key, this.title = "Cartao"}) : super(key: key);

  @override
  _CartaoPageState createState() => _CartaoPageState();
}

class _CartaoPageState extends State<CartaoPage> {
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
