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
}
