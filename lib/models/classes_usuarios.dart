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
      this.nomeUnidade = '',
      this.atendEmail = '',
      this.numero = '',
      this.pais = '',
      this.quantidadeUnides,
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

  int quantidadeUnides; //
  int telefone; //
  String atendEmail;  //
  String nomeUnidade; //
  int cep;  //
  String logradouro;  //
  String senha; 
  String razaoSocial; //
  String numero;  //
  String complemento; //
  String bairro;  //
  String estado;  //
  String pais;  //
  int whatsapp; //
  String site;  //
  String email; //
  Map<String, dynamic> funcionamento;
  String horaInicio;  //
  String horaTermino; //
  String empresaID; //

  factory PerfilEmpresa.fromJson(Map<String, dynamic> json) {
    return new PerfilEmpresa(
      senha: json['senha'],
      razaoSocial: json['razaoSocial'],
      bairro: json['bairro'],
      cep: json['cep'],
      complemento: json['complemento'],
      email: json['email'],
      estado: json['estado'],
      funcionamento: {
        'domVal': json['domVal'],
        'segVal': json['segVal'],
        'terVal': json['terVal'],
        'quaVal': json['quaVal'],
        'quiVal': json['quiVal'],
        'sexVal': json['sexVal'],
        'sabVal': json['sabVal']
      },
      horaInicio: json['horaInicio'],
      horaTermino: json['horaTermino'],
      logradouro: json['logradouro'],
      nomeUnidade: json['nomeUnidade'],
      numero: json['numero'],
      pais: json['pais'],
      quantidadeUnides: json['quantidadeUnidades'],
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
