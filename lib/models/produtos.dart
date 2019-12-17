import 'package:cloud_firestore/cloud_firestore.dart';

class Dados {
  String produto;
  String infos;
  // bool isFavorite;
  String desconto, preco;
  String imagem;
  Timestamp validade;

  Dados(
      {
      // this.isFavorite = false,
      this.produto = '',
      this.infos = '',
      this.preco,
      this.desconto,
      this.imagem,
      this.validade});

  factory Dados.fromJson(Map<String, dynamic> json) {
    return Dados(
        desconto: json['desconto'],
        infos: json['infos'],
        preco: json['preco'],
        produto: json['nomeProduto'],
        imagem: json['imagem'],
        validade: json['validade']);
  }
}
