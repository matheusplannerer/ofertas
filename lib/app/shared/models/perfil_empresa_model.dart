class PerfilEmpresaModel {
  PerfilEmpresaModel(
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

  factory PerfilEmpresaModel.fromJson(
      Map<String, dynamic> json, String idEmpresa) {
    return PerfilEmpresaModel(
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
      //field: json[''],
    );
  }

  Map<String, dynamic> toJson() => {
        'cep': cep,
        'email': email,
        'donoEmpresa': donoEmpresa,
        'funcionamento': funcionamento,
        'lat': lat,
        'lon': lon,
        'nomeEmpresa': nomeEmpresa,
        'numero': numero,
        'site': site,
        'categoria': categoria,
        'bairro': bairro,
        'complemento': complemento,
        'empresaID': empresaID,
        'estado': estado,
        'logradouro': logradouro,
        'telefone': telefone
      };

  factory PerfilEmpresaModel.fromObj(PerfilEmpresaModel model) {
    return new PerfilEmpresaModel(
        bairro: model.bairro,
        categoria: model.categoria,
        cep: model.cep,
        complemento: model.complemento,
        donoEmpresa: model.donoEmpresa,
        email: model.email,
        empresaID: model.empresaID,
        estado: model.estado,
        foto: model.foto,
        funcionamento: model.funcionamento,
        horaInicio: model.horaInicio,
        horaTermino: model.horaTermino,
        lat: model.lat,
        logradouro: model.logradouro,
        lon: model.lon,
        nomeEmpresa: model.nomeEmpresa,
        numero: model.numero,
        senha: model.senha,
        site: model.site,
        telefone: model.telefone);
  }
}
