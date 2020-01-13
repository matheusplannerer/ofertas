import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ofertas/models/produtos.dart';

class ModeloOfertaView extends StatefulWidget {
  ModeloOfertaView({this.produto});
  final OfertaModel produto;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ModeloOfertaViewState();
  }
}

class _ModeloOfertaViewState extends State<ModeloOfertaView> {
  double desconto = 0.0;

  var fCurrency = NumberFormat.currency(locale: "pt", symbol: "R\$");

  @override
  void initState() {
    // TODO: implement initState
    if (widget.produto.preco != null)
      widget.produto.preco = widget.produto.preco.replaceFirst(",", ".");
    if (widget.produto.desconto != null)
      widget.produto.desconto = widget.produto.desconto.replaceFirst(",", ".");

    if (widget.produto.preco != null && widget.produto.desconto != null) {
      desconto = (double.tryParse(widget.produto.desconto) -
              double.tryParse(widget.produto.preco)) /
          double.tryParse(widget.produto.preco) *
          100;

      // print(preco);
      print(desconto);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      children: <Widget>[
        Container(
          height: 90,
          width: MediaQuery.of(context).size.width * 0.7 - 15,
          child: Stack(
            fit: StackFit.passthrough,
            children: <Widget>[
              Image.network(
                widget.produto.imagem,
                fit: BoxFit.fill,
                loadingBuilder: (context, child, imgChunck) {
                  if (imgChunck == null) {
                    return child;
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
              if (desconto != null)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: CircleAvatar(
                    maxRadius: 25,
                    child: Text(
                      "-%" + (desconto * -1).toStringAsFixed(0),
                    ),
                  ),
                )
            ],
          ),
        ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.7 - 15,
          // color: Colors.green,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1),
              left: BorderSide(width: 1),
              right: BorderSide(width: 1),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (desconto != null)
                Text(
                  " " +
                      fCurrency
                          .format(double.tryParse(widget.produto.desconto)),
                  style: TextStyle(
                      fontFamily: "Body",
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              Text(
                " " + widget.produto.nomeProduto.toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontFamily: "Body", fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
