import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ofertas/models/produtos.dart';
import 'package:ofertas/paginas/perfil/perfil_empresa.dart';

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
            title: Text("PRODUTO: "),
            subtitle: Text(widget.produto.produto),
          ),
          Divider(color: Colors.orange),
          ListTile(
            title: Text("PREÇO: "),
            subtitle: Text(widget.produto.preco),
          ),
          Divider(color: Colors.orange,),
          ListTile(
            title: Text("C/ DESCONTO: "),
            subtitle: Text(widget.produto.desconto),
          ),
          Divider(),
          ListTile(
            title: Text("VALIDADE: "),
            subtitle: Text( DateFormat("dd/MM/yy")
                    .format(widget.produto.validade.toDate())),
          ),
          Divider(color: Colors.orange),
          ListTile(
            title: Text("INFORMAÇÕES: "),
            subtitle: Text(widget.produto.infos),
          )
        ],
      ),
    );
  }
}
