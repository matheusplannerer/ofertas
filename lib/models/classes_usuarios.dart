class PerfilEmpresa {
  PerfilEmpresa(
      {this.bairro = '', //
      this.cep = '', //
      this.complemento = '', //
      this.email = '', //
      this.estado = '', //
      this.funcionamento, //
      this.horaInicio = '', //
      this.horaTermino = '', //
      this.logradouro = '', //
      this.foto, //
      this.nomeEmpresa = '', //
      this.numero = '', //
      this.telefone = '', //
      this.site = '', //
      this.senha = '', //
      this.empresaID = '', //
      this.donoEmpresa, //
      this.categoria, //
      this.lat,
      this.lon}) {
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
  String telefone; //
  String nomeEmpresa; //
  String cep;
  String logradouro;
  String numero;
  String complemento;
  String bairro;
  String senha; //
  String estado; //
  String categoria; //
  String site; //
  double lat;
  double lon;
  String email; //
  Map<String, dynamic> funcionamento;
  String horaInicio; //
  String horaTermino; //
  String empresaID; //
  String donoEmpresa;

  factory PerfilEmpresa.fromJson(Map<String, dynamic> json, String idEmpresa) {
    return new PerfilEmpresa(
      cep: json['cep'] ??= '',
      email: json['email'] ??= '',
      donoEmpresa: json['donoEmpresa'] ??= '',
      funcionamento: {
        'domVal': json['domVal'] ??= '',
        'segVal': json['segVal'] ??= '',
        'terVal': json['terVal'] ??= '',
        'quaVal': json['quaVal'] ??= '',
        'quiVal': json['quiVal'] ??= '',
        'sexVal': json['sexVal'] ??= '',
        'sabVal': json['sabVal'] ??= ''
      },
      foto: json['foto'],
      lat: json['latitude'] ??= 0.0,
      lon: json['longitude'] ??= 0.0,
      horaInicio: json['horaInicio'] ??= '',
      horaTermino: json['horaTermino'] ??= '',
      nomeEmpresa: json['nomeEmpresa'] ??= '',
      numero: json['numero'] ??= '',
      site: json['site'] ??= '',
      categoria: json['categoria'] ??= '',
      bairro: json['bairro'] ??= '',
      complemento: json['complemento'] ??= '',
      empresaID: idEmpresa,
      estado: json['estado'] ??= '',
      logradouro: json['logradouro'] ??= '',
      telefone: json['telefone'] ??= '',
    );
  }
}

class User {
  String nome;
  String cpf;
  String email;
  String senha;
  String celular;
  String empresaPerfil;
  String usuarioID;

  User({
    this.email,
    this.cpf,
    this.nome,
    this.celular,
    this.empresaPerfil,
    this.usuarioID,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return new User(
      celular: json['celular'],
      email: json['email'],
      usuarioID: json[''],
      nome: json['nome'],
      empresaPerfil: json['empresaPerfil'],
    );
  }
}
