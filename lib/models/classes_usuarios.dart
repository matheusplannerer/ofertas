class PerfilEmpresa {
  PerfilEmpresa(
      {this.bairro = '',
      this.cep,
      this.complemento = '',
      this.email = '',
      this.estado = '',
      this.funcionamento,
      this.horaInicio = '',
      this.horaTermino = '',
      this.logradouro = '',
      this.foto,
      this.nomeEmpresa = '',
      this.numero = '',
      this.pais = '',
      this.telefone,
      this.site = '',
      this.razaoSocial = '',
      this.senha = '',
      this.empresaID,
      this.whatsapp}) {
    funcionamento = {
      "domVal": false,
      "segVal": false,
      "terVal": false,
      "quaVal": false,
      "quiVal": false,
      "sexVal": false,
      "sabVal": false,
    };
  }

  String foto;
  int telefone; //
  String nomeEmpresa; //
  int cep; 
  String logradouro; 
  String numero; 
  String complemento; 
  String bairro; 
  String senha; //
  String estado; 
  String pais; 
  String site; //
  String email; //
  Map<String, dynamic> funcionamento;
  String horaInicio; //
  String horaTermino; //
  String empresaID; //
  String razaoSocial; //
  String whatsapp;

  factory PerfilEmpresa.fromJson(Map<String, dynamic> json) {
    return new PerfilEmpresa(
      cep: json['cep'],
      email: json['email'],
      funcionamento: {
        'domVal': json['domVal'],
        'segVal': json['segVal'],
        'terVal': json['terVal'],
        'quaVal': json['quaVal'],
        'quiVal': json['quiVal'],
        'sexVal': json['sexVal'],
        'sabVal': json['sabVal']
      },
      foto: json['foto'],
      horaInicio: json['horaInicio'],
      horaTermino: json['horaTermino'],
      nomeEmpresa: json['nomeEmpresa'],
      numero: json['numero'],
      pais: json['pais'],
      site: json['site'],
      whatsapp: json['whatsapp'],
    );
  }
}

class User {
  String nome;
  String cpf;
  String celular;
  String email;
  String senha;
  String usuarioID;

  User({
    this.email = '',
    this.senha = '',
    this.celular = '',
    this.cpf = '',
    this.nome = '',
    this.usuarioID = '',
  });
}
