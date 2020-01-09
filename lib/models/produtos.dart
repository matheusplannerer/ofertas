import 'package:cloud_firestore/cloud_firestore.dart';

class OfertaModel {
  String nomeProduto;
  String infos;
  // bool isFavorite;
  String idOferta;
  String desconto, preco;
  String imagem;
  Timestamp validade;
  bool mostrar;
  String empresaDona;

  OfertaModel(
      {
      // this.isFavorite = false,
      this.nomeProduto = '',
      this.infos = '',
      this.preco,
      this.desconto,
      this.empresaDona,
      this.imagem,
      this.validade,
      this.mostrar,
      this.idOferta});

  factory OfertaModel.fromJson(Map<String, dynamic> json, String idOferta) {
    return OfertaModel(
      desconto: json['desconto'],
      infos: json['infos'],
      preco: json['preco'],
      nomeProduto: json['nomeProduto'],
      imagem: json['imagem'],
      validade: json['validade'],
      mostrar: json['mostrar'],
      empresaDona: json['empresaDona'],
      idOferta: idOferta,
    );
  }
}
