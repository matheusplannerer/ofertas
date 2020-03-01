import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/shared/models/endereco_model.dart';

class ViaCepService extends Disposable {
  Future<EnderecoModel> fetchCep({String cep}) async {
    Dio http = Dio();
    final response = await http.get('https://viacep.com.br/ws/$cep/json/');
    if (response.statusCode == 200) {
      print(response.data);
      return EnderecoModel.fromMap(response.data);
    } else {
      throw Exception('Requisição inválida!');
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
