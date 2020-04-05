import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class OfertaModel {
  String nomeProduto;
  String infos;
  // bool isFavorite;
  File imgFileAux;
  String bs64ImgAux;
  String idOferta;
  String desconto, preco;
  String imagem;
  Timestamp validade;
  bool mostrar;
  String empresaDona;
  OfertaModel({
    this.nomeProduto = '',
    this.infos = '',
    this.preco,
    this.desconto,
    this.empresaDona,
    this.imagem,
    this.validade,
    this.mostrar = true,
    this.idOferta,
  });

  factory OfertaModel.fromJson(Map<String, dynamic> json) {
    return OfertaModel(
      desconto: json['desconto'],
      infos: json['infos'],
      preco: json['preco'],
      nomeProduto: json['nomeProduto'],
      imagem: json['imagem'],
      validade: json['validade'],
      mostrar: json['mostrar'],
      empresaDona: json['empresaDona'],
      idOferta: json['idOferta'],
    );
  }

  Map<String, dynamic> toJson() => {};
}
