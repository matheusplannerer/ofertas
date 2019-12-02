import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ofertas/models/produtos.dart';
import 'package:ofertas/teste.dart';
import 'dart:convert';

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
  Dados produto = Dados();

  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

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
    produto.produto = nome.text.toUpperCase();
    produto.preco = preco.text;
    produto.desconto = desconto.text;
  }

  // Future<void> _cropImage() async {
  //   File cropped = await ImageCropper.cropImage(
  //     sourcePath: _imageFile.path,
  //     toolbarColor: Colors.purple,
  //     toolbarWidgetColor: Colors.white,
  //     toolbarTitle: 'Crop It',
  //   );
  //   setState(() {
  //     _imageFile = cropped ?? _imageFile;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () => _pickImage(ImageSource.camera),
            ),
            IconButton(
              icon: Icon(Icons.photo_library),
              onPressed: () => _pickImage(ImageSource.gallery),
            ),
            IconButton(
              icon: Icon(Icons.photo_album),
              onPressed: () async {
                base64 = await Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Cartaz()));
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          if (_imageFile != null || base64 != null) ...[
            if (_imageFile != null) Image.file(_imageFile),
            if (base64 != null) Image.memory(base64Decode(base64)),
            Row(
              children: <Widget>[
                FlatButton(
                  child: Icon(Icons.refresh),
                  onPressed: _clear,
                )
              ],
            ),
            if (_imageFile != null)
              Uploader(
                file: _imageFile,
                empresaID: widget.empresaID,
                produto: produto,
              ),
            if (base64 != null)
              Uploader(
                base64: base64,
                empresaID: widget.empresaID,
                produto: produto,
              ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Nome do Produto",
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide()),
              ),
              onChanged: (nome) {
                _updateDados();
                // setState(() {
                //  field1.text = nome;
                // });
              },
              controller: nome,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Preço",
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide()),
              ),
              onChanged: (nome) {
                _updateDados();

                // setState(() {
                //  field2.text = nome;
                // });
              },
              controller: preco,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Desconto",
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide()),
              ),
              onChanged: (nome) {
                _updateDados();
                // setState(() {
                //  field3.text = nome;
                // });
              },
              controller: desconto,
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
  final Dados produto;

  Uploader({this.file, this.base64, this.empresaID, this.produto});

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

  void updateFirestore() async {
    var url = await _storage
        .ref()
        .child("${widget.empresaID}/oferta_${ofertas + 1}.jpg")
        .getDownloadURL();
    var id = Firestore.instance
        .collection('empresas')
        .document(widget.empresaID)
        .collection('ofertas')
        .document()
        .documentID;
    await Firestore.instance
        .collection('empresas')
        .document(widget.empresaID)
        .updateData({'ofertas': ofertas + 1});
    await Firestore.instance
        .collection('empresas')
        .document(widget.empresaID)
        .collection('ofertas')
        .document(id)
        .setData({
      "data": Timestamp.now(),
      "imagem": url,
      "nomeProduto": widget.produto.produto,
      "preco": widget.produto.preco,
      "desconto": widget.produto.desconto
    });
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
              updateFirestore();
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
      return FlatButton.icon(
        label: Text('Upload to Firebase'),
        icon: Icon(Icons.cloud_upload),
        onPressed: _startUpload,
      );
    }
  }
}
