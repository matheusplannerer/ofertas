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
      this.numero = '',
      this.pais = '',
      this.quantidadeUnides,
      this.site = '',
      this.whatsapp});

  int quantidadeUnides;
  String nomeUnidade;
  int cep;
  String logradouro;
  String numero;
  String complemento;
  String bairro;
  String estado;
  String pais;
  int whatsapp;
  String site;
  String email;
  Map<String, dynamic> funcionamento = {
    "domVal": false,
    "segVal": false,
    "terVal": false,
    "quaVal": false,
    "quiVal": false,
    "sexVal": false,
    "sabVal": false,
  };
  String horaInicio;
  String horaTermino;

  factory PerfilEmpresa.fromJson(Map<String, dynamic> json) {
    return new PerfilEmpresa(
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
