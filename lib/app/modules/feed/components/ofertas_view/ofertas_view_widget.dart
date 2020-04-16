import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:ofertas/app/modules/feed/components/ofertas_view/ofertas_view_controller.dart';
import 'package:ofertas/app/modules/feed/feed_controller.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';

class OfertasViewWidget extends StatefulWidget {
  final OfertaModel oferta;
  OfertasViewWidget(this.oferta);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OfertasViewWidgetState(oferta);
  }
}

class _OfertasViewWidgetState
    extends ModularState<OfertasViewWidget, OfertasViewController>
    with AutomaticKeepAliveClientMixin<OfertasViewWidget> {
  final OfertaModel oferta;
  final FeedController feedController = Modular.get();
  _OfertasViewWidgetState(this.oferta);

  double desconto = 0.0;

  var fCurrency = NumberFormat.currency(locale: "pt", symbol: "R\$");

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    if (oferta.preco != null)
      oferta.preco = oferta.preco.replaceFirst(",", ".");
    if (oferta.desconto != null)
      oferta.desconto = oferta.desconto.replaceFirst(",", ".");

    if (oferta.preco != null && oferta.desconto != null) {
      desconto =
          (double.tryParse(oferta.desconto) - double.tryParse(oferta.preco)) /
              double.tryParse(oferta.preco) *
              100;

      // print(preco);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: () {
        controller.routeController.tab1Nav.pushNamed('/oferta_details',
            arguments: {
              'oferta': oferta,
              'fetchPage': feedController.fetchPage
            });
      },
      child: Card(
        elevation: 10,
        child: (oferta.preco != null &&
                oferta.nomeProduto != "" &&
                double.tryParse(oferta.preco) != 0.0)
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
                          imageUrl: oferta.imagem,
                          fit: BoxFit.contain,
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
                    oferta.nomeProduto,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (oferta.desconto != null)
                    Text(
                      "R\$${oferta.desconto}",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w600),
                    )
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
                      imageUrl: oferta.imagem,
                      fit: BoxFit.contain,
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
      ),
    );
  }
}
