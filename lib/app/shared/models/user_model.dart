class UserModel {
  String nome;
  String email;
  String senha;
  String celular;
  String empresaPerfil;
  String usuarioID;

  UserModel({
    this.email,
    this.nome,
    this.celular,
    this.empresaPerfil,
    this.usuarioID,
  });

  UserModel copyWith({String nome, String celular, String empresaPerfil}) {
    return UserModel(
      celular: celular ?? this.celular,
      nome: nome ?? this.nome,
      empresaPerfil: empresaPerfil ?? this.empresaPerfil,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      celular: json['celular'],
      email: json['email'],
      usuarioID: json['id'],
      nome: json['nome'],
      empresaPerfil: json['empresaPerfil'],
    );
  }

  Map<String, dynamic> toJson() => {
        'celular': celular,
        'email': email,
        'usuarioID': usuarioID,
        'nome': nome,
        'empresaPerfil': empresaPerfil
      };
}
