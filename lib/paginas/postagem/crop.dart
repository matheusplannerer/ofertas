import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ofertas/controller/services.dart';
import 'package:ofertas/models/produtos.dart';
import 'package:ofertas/paginas/postagem/cartaz.dart';
import 'package:ofertas/paginas/postagem/concluir_oferta.dart';
import 'dart:convert';

import 'package:ofertas/paginas/postagem/informacoes_oferta.dart';

class ImageCapture extends StatefulWidget {
  final String empresaID;
  ImageCapture(this.empresaID);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ImageCaptureState();
  }
}

class _ImageCaptureState extends State<ImageCapture> {
  File _imageFile;
  String base64;
  OfertaModel produto = OfertaModel();

  Future<void> _pickImage(ImageSource source) async {
    File selected =
        await ImagePicker.pickImage(source: source, imageQuality: 30);

    setState(() {
      _imageFile = selected;
    });
  }

  void _clear() {
    setState(() {
      _imageFile = null;
      base64 = null;
    });
  }

  TextEditingController nome = TextEditingController();
  TextEditingController preco = TextEditingController();
  TextEditingController desconto = TextEditingController();

  void _updateDados() {
    produto.nomeProduto = nome.text.toUpperCase();
    produto.preco = preco.text;
    produto.desconto = desconto.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: Colors.grey),
        currentIndex: 1,
        onTap: (index) async {
          setState(() {
            _imageFile = null;
            base64 = null;
          });
          if (index == 0) {
            _pickImage(ImageSource.gallery);
          } else if (index == 1) {
            _pickImage(ImageSource.camera);
          } else if (index == 2) {
            var result = await Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Cartaz()));
            if (result != null) {
              base64 = result[0];
              produto = result[1];
            }
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album),
            title: Text(
              "GALERIA",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera),
            title: Text(
              "CÂMERA",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_filter),
            title: Text(
              "CARTAZ",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          if (_imageFile != null || base64 != null) ...[
            if (_imageFile != null) Image.file(_imageFile),
            if (base64 != null) Image.memory(base64Decode(base64)),
            if (_imageFile != null)
              Uploader(
                file: _imageFile,
                empresaID: widget.empresaID,
                produto: produto,
                clear: _clear,
              ),
            if (base64 != null)
              Uploader(
                base64: base64,
                empresaID: widget.empresaID,
                produto: produto,
                clear: _clear,
              ),
          ],
        ],
      ),
    );
  }
}

class Uploader extends StatefulWidget {
  final File file;
  final String base64;
  final String empresaID;
  final OfertaModel produto;
  final Function clear;

  Uploader({this.file, this.base64, this.empresaID, this.produto, this.clear});

  createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://ofertas-dd295.appspot.com');
  StorageUploadTask _uploadTask;

  int ofertas = 0;

  void _startUpload() async {
    var data = await Firestore.instance
        .collection('empresas')
        .document(widget.empresaID)
        .get();
    ofertas = data.data['ofertas'];
    if (ofertas == null) ofertas = 0;
    String filePath = "${widget.empresaID}/oferta_${ofertas + 1}.jpg";

    if (widget.file != null) {
      setState(() {
        _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
      });
    } else {
      setState(() {
        _uploadTask =
            _storage.ref().child(filePath).putData(base64Decode(widget.base64));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      return StreamBuilder<StorageTaskEvent>(
        stream: _uploadTask.events,
        builder: (context, snapshot) {
          var event = snapshot?.data?.snapshot;

          if (_uploadTask.isComplete) {
            Future.delayed(Duration(milliseconds: 150)).then((data) {
              Services()
                  .firestore
                  .cadastrarOferta(widget.produto, widget.empresaID);
            });
            // Navigator.of(context)
            //     .popUntil((Route<dynamic> route) => route.isFirst);
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
              onPressed: widget.clear),
          FlatButton.icon(
            label: Text('AVANÇAR'),
            icon: Icon(Icons.arrow_forward),
            onPressed: () async {
              if (widget.base64 == null) {
                await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => InformacoesOferta(
                        imageFile: widget.file, empresaID: widget.empresaID)));
              } else {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ConcluirOferta(
                      produto: widget.produto,
                      base64: widget.base64 != null ? widget.base64 : null,
                      empresaID: widget.empresaID,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      );
    }
  }
}
