import 'package:http/http.dart' as http;
import 'package:ofertas/models/cep.dart';

class ViaCepService {
  static Future<Carteira> fetchCep({String cep}) async {
    final response = await http.get('https://viacep.com.br/ws/$cep/json/');
    if (response.statusCode == 200) {
      return Carteira.fromJson(response.body);
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}
