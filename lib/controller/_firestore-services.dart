import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ofertas/models/classes_usuarios.dart';
import 'package:ofertas/models/produtos.dart';

class FirestoreServices {
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://ofertas-dd295.appspot.com');

  Future<bool> cadastrarEmpresa(
      PerfilEmpresa cadastro, FirebaseUser fbUser) async {
    try {
      await Firestore.instance
          .collection('empresas')
          .document(fbUser.uid)
          .setData({
        "empresaID": cadastro.empresaID,
        "nomeEmpresa": cadastro.nomeEmpresa,
        "horaInicio": cadastro.horaInicio,
        "horaTermino": cadastro.horaTermino,
        "logradouro": cadastro.logradouro,
        "numero": cadastro.numero,
        "pais": cadastro.pais,
        "site": cadastro.site,
        "bairro": cadastro.bairro,
        "cep": cadastro.cep,
        "complemento": cadastro.complemento,
        "email": cadastro.email,
        "estado": cadastro.estado,
        "telefone": cadastro.telefone,
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
        "email": user.email,
        "nome": user.nome,
        "id": user.usuarioID,
      });

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> updateFirestore(
    Dados produto,
    String empresaID,
  ) async {
    int ofertas = 0;
    var data = await Firestore.instance
        .collection('empresas')
        .document(empresaID)
        .get();
    ofertas = data.data['ofertas'];
    if (ofertas == null) ofertas = 0;
    var url = await _storage
        .ref()
        .child("$empresaID/oferta_${ofertas + 1}.jpg")
        .getDownloadURL();
    var id = Firestore.instance
        .collection('empresas')
        .document(empresaID)
        .collection('ofertas')
        .document()
        .documentID;
    await Firestore.instance
        .collection('empresas')
        .document(empresaID)
        .updateData({'ofertas': ofertas + 1});
    await Firestore.instance
        .collection('empresas')
        .document(empresaID)
        .collection('ofertas')
        .document(id)
        .setData({
      "data": Timestamp.now(),
      "imagem": url,
      "nomeProduto": produto.produto,
      "preco": produto.preco,
      "desconto": produto.desconto,
      "validade": produto.validade,
      "infos": produto.infos
    });
  }

  Future<StorageUploadTask> startUpload(String empresaID,
      {File file, String base64}) async {
    int ofertas = 0;
    var data = await Firestore.instance
        .collection('empresas')
        .document(empresaID)
        .get();
    ofertas = data.data['ofertas'];
    if (ofertas == null) ofertas = 0;
    String filePath = "$empresaID/oferta_${ofertas + 1}.jpg";

    if (file != null) {
      return _storage.ref().child(filePath).putFile(file);
    } else {
      return _storage.ref().child(filePath).putData(base64Decode(base64));
    }
  }
}
