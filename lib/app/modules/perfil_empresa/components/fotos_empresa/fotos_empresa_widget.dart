import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';
import 'package:ofertas/app/shared/repositories/routes/route_controller.dart';

class FotosEmpresaWidget extends StatelessWidget {
  final OfertaModel oferta;
  final RouteController routeController = Modular.get();
  FotosEmpresaWidget(this.oferta);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        routeController.actualNavigator.currentState
            .pushNamed('/oferta_details', arguments: oferta);
      },
      child: CachedNetworkImage(
        alignment: Alignment.center,
        imageUrl:
            "https://www.receiteria.com.br/wp-content/uploads/receitas-de-comida-mexicana-1-1.jpg",
        // imageUrl: snapshot.data.documents[index].data['imagem'],
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
    );
  }
}
