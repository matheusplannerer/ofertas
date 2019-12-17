import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ofertas/models/produtos.dart';

class OfertaDetalhe extends StatefulWidget {
  OfertaDetalhe({this.produto});
  final Dados produto;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OfertaDetalheState();
  }
}

class _OfertaDetalheState extends State<OfertaDetalhe> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Image.network(widget.produto.imagem),
          ListTile(
            title: Text("PRODUTO: " + widget.produto.produto),
          ),
          ListTile(
            title: Text("PREÇO: " + widget.produto.preco),
          ),
          ListTile(
            title: Text("C/ DESCONTO: " + widget.produto.desconto),
          ),
          ListTile(
            title: Text("VALIDADE: " +
                DateFormat("dd/MM/yy")
                    .format(widget.produto.validade.toDate())),
          ),
          ListTile(
            title: Text("INFORMAÇÕES: " + widget.produto.infos),
          )
        ],
      ),
    );
  }
}
