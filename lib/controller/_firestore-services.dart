import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ofertas/models/classes_usuarios.dart';
import 'package:ofertas/models/empresa.dart';
import 'package:ofertas/models/produtos.dart';

class FirestoreServices {
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://ofertas-dd295.appspot.com');

  Future<User> getUsuario(FirebaseUser fbUser) async {
    try {
      var data = await Firestore.instance
          .collection('usuarios')
          .document(fbUser.uid)
          .get();
      User usuario = User.fromJson(data.data);
      return usuario;
    } catch (e) {
      return null;
    }
  }

  Future<bool> cadastrarEmpresa(
      PerfilEmpresa cadastro, FirebaseUser fbUser) async {
    try {
      var geo = await Geolocator().placemarkFromAddress(
          "${cadastro.logradouro} ${cadastro.numero}",
          localeIdentifier: 'en');
      print(geo[0].position.latitude);
      print(geo[0].position.longitude);

      await Firestore.instance
          .collection('empresas')
          .document(cadastro.empresaID)
          .setData({
        "foto": null,
        "latitude": geo[0].position.latitude,
        "longitude": geo[0].position.longitude,
        "donoEmpresa": cadastro.donoEmpresa, //
        "categoria": cadastro.categoria.toUpperCase(), //
        "empresaID": cadastro.empresaID, //
        "nomeEmpresa": cadastro.nomeEmpresa, //
        "horaInicio": cadastro.horaInicio, //
        "horaTermino": cadastro.horaTermino, //
        "logradouro": cadastro.logradouro, //
        "numero": cadastro.numero, //
        "site": cadastro.site, //
        "bairro": cadastro.bairro, //
        "cep": cadastro.cep, //
        "complemento": cadastro.complemento, //
        "email": cadastro.email, //
        "estado": cadastro.estado, //
        "telefone": cadastro.telefone, //
      }).timeout(Duration(seconds: 15));
      await Firestore.instance
          .collection('empresas')
          .document(cadastro.empresaID)
          .updateData(cadastro.funcionamento)
          .timeout(Duration(seconds: 15)); //

      await Firestore.instance
          .collection('usuarios')
          .document(fbUser.uid)
          .collection('empresas')
          .document(cadastro.empresaID)
          .setData({
        "nomeEmpresa": cadastro.nomeEmpresa,
        "empresaID": cadastro.empresaID,
      }).timeout(Duration(seconds: 15));

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

  Future<PerfilEmpresa> getEmpresaLogada(User usuario) async {
    try {
      var doc = await Firestore.instance
          .collection('empresas')
          .document(usuario.empresaPerfil)
          .get();
      PerfilEmpresa empresa = PerfilEmpresa.fromJson(doc.data, doc.documentID);
      return empresa;
    } catch (e) {
      return null;
    }
  }

  Future<bool> deleteImage(
      FirebaseUser fbUser, PerfilEmpresa empresaLogada, String idOferta) async {
    try {
      await Firestore.instance
          .collection('empresas')
          .document(empresaLogada.empresaID)
          .collection('ofertas')
          .document(idOferta)
          .updateData({'mostrar': false});
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> cadastrarOferta(OfertaModel produto, String empresaID) async {
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
    var id = Firestore.instance.collection('ofertas').document().documentID;
    await Firestore.instance
        .collection('empresas')
        .document(empresaID)
        .updateData({'ofertas': ofertas + 1});
    await Firestore.instance.collection('ofertas').document(id).setData({
      "data": Timestamp.now(),
      "imagem": url,
      "nomeProduto": produto.nomeProduto,
      "preco": produto.preco,
      "empresaDona": empresaID,
      "idOferta": id,
      "desconto": produto.desconto,
      "validade": produto.validade,
      "mostrar": true,
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
