import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:ofertas/app/modules/perfil_empresa/pages/oferta_details/oferta_details_controller.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';
import 'package:provider/provider.dart';

class OfertaDetailsPage extends StatefulWidget {
  final OfertaModel oferta;
  final String title;
  const OfertaDetailsPage({Key key, this.title = "OfertaDetails", this.oferta})
      : super(key: key);

  @override
  _OfertaDetailsPageState createState() => _OfertaDetailsPageState();
}

class _OfertaDetailsPageState
    extends ModularState<OfertaDetailsPage, OfertaDetailsController> {
  CachedNetworkImage image;
  bool isCartaz = false; //Cartaz digital
  bool isFolheto = false; //Folheto

  bool isOwner = false;

  OfertaModel oferta;

  @override
  void initState() {
    super.initState();
    oferta = widget.oferta;
    image = CachedNetworkImage(
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
    );

    if (oferta.preco == null) {
      isCartaz = false;
      isFolheto = true;
    }
    if (oferta.preco == null) {
      isCartaz = true;
      isFolheto = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<GlobalService>(context);
    return Scaffold(
      appBar: GradientAppBar(
        // title: Text(titulo),
        gradient: LinearGradient(
          colors: [
            Colors.orange[900],
            Colors.orange[300],
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: GestureDetector(
                      onTap: () {
                        Modular.navigatorKey.currentState
                            .pushNamed('/zoom_image', arguments: image);
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => ZoomImage(image)));
                      },
                      child: image,
                    ),
                    height: 275,
                  ),
                  Positioned(
                    child: IconButton(
                      icon: Icon(Icons.local_mall),
                      iconSize: 40,
                      color: Colors.orange,
                      onPressed: () async {
                        if (controller.routeController.navIndex == 0) {
                          controller
                              .routeController.actualNavigator.currentState
                              .pushNamedAndRemoveUntil(
                                  '/perfilEmpresa', ModalRoute.withName('/'),
                                  arguments: oferta.empresaDona);
                        } else {
                          controller
                              .routeController.actualNavigator.currentState
                              .pop();
                        }
                      },
                    ),
                    bottom: 0,
                    right: 0,
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (oferta.nomeProduto != null)
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          text: "Nome do Produto: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                          children: [
                            TextSpan(
                              text: oferta.nomeProduto,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    if (oferta.preco != null)
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          text: "Valor sem desconto: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                          children: [
                            TextSpan(
                              text: "R\$${oferta.preco.replaceAll('.', ',')}",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    if (oferta.desconto != null)
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          text: "Valor com desconto: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                          children: [
                            TextSpan(
                              text:
                                  "R\$${oferta.desconto.replaceAll('.', ',')}",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    if (oferta.validade != null)
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          text: "Válido até: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                          children: [
                            TextSpan(
                              text:
                                  "${oferta.validade.toDate().day}/${oferta.validade.toDate().month}/${oferta.validade.toDate().year}",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    if (oferta.infos != null)
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          text: "Informações adicionais: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                          children: [
                            TextSpan(
                              text: oferta.infos,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
