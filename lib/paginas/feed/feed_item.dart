import 'package:flutter/material.dart';
import 'package:ofertas/models/produtos.dart';
import 'package:ofertas/paginas/feed/oferta_detalhes.dart';
import '../../shared/styles.dart';

const Color bgColor = Color(0xffF4F7FA);
//  const Color primaryColor = Colors.green;
const Color primaryColor = Color(0xFFF57C00);
const Color white = Colors.white;
const Color darkText = Colors.black54;
const Color highlightColor = Colors.orange;

class FeedItem extends StatefulWidget {
  final OfertaModel produto;
  final String empresaID;
  FeedItem(this.produto, this.empresaID);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FeedItemState();
  }
}

class _FeedItemState extends State<FeedItem> {
  OfertaModel produto;

  @override
  void initState() {
    // TODO: implement initSt
    super.initState();
    produto = widget.produto;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 180,
      height: 180,
      // color: Colors.red,
      margin: EdgeInsets.only(left: 20),
      child: Stack(
        children: <Widget>[
          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(border: Border.all(width: 0.75, color: Colors.grey), color: Colors.white),
            child: RaisedButton(
              color: Colors.white,
              // elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OfertaDetalhe(
                          produto: produto,
                          empresaID: widget.empresaID,
                        )));
              },
              child: Image.network(produto.imagem),
              // child: Hero(
              //   transitionOnUserGestures: true,
              //   tag: produto.produto,
              //   child: Image.asset("assets/mogi1.jpg"),
              // ),
            ),
          ),
          // Positioned(
          //   bottom: 70,
          //   right: 0,
          //   child: FlatButton(
          //     padding: EdgeInsets.all(20),
          //     shape: CircleBorder(),
          //     onPressed: () {},
          //     child: Icon(
          //       (produto.isFavorite) ? Icons.favorite : Icons.favorite_border,
          //       color: (produto.isFavorite) ? primaryColor : darkText,
          //       size: 30,
          //     ),
          //   ),
          // ),
          Positioned(
            bottom: 10,
            left: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Icon(
                      Icons.shop_two,
                      color: Colors.orange,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Text(produto.nomeProduto != null ? produto.nomeProduto : "Testando",
                        style: foodNameText),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.attach_money,
                      color: Colors.orange,
                      size: 25,
                    ),
                    SizedBox(width: 5),
                    Text(
                        produto.desconto != null
                            ? produto.desconto
                            : produto.preco,
                        style: priceText),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: (produto.desconto != null &&
                    produto.desconto != '' &&
                    produto.preco != '' &&
                    produto.preco != null)
                ? Container(
                    padding:
                        EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      '-' +
                          (100 -
                                  (double.tryParse(produto.desconto) *
                                      100 /
                                      double.tryParse(produto.preco)))
                              .toStringAsPrecision(2) +
                          '%',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  )
                : SizedBox(width: 0),
          )
        ],
      ),
    );
  }
}
