import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageTeste extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StorageTeste();
  }
}

class _StorageTeste extends State<StorageTeste> {
  StorageReference ref = FirebaseStorage.instance.ref().child("cartaz2.jpg");

  bool chegou = false;
  String url = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          if (chegou)
            CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.fill,
              errorWidget: (context, string, obj) {
                return Center(
                  child: Text("ERRO NO CARREGAMENTO"),
                );
              },
              placeholder: (context, url) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          Center(
            child: RaisedButton(
              onPressed: () async {
                url = await ref.getDownloadURL();
                setState(() {
                  chegou = true;
                });
              },
              child: Text("TESTE"),
            ),
          ),
        ],
      ),
    );
  }
}
