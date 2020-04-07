import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';

part 'fotos_empresa_feed_controller.g.dart';

class FotosEmpresaFeedController = _FotosEmpresaFeedControllerBase
    with _$FotosEmpresaFeedController;

abstract class _FotosEmpresaFeedControllerBase with Store {
  _FotosEmpresaFeedControllerBase(this.model) {
    print("RODA DE NOVO ESSE CONTROLLER");
    print(model.nomeProduto);
    setImage(model);
  }

  OfertaModel model;

  @observable
  CachedNetworkImage image;

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  void setImage(OfertaModel oferta) {
    image = CachedNetworkImage(
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
    );
  }
}
