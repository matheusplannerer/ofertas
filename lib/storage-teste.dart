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
  StorageReference ref =
      FirebaseStorage.instance.ref().child("scaled_IMG-20191023-WA0062.jpg");

  bool chegou = false;
  String url = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          if (chegou) Image.network(url),
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
