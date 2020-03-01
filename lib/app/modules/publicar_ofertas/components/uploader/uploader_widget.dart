import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';

class UploaderWidget extends StatelessWidget {
  final File file;
  final String base64;
  final String empresaID;
  final OfertaModel produto;
  final Function clear;

  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://ofertas-dd295.appspot.com');
  StorageUploadTask _uploadTask;

  int ofertas = 0;

  UploaderWidget(
      {this.file, this.base64, this.empresaID, this.produto, this.clear});

  // void _startUpload() async {
  //   var data = await Firestore.instance
  //       .collection('empresas')
  //       .document(widget.empresaID)
  //       .get();
  //   ofertas = data.data['ofertas'];
  //   if (ofertas == null) ofertas = 0;
  //   String filePath = "${widget.empresaID}/oferta_${ofertas + 1}.jpg";

  //   if (widget.file != null) {
  //     setState(() {
  //       _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
  //     });
  //   } else {
  //     setState(() {
  //       _uploadTask =
  //           _storage.ref().child(filePath).putData(base64Decode(widget.base64));
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      return StreamBuilder<StorageTaskEvent>(
        stream: _uploadTask.events,
        builder: (context, snapshot) {
          var event = snapshot?.data?.snapshot;

          if (_uploadTask.isComplete) {
            Future.delayed(Duration(milliseconds: 150)).then((data) {
              // Services().firestore.cadastrarOferta(produto, empresaID);
            });
          }

          double progressPercent =
              event != null ? event.bytesTransferred / event.totalByteCount : 0;
          return Column(
            children: [
              if (_uploadTask.isComplete) Text('CARREGADO'),
              if (_uploadTask.isPaused)
                FlatButton(
                  child: Icon(Icons.play_arrow),
                  onPressed: _uploadTask.resume,
                ),
              if (_uploadTask.isInProgress)
                FlatButton(
                  child: Icon(Icons.pause),
                  onPressed: _uploadTask.pause,
                ),
              LinearProgressIndicator(value: progressPercent),
              Text('${(progressPercent * 100).toStringAsFixed(2)} %')
            ],
          );
        },
      );
    } else {
      return Column(
        children: [
          FlatButton.icon(
              label: Text('LIMPAR'),
              icon: Icon(Icons.refresh),
              onPressed: clear),
          FlatButton.icon(
            label: Text('AVANÇAR'),
            icon: Icon(Icons.arrow_forward),
            onPressed: () async {
              if (base64 == null) {
                // await Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => InformacoesOferta(
                //         imageFile: file, empresaID: empresaID)));
              } else {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => ConcluirOferta(
                //       produto: produto,
                //       base64: base64 != null ? base64 : null,
                //       empresaID: empresaID,
                //     ),
                //   ),
                // );
              }
            },
          ),
        ],
      );
    }
  }
}
