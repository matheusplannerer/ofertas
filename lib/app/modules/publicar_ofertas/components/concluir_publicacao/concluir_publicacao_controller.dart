import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';

part 'concluir_publicacao_controller.g.dart';

class ConcluirPublicacaoController = _ConcluirPublicacaoBase
    with _$ConcluirPublicacaoController;

abstract class _ConcluirPublicacaoBase with Store {
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://ofertas-8428f.appspot.com');

  final String empresaID;
  _ConcluirPublicacaoBase({this.empresaID});

  @observable
  StorageUploadTask task;

  @action
  Future<StorageUploadTask> startUpload({File file, String base64}) async {
    int ofertas = 0;
    try {
      var data = await Firestore.instance
          .collection('empresas')
          .document(empresaID)
          .get();
      ofertas = data.data['ofertas'];
      if (ofertas == null) ofertas = 0;
      String filePath = "$empresaID/oferta_${ofertas + 1}.jpg";

      print("FOI");
      if (file != null) {
        return _storage.ref().child(filePath).putFile(file);
      } else {
        return _storage.ref().child(filePath).putData(base64Decode(base64));
      }
    } catch (e) {
      return null;
    }
  }

  @action
  Future uploadOferta(OfertaModel oferta) async {
    int ofertas = 0;
    ofertas = await _getQtdOfertas(empresaID);

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
      "nomeProduto": oferta.nomeProduto,
      "preco": oferta.preco,
      "empresaDona": empresaID,
      "idOferta": id,
      "desconto": oferta.desconto,
      "validade": oferta.validade,
      "mostrar": true,
      "infos": oferta.infos
    });
  }

  @action
  Future<int> _getQtdOfertas(String empresaID) async {
    try {
      var data = await Firestore.instance
          .collection('empresas')
          .document(empresaID)
          .get();
      if (data?.data['ofertas'] == null) return 0;

      return data.data['ofertas'];
    } catch (e) {
      return null;
    }
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
