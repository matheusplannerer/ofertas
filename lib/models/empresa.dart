class Empresa {
  String idEmpresa;
  String nomeEmpresa;

  Empresa({this.idEmpresa, this.nomeEmpresa});

  factory Empresa.fromJSON(Map<String, dynamic> json) {
    return Empresa(
      nomeEmpresa: json['nomeEmpresa'],
      idEmpresa: json['id'],
    );
  }
}
