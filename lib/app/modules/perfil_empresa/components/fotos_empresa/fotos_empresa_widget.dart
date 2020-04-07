import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_controller.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';
import 'package:ofertas/app/shared/repositories/routes/route_controller.dart';

class FotosEmpresaWidget extends StatelessWidget {
  final OfertaModel oferta;
  final PerfilEmpresaController controller;
  final RouteController routeController = Modular.get();
  FotosEmpresaWidget(this.oferta, {@required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        routeController.actualNavigator.currentState.pushNamed(
          '/oferta_details',
          arguments: {'oferta': oferta, 'fetchPage': controller.fetchPage},
        );
      },
      child: CachedNetworkImage(
        alignment: Alignment.center,
        // imageUrl:
        //     "https://www.receiteria.com.br/wp-content/uploads/receitas-de-comida-mexicana-1-1.jpg",
        imageUrl: oferta?.imagem,
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
