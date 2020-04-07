import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ofertas/app/shared/models/endereco_model.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:ofertas/app/shared/repositories/sign_up_company/repositories/signup_company_repository_interface.dart';

class SignUpCompanyRepository implements ISignUpCompanyRepository {
  Dio http = Dio();
  SignUpCompanyRepository();

  @override
  Future<EnderecoModel> fetchCep(String cep) async {
    try {
      final response = await http.get('https://viacep.com.br/ws/$cep/json/');
      if (response.statusCode == 200) {
        print(response.data);
        return EnderecoModel.fromMap(response.data);
      } else {
        throw Exception('Requisição inválida!');
      }
    } catch (e) {
      return throw e;
    }
  }

  @override
  Future<bool> signUpCompany(PerfilEmpresaModel model) async {
    try {
      var geo = await Geolocator().placemarkFromAddress(
          "${model.logradouro} ${model.numero}",
          localeIdentifier: 'en');

      model.lat = geo[0].position.latitude;
      model.lon = geo[0].position.longitude;

      await Firestore.instance //Cadastra a empresa
          .collection('empresas')
          .document(model.empresaID)
          .setData(model.toJson())
          .timeout(Duration(seconds: 15));

      await Firestore.instance //Cadastra nova empresa para o usuario
          .collection('usuarios')
          .document(model.donoEmpresa)
          .collection('empresas')
          .document(model.empresaID)
          .setData({
        "nomeEmpresa": model.nomeEmpresa,
        "empresaID": model.empresaID,
      }).timeout(Duration(seconds: 15));

      await Firestore.instance //Atualiza a empresa do perfil default do usuario
          .collection('usuarios')
          .document(model.donoEmpresa)
          .updateData({'empresaPerfil': model.empresaID});

      return true;
    } catch (e) {
      PlatformException error = e;
      print(error.message);
      return throw e;
    }
  }
}
