import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ofertas/models/classes_usuarios.dart';

class FirestoreServices {
  Future<bool> cadastrarEmpresa(
      PerfilEmpresa cadastro, FirebaseUser fbUser) async {
    try {
      await Firestore.instance
          .collection('empresas')
          .document(fbUser.uid)
          .setData({
        "empresaID": cadastro.empresaID,
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
        "atendEmail": cadastro.atendEmail,
        "telefone": cadastro.telefone,
        "razaoSocial": cadastro.razaoSocial,
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

  Future<bool> cadastrarUsuario(User user) async {
    try {
      await Firestore.instance
          .collection('usuarios')
          .document(user.usuarioID)
          .setData({
        "celular": user.celular,
        "cpf": user.cpf,
        "email": user.email,
        "nome": user.nome,
        "id": user.usuarioID,
      });

      return true;
    } catch (e) {
      return false;
    }
  }
}
