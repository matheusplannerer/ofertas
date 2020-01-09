import 'dart:convert';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ofertas/controller/services.dart';
import 'package:ofertas/models/produtos.dart';

class ConcluirOferta extends StatefulWidget {
  ConcluirOferta({this.produto, this.base64, this.imageFile, this.empresaID});
  final OfertaModel produto;
  final File imageFile;
  final String base64;
  final String empresaID;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ConcluirOfertaState();
  }
}

class _ConcluirOfertaState extends State<ConcluirOferta> {
  Services services = Services();
  StorageUploadTask _uploadTask;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          if (widget.base64 != null) Image.memory(base64Decode(widget.base64)),
          if (widget.imageFile != null) Image.file(widget.imageFile),
          SizedBox(height: 10),
          if (_uploadTask != null)
            StreamBuilder<StorageTaskEvent>(
              stream: _uploadTask.events,
              builder: (context, snapshot) {
                var event = snapshot?.data?.snapshot;

                if (_uploadTask.isComplete) {
                  Future.delayed(Duration(milliseconds: 150))
                      .then((data) async {
                    await Services()
                        .firestore
                        .cadastrarOferta(widget.produto, widget.empresaID);
                    Navigator.of(context)
                        .popUntil((Route<dynamic> route) => route.isFirst);
                  });
                  // Navigator.of(context)
                  //     .popUntil((Route<dynamic> route) => route.isFirst);
                }

                double progressPercent = event != null
                    ? event.bytesTransferred / event.totalByteCount
                    : 0;
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
            ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.all(10),
            child: ListBody(
              children: <Widget>[
                Text("Produto: ${widget.produto.nomeProduto}"),
                Text("Valor: R\$${widget.produto.preco}"),
                Text("Valor com desconto: ${widget.produto.desconto}"),
                Text(
                    "Validade: ${DateFormat("dd/MM/yy").format(widget.produto.validade.toDate())}"),
                Text("Informações adicionais: ${widget.produto.infos}"),
              ],
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: RaisedButton(
              onPressed: () async {
                var data = await services.firestore.startUpload(
                  widget.empresaID,
                  base64: widget.base64 != null ? widget.base64 : null,
                  file: widget.imageFile != null ? widget.imageFile : null,
                );
                setState(() {
                  _uploadTask = data;
                });
              },
              child: Text("PUBLICAR"),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
