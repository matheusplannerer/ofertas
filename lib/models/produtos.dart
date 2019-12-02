class Dados {
  String produto;
  String infos;
  // bool isFavorite;
  String desconto, preco;
  String imagem;

  Dados({
    // this.isFavorite = false,
    this.produto = '',
    this.infos = '',
    this.preco,
    this.desconto,
    this.imagem
  });

  factory Dados.fromJson(Map<String, dynamic> json) {
    return Dados(
      desconto: json['desconto'],
      infos: json['infos'],
      preco: json['preco'],
      produto: json['nomeProduto'],
      imagem: json['imagem']
    );
  }
}
