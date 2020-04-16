class PerfilEmpresaModel {
  PerfilEmpresaModel(
      {this.bairro = '', //
      this.cep = '', //
      this.complemento = '', //
      this.email = '', //
      this.estado = '', //
      this.dias, //
      this.logradouro = '', //
      this.foto, //
      this.nomeEmpresa = '', //
      this.numero = '', //
      this.telefone = '', //
      this.site = '', //
      this.senha = '', //
      this.horarios,
      this.empresaID = '', //
      this.donoEmpresa, //
      this.categoria, //
      this.lat,
      this.subcategoria,
      this.ofertas,
      this.lon}) {
    if (dias == null)
      dias = {
        "dom": false,
        "seg": false,
        "ter": false,
        "qua": false,
        "qui": false,
        "sex": false,
        "sab": false,
      };
    if (horarios == null)
      horarios = {
        'segInicio': null,
        'segFim': null,
        'terInicio': null,
        'terFim': null,
        'quaInicio': null,
        'quaFim': null,
        'quiInicio': null,
        'quiFim': null,
        'sexInicio': null,
        'sexFim': null,
        'sabInicio': null,
        'sabFim': null,
        'domInicio': null,
        'domFim': null,
      };
  }

  String foto; //
  String telefone; //
  String nomeEmpresa; //
  String cep; //
  String logradouro; //
  String numero; //
  String complemento; //
  String bairro; //
  String senha;
  String estado; //
  String categoria; //
  String subcategoria;
  String site; //
  double lat; //
  double lon; //
  String email; //
  Map<dynamic, dynamic> dias; //
  Map<dynamic, dynamic> horarios; //
  String empresaID; //
  String donoEmpresa; //
  int ofertas; //

  factory PerfilEmpresaModel.fromJson(Map<String, dynamic> json) {
    PerfilEmpresaModel model = PerfilEmpresaModel(
      cep: json['cep'],
      email: json['email'],
      donoEmpresa: json['donoEmpresa'],
      dias: json['dias'],
      horarios: json['horarios'],
      foto: json['foto'],
      lat: json['latitude'],
      lon: json['longitude'],
      nomeEmpresa: json['nomeEmpresa'],
      numero: json['numero'],
      subcategoria: json['subcategoria'],
      site: json['site'],
      categoria: json['categoria'],
      bairro: json['bairro'],
      complemento: json['complemento'],
      empresaID: json['empresaID'],
      estado: json['estado'],
      logradouro: json['logradouro'],
      telefone: json['telefone'],
      ofertas: json['ofertas'],
    );
    // print(horarios);
    return model;
    // return
  }

  Map<String, dynamic> toJson() => {
        'cep': cep,
        'email': email,
        'donoEmpresa': donoEmpresa,
        'dias': dias,
        'latitude': lat,
        'longitude': lon,
        'nomeEmpresa': nomeEmpresa,
        'numero': numero,
        'site': site,
        'subcategoria': subcategoria,
        'categoria': categoria,
        'horarios': horarios,
        'bairro': bairro,
        'complemento': complemento,
        'empresaID': empresaID,
        'estado': estado,
        'logradouro': logradouro,
        'telefone': telefone,
        'ofertas': ofertas,
      };

  PerfilEmpresaModel copyWith({
    String bairro,
    String categoria,
    String cep,
    String complemento,
    String donoEmpresa,
    String email,
    String estado,
    String foto,
    Map<dynamic, dynamic> horarios,
    Map<dynamic, dynamic> dias,
    double lat,
    double lon,
    String logradouro,
    String nomeEmpresa,
    String numero,
    String site,
    String subcategoria,
    String telefone,
    int ofertas,
  }) {
    return new PerfilEmpresaModel(
      bairro: bairro ?? this.bairro,
      categoria: categoria ?? this.categoria,
      cep: cep ?? this.cep,
      complemento: complemento ?? this.complemento,
      donoEmpresa: donoEmpresa ?? this.donoEmpresa,
      email: email ?? this.email,
      empresaID: this.empresaID,
      subcategoria: subcategoria ?? this.subcategoria,
      estado: estado ?? this.estado,
      foto: foto ?? this.foto,
      horarios: horarios ?? this.horarios,
      dias: dias ?? this.dias,
      lat: lat ?? this.lat,
      logradouro: logradouro ?? this.logradouro,
      lon: lon ?? this.lon,
      nomeEmpresa: nomeEmpresa ?? this.nomeEmpresa,
      numero: numero ?? this.numero,
      senha: senha,
      site: site ?? this.site,
      telefone: telefone ?? this.telefone,
      ofertas: ofertas ?? this.ofertas,
    );
  }
}
