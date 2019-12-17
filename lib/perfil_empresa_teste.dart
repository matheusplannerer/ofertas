import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:load/load.dart';
import 'package:ofertas/crop.dart';
import 'package:ofertas/teste.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class PerfilEmpresaTestePage extends StatefulWidget {
  PerfilEmpresaTestePage(this.empresaID);
  final String empresaID;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PerfilEmpresaTestePageState(empresaID);
  }
}

class _PerfilEmpresaTestePageState extends State<PerfilEmpresaTestePage> {
  double _rating = 4;
  String empresaID;

  // StorageReference ref = FirebaseStorage.instance.ref().child("cartaz2.jpg");

  String foto = '';

  bool puxouFotos = false;

  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://ofertas-dd295.appspot.com');
  StorageUploadTask _uploadTask;

  File _imageFile;
  String base64;

  _PerfilEmpresaTestePageState(this.empresaID) {
    // getFoto();
  }

  // Future<String> getFoto() async {
  //   foto = await ref.getDownloadURL();
  //   setState(() {
  //     puxouFotos = true;
  //   });
  // }

  ligarEmpresa(String numero) async {
    if (await canLaunch('tel:+55${numero}')) {
      launch('tel:+55${numero}');
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _pickImage(ImageSource source) async {
      File selected = await ImagePicker.pickImage(source: source);

      setState(() {
        _imageFile = selected;
      });

      _uploadTask =
          _storage.ref().child("${empresaID}/logo.jpg").putFile(_imageFile);

      showLoadingDialog();

      var data = await _uploadTask.onComplete;
      var url = await data.ref.getDownloadURL();
      Firestore.instance
          .collection('empresas')
          .document(empresaID)
          .updateData({'foto': url});

      hideLoadingDialog();
    }

    // TODO: implement build
    print(empresaID);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GradientAppBar(
        gradient:
            LinearGradient(colors: [Colors.orange[900], Colors.orange[300]]),
      ),
      // appBar: AppBar(
      //   actions: <Widget>[],
      // ),
      body: FutureBuilder<DocumentSnapshot>(
          future: Firestore.instance
              .collection('empresas')
              .document(empresaID)
              .get(),
          builder: (context, empresa) {
            if (empresa.hasData) {
              return ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 125,
                              child: Column(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () async {
                                      await showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: SingleChildScrollView(
                                                child: Column(
                                                  children: <Widget>[
                                                    ListTile(
                                                      title:
                                                          Text("ESCOLHER FOTO"),
                                                      onTap: () {
                                                        _pickImage(ImageSource
                                                            .gallery);
                                                      },
                                                    ),
                                                    ListTile(
                                                      title: Text("TIRAR FOTO"),
                                                      onTap: () {
                                                        _pickImage(
                                                            ImageSource.camera);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    child: CircleAvatar(
                                      radius: 50.0,
                                      backgroundImage:
                                          empresa.data.data['foto'] != null
                                              ? NetworkImage(
                                                  empresa.data.data['foto'])
                                              : AssetImage('assets/logo2.jpg'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  // Text("Clebinho", textScaleFactor: 1.25,)
                                  Text(
                                    empresa.data.data['nomeEmpresa'],
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  SmoothStarRating(
                                    allowHalfRating: false,
                                    onRatingChanged: (v) {
                                      setState(() {
                                        _rating = v;
                                      });
                                    },
                                    starCount: 5,
                                    rating: _rating,
                                    size: 27.0,
                                    color: Colors.orange,
                                    borderColor: Colors.orange,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "$_rating",
                                    textScaleFactor: 2,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 8,
                          ),
                          IconButton(
                            onPressed: () async {
                              await showDialog(
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                          "ENDEREÇO: ${empresa.data.data['complemento']}"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("CONFIRMAR"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  },
                                  context: context);
                            },
                            icon: Icon(Icons.pin_drop, size: 30),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 8,
                          ),
                          IconButton(
                            onPressed: () async {
                              await showDialog(
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                          "CONTATO: ${empresa.data.data['telefone'].toString()}"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("MENSAGEM"),
                                          onPressed: () async {
                                            await ligarEmpresa(empresa
                                                .data.data['telefone']
                                                .toString());
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        FlatButton(
                                          child: Text("LIGAR"),
                                          onPressed: () async {
                                            await ligarEmpresa(empresa
                                                .data.data['telefone']
                                                .toString());
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        FlatButton(
                                          child: Text("OK"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                  context: context);
                            },
                            icon: Icon(Icons.phone, size: 30),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 8,
                          ),
                          IconButton(
                            onPressed: () async {
                              await showDialog(
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("HORÁRIO DE FUNCIONAMENTO"),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          children: <Widget>[
                                            Text(empresa.data.data['segVal'] ==
                                                    true
                                                ? "Seg " +
                                                    empresa.data
                                                        .data['horaInicio'] +
                                                    " às " +
                                                    empresa.data
                                                        .data['horaTermino']
                                                : ''),
                                            Text(empresa.data.data['terVal'] ==
                                                    true
                                                ? "Ter " +
                                                    empresa.data
                                                        .data['horaInicio'] +
                                                    " às " +
                                                    empresa.data
                                                        .data['horaTermino']
                                                : ''),
                                            Text(empresa.data.data['quaVal'] ==
                                                    true
                                                ? "Qua " +
                                                    empresa.data
                                                        .data['horaInicio'] +
                                                    " às " +
                                                    empresa.data
                                                        .data['horaTermino']
                                                : ''),
                                            Text(empresa.data.data['quiVal'] ==
                                                    true
                                                ? "Qui " +
                                                    empresa.data
                                                        .data['horaInicio'] +
                                                    " às " +
                                                    empresa.data
                                                        .data['horaTermino']
                                                : ''),
                                            Text(empresa.data.data['sexVal'] ==
                                                    true
                                                ? "Sex " +
                                                    empresa.data
                                                        .data['horaInicio'] +
                                                    " às " +
                                                    empresa.data
                                                        .data['horaTermino']
                                                : ''),
                                            Text(empresa.data.data['sabVal'] ==
                                                    true
                                                ? "Sáb " +
                                                    empresa.data
                                                        .data['horaInicio'] +
                                                    " às " +
                                                    empresa.data
                                                        .data['horaTermino']
                                                : ''),
                                            Text(empresa.data.data['domVal'] ==
                                                    true
                                                ? "Dom " +
                                                    empresa.data
                                                        .data['horaInicio'] +
                                                    " às " +
                                                    empresa.data
                                                        .data['horaTermino']
                                                : ''),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("CONFIRMAR"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  },
                                  context: context);
                            },
                            icon: Icon(Icons.timer, size: 30),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 8,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      StreamBuilder<QuerySnapshot>(
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 2,
                              child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data.documents.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 5,
                                        mainAxisSpacing: 5),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      print('olá');
                                    },
                                    child: Image.network(
                                        snapshot.data.documents[index]
                                            .data['imagem'],
                                        scale: 0.9),
                                  );
                                },
                              ),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                        stream: Firestore.instance
                            .collection('empresas')
                            .document(empresaID)
                            .collection('ofertas')
                            .getDocuments()
                            .asStream(),
                      ),
                    ],
                  ),
                ],
              );
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          }

          // children: <Widget>[
          // ],
          ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ImageCapture(empresaID)));
        },
      ),
    );
  }
}
