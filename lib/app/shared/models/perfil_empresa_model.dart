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
  String site; //
  double lat; //
  double lon; //
  String email; //
  Map<dynamic, dynamic> dias; //
  Map<dynamic, dynamic> horarios; //
  String empresaID; //
  String donoEmpresa;

  factory PerfilEmpresaModel.fromJson(
      Map<String, dynamic> json, String idEmpresa) {
    var aux = PerfilEmpresaModel();
    // print(json['horarios']);
    PerfilEmpresaModel model = PerfilEmpresaModel(
      cep: json['cep'] ??= '',
      email: json['email'] ??= '',
      donoEmpresa: json['donoEmpresa'] ??= '',
      dias: json['dias'] ??= aux.dias,
      horarios: json['horarios'] ??= aux.horarios,
      foto: json['foto'],
      lat: json['latitude'] ??= 0.0,
      lon: json['longitude'] ??= 0.0,
      nomeEmpresa: json['nomeEmpresa'] ??= '',
      numero: json['numero'] ??= '',
      site: json['site'] ??= null,
      categoria: json['categoria'] ??= '',
      bairro: json['bairro'] ??= '',
      complemento: json['complemento'] ??= '',
      empresaID: idEmpresa,
      estado: json['estado'] ??= '',
      logradouro: json['logradouro'] ??= '',
      telefone: json['telefone'] ??= '',
    );
    // print(model.horarios);
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
        'categoria': categoria,
        'dias': dias,
        'horarios': horarios,
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
        horarios: model.horarios,
        dias: model.dias,
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
