import 'package:cached_network_image/cached_network_image.dart';
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
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Card(
      elevation: 10,
      child: (widget.produto.preco != null &&
              widget.produto.nomeProduto != "" &&
              double.tryParse(widget.produto.preco) != 0.0)
          ? Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 80,
                  width: 120,
                  child: Stack(
                    overflow: Overflow.visible,
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        imageUrl: widget.produto.imagem,
                        fit: BoxFit.fill,
                        errorWidget: (context, string, obj) {
                          return Center(
                            child: Text("ERRO NO CARREGAMENTO"),
                          );
                        },
                        placeholder: (context, url) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                      Positioned(
                        top: -12,
                        left: -5,
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.yellow,
                          ),
                          child: Text(
                            "${desconto.toStringAsPrecision(2)}%",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 120,
                  height: 1,
                  color: Colors.orange,
                ),
                Text(
                  widget.produto.nomeProduto,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (widget.produto.desconto != null)
                  Text("R\$${widget.produto.desconto}")
              ],
            )
          : Container(
              height: 80,
              width: 120,
              child: Stack(
                overflow: Overflow.visible,
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.produto.imagem,
                    fit: BoxFit.fill,
                    errorWidget: (context, string, obj) {
                      return Center(
                        child: Text("ERRO NO CARREGAMENTO"),
                      );
                    },
                    placeholder: (context, url) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
