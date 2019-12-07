import 'package:flutter/material.dart';
import 'package:ofertas/models/produtos.dart';
import './shared/colors.dart';
import './shared/styles.dart';

const Color bgColor = Color(0xffF4F7FA);
//  const Color primaryColor = Colors.green;
const Color primaryColor = Color(0xFFF57C00);
const Color white = Colors.white;
const Color darkText = Colors.black54;
const Color highlightColor = Colors.orange;

class FeedItem extends StatefulWidget {
  final Dados produto;
  FeedItem(this.produto);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FeedItemState();
  }
}

class _FeedItemState extends State<FeedItem> {
  Dados produto;

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
            child: RaisedButton(
              color: white,
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              onPressed: () {},
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
            bottom: 0,
            left: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(produto.produto != null ? produto.produto : "Testando",
                    style: foodNameText),
                Text(produto.preco != null ? produto.preco : "R\$50,00",
                    style: priceText),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: (produto.desconto != null)
                ? Container(
                    padding:
                        EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      '-' + produto.desconto.toString() + '%',
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
