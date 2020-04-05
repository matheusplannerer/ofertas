import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';
import 'package:ofertas/app/shared/repositories/routes/route_controller.dart';

class FotosEmpresaFeedWiget extends StatefulWidget {
  final OfertaModel oferta;
  FotosEmpresaFeedWiget(this.oferta) : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FotosEmpresaFeedWidgetState();
  }
}

class _FotosEmpresaFeedWidgetState extends State<FotosEmpresaFeedWiget>
    with AutomaticKeepAliveClientMixin {
  final RouteController routeController = Modular.get();
  OfertaModel oferta;
  @override
  void initState() {
    super.initState();
    oferta = widget.oferta;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: () {
        routeController.actualNavigator.currentState
            .pushNamed('/oferta_details', arguments: oferta);
      },
      child: CachedNetworkImage(
        alignment: Alignment.center,
        imageUrl: oferta?.imagem ?? "",
        fit: BoxFit.contain,
        errorWidget: (context, string, obj) {
          return Center(
            child: CircularProgressIndicator(),
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

  @override
  bool get wantKeepAlive => true;
}
