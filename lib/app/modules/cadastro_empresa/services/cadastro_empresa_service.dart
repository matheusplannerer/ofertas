import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';

class CadastroEmpresaService extends Disposable {
  Future<bool> cadastrarEmpresa(
      PerfilEmpresaModel model, FirebaseUser fbUser) async {
    try {
      var geo = await Geolocator().placemarkFromAddress(
          "${model.logradouro} ${model.numero}",
          localeIdentifier: 'en');

      await Firestore.instance
          .collection('empresas')
          .document(model.empresaID)
          .setData({
        "foto": null,
        "latitude": geo[0].position.latitude,
        "longitude": geo[0].position.longitude,
        "donoEmpresa": model.donoEmpresa, //
        "categoria": model.categoria.toUpperCase(), //
        "empresaID": model.empresaID, //
        "nomeEmpresa": model.nomeEmpresa, //
        "logradouro": model.logradouro, //
        "numero": model.numero, //
        "site": model.site, //
        'dias': model.dias,
        'horarios': model.horarios,
        "bairro": model.bairro, //
        "cep": model.cep, //
        "complemento": model.complemento, //
        "email": model.email, //
        "estado": model.estado, //
        "telefone": model.telefone, //
      }).timeout(Duration(seconds: 15));

      await Firestore.instance
          .collection('usuarios')
          .document(fbUser.uid)
          .collection('empresas')
          .document(model.empresaID)
          .setData({
        "nomeEmpresa": model.nomeEmpresa,
        "empresaID": model.empresaID,
      }).timeout(Duration(seconds: 15));

      await Firestore.instance
          .collection('usuarios')
          .document(fbUser.uid)
          .updateData({'empresaPerfil': model.empresaID});

      return true;
    } catch (e) {
      PlatformException error = e;
      print(error.message);
      return false;
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
