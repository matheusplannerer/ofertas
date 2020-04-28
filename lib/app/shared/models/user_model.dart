class UserModel {
  String nome;
  String email;
  String senha;
  String celular;
  String empresaPerfil;
  String id;
  String planoId;

  UserModel({
    this.email,
    this.nome,
    this.celular,
    this.empresaPerfil,
    this.id,
    this.planoId,
  });

  UserModel copyWith({
    String nome,
    String celular,
    String empresaPerfil,
    String id,
    String email,
    String planoId,
  }) {
    return UserModel(
      celular: celular ?? this.celular,
      nome: nome ?? this.nome,
      empresaPerfil: empresaPerfil ?? this.empresaPerfil,
      email: email ?? this.email,
      id: id ?? this.id,
      planoId: planoId ?? this.planoId,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      celular: json['celular'],
      email: json['email'],
      id: json['id'],
      nome: json['nome'],
      empresaPerfil: json['empresaPerfil'],
      planoId: json['planoId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'celular': celular,
        'email': email,
        'id': id,
        'nome': nome,
        'empresaPerfil': empresaPerfil,
        'planoId': planoId,
      };
}
