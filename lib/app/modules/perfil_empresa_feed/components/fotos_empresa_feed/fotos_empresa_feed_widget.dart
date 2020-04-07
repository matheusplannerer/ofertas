import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/modules/perfil_empresa_feed/components/fotos_empresa_feed/fotos_empresa_feed_controller.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';
import 'package:ofertas/app/shared/repositories/routes/route_controller.dart';

class FotosEmpresaFeedWiget extends StatefulWidget {
  final OfertaModel oferta;
  const FotosEmpresaFeedWiget(this.oferta);

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   return null;
  // }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FotosEmpresaFeedWidgetState();
  }
}

class _FotosEmpresaFeedWidgetState extends State<FotosEmpresaFeedWiget> {
  final RouteController routeController = Modular.get();
  FotosEmpresaFeedController controller;
  OfertaModel oferta;
  @override
  void initState() {
    super.initState();
    oferta = widget.oferta;
    controller = FotosEmpresaFeedController(oferta);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        routeController.actualNavigator.currentState
            .pushNamed('/oferta_details', arguments: oferta);
      },
      child: controller.image,
    );
  }
}
