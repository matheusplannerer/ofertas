import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ofertas/models/perfil_empresa.dart';

class FirestoreServices {
  Future<bool> cadastrarEmpresa(
      PerfilEmpresa cadastro, FirebaseUser fbUser) async {
    try {
      await Firestore.instance
          .collection('empresas')
          .document(fbUser.uid)
          .setData({
        "nomeUnidade": cadastro.nomeUnidade,
        "horaInicio": cadastro.horaInicio,
        "horaTermino": cadastro.horaTermino,
        "logradouro": cadastro.logradouro,
        "numero": cadastro.numero,
        "pais": cadastro.pais,
        "quantidadeUnidades": cadastro.quantidadeUnides,
        "site": cadastro.site,
        "whatsapp": cadastro.whatsapp,
        "bairro": cadastro.bairro,
        "cep": cadastro.cep,
        "complemento": cadastro.complemento,
        "email": cadastro.email,
        "estado": cadastro.estado,
      });
      await Firestore.instance
          .collection('empresas')
          .document(fbUser.uid)
          .updateData(cadastro.funcionamento);

      return true;
    } catch (e) {
      return false;
    }
  }
}
