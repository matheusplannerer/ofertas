import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ofertas/teste.dart';
import 'dart:convert';

class ImageCapture extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IamgeCaptureState();
  }
}

class _IamgeCaptureState extends State<ImageCapture> {
  File _imageFile;
  String base64;

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
                    .push(MaterialPageRoute(builder: (context) => Teste()));
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
            if(_imageFile != null) Uploader(file: _imageFile),
            if(base64 != null) Uploader(base64: base64),
          ],
        ],
      ),
    );
  }
}

class Uploader extends StatefulWidget {
  final File file;
  final String base64;

  Uploader({this.file, this.base64});

  createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://ofertas-dd295.appspot.com');
  StorageUploadTask _uploadTask;

  void _startUpload() {
    String filePath = "cartaz2.jpg";

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

          double progressPercent =
              event != null ? event.bytesTransferred / event.totalByteCount : 0;
          return Column(
            children: [
              if (_uploadTask.isComplete) Text('BOA PORRA'),
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
