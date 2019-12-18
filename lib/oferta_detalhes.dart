import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ofertas/models/produtos.dart';
import 'package:ofertas/perfil_empresa.dart';

class OfertaDetalhe extends StatefulWidget {
  OfertaDetalhe({this.produto, this.empresaID});
  final Dados produto;
  final String empresaID;

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
          Stack(
            children: <Widget>[
              Image.network(widget.produto.imagem),
              Positioned(
                child: IconButton(
                  icon: Icon(Icons.local_mall),
                  iconSize: 40,
                  color: Colors.orange,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            PerfilEmpresaPage(widget.empresaID)));
                  },
                ),
                bottom: 0,
                right: 0,
              )
            ],
          ),
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
