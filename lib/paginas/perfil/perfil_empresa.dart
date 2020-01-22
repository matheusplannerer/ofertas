import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:load/load.dart';
import 'package:ofertas/global/global.dart';
import 'package:ofertas/models/classes_usuarios.dart';
import 'package:ofertas/models/produtos.dart';
import 'package:ofertas/paginas/feed/oferta_detalhes.dart';
import 'package:ofertas/paginas/feed/dashboard.dart';
import 'package:ofertas/paginas/postagem/crop.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ofertas/paginas/cadastros/cadastro_empresa.dart';

class PerfilEmpresaPage extends StatefulWidget {
  PerfilEmpresaPage(this.empresa);
  final PerfilEmpresa empresa;

  @override
  State<StatefulWidget> createState() {
    return _PerfilEmpresaPageState(empresa);
  }
}

class _PerfilEmpresaPageState extends State<PerfilEmpresaPage> {
  List<Widget> empresas = [];

  mainBottomSheet(BuildContext context) {
    var global = Provider.of<Global>(context);
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            child: ListView(
              children: <Widget>[
                FutureBuilder<QuerySnapshot>(
                  future: Firestore.instance
                      .collection("empresas")
                      .where("donoEmpresa",
                          isEqualTo: global.fbUser.uid)
                      .getDocuments(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (snapshot.data.documentChanges.length > 0) {
                        empresas = [];
                        for (var i = 0;
                            i < snapshot.data.documentChanges.length;
                            i++) {
                          empresas.add(
                            ListTile(
                              title: Text(snapshot.data.documentChanges[i]
                                  .document['nomeEmpresa']),
                              onTap: () async {
                                showLoadingDialog(tapDismiss: false);
                                var doc = await Firestore.instance
                                    .collection('empresas')
                                    .document(snapshot.data.documentChanges[i]
                                        .document.documentID)
                                    .get()
                                    .timeout(Duration(seconds: 15));
                                hideLoadingDialog();
                                if (doc != null) {
                                  PerfilEmpresa aux = PerfilEmpresa.fromJson(
                                      doc.data, doc.documentID);

                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          PerfilEmpresaPage(aux)));
                                }
                              },
                              leading: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: ClipOval(
                                  child: snapshot.data.documentChanges[i]
                                              .document['foto'] !=
                                          null
                                      ? Image.network(
                                          snapshot.data.documentChanges[i]
                                              .document['foto'],
                                          width: 200,
                                          fit: BoxFit.cover,
                                          loadingBuilder:
                                              (context, child, imgChunck) {
                                            if (imgChunck == null) {
                                              return child;
                                            } else {
                                              return CircularProgressIndicator();
                                            }
                                          },
                                        )
                                      : Image.asset(
                                          "assets/mogi.jpg",
                                          fit: BoxFit.cover,
                                          width: 200,
                                        ),
                                ),
                              ),
                            ),
                          );
                        }
                        empresas.add(
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CadastroEmpresa()));
                            },
                            child: Text("ADICIONAR EMPRESA"),
                          ),
                        );
                        return Column(
                          children: <Widget>[...empresas],
                        );
                      } else {
                        return Center(
                          child: Column(
                            children: [
                              Text("NENHUMA EMPRESA CADASTRADA"),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => CadastroEmpresa()));
                                },
                                child: Text("ADICIONAR EMPRESA"),
                              )
                            ],
                          ),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          );
        });
  }

  _PerfilEmpresaPageState(this.empresa);
  PerfilEmpresa empresa;

  // StorageReference ref = FirebaseStorage.instance.ref().child("cartaz2.jpg");

  String foto = '';

  bool puxouFotos = false;

  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://ofertas-dd295.appspot.com');
  StorageUploadTask _uploadTask;

  File _imageFile;
  String base64;

  // _PerfilEmpresaPageState(this.empresaID) {
  //   // getFoto();
  // }

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

      _uploadTask = _storage
          .ref()
          .child("${empresa.empresaID}/logo.jpg")
          .putFile(_imageFile);

      showLoadingDialog();

      var data = await _uploadTask.onComplete;
      var url = await data.ref.getDownloadURL();
      Firestore.instance
          .collection('empresas')
          .document(empresa.empresaID)
          .updateData({'foto': url});

      hideLoadingDialog();
    }

    var global = Provider.of<Global>(context);

    // TODO: implement build
    // print(empresaID);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GradientAppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Dashboard()));
            }),
        gradient: LinearGradient(
          colors: [
            Colors.orange[900],
            Colors.orange[300],
          ],
        ),
      ),
      // appBar: AppBar(
      //   actions: <Widget>[],
      // ),
      body: FutureBuilder<DocumentSnapshot>(
          future: Firestore.instance
              .collection('empresas')
              .document(empresa.empresaID)
              .get(),
          builder: (context, empresaSnap) {
            if (empresaSnap.hasData) {
              return ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 0.0),
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
                                    child: Container(
                                        height: 90,
                                        width: 90,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.orange,
                                                width: 2.0),
                                            borderRadius:
                                                BorderRadius.circular(45),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: empresaSnap
                                                          .data.data['foto'] !=
                                                      null
                                                  ? NetworkImage(empresaSnap
                                                      .data.data['foto'])
                                                  : AssetImage(
                                                      'assets/logo2.jpg'),
                                            ))),
                                    // child: CircleAvatar(

                                    //   radius: 50.0,
                                    //   backgroundImage:
                                    //       empresaSnap.data.data['foto'] != null
                                    //           ? NetworkImage(
                                    //               empresaSnap.data.data['foto'])
                                    //           : AssetImage('assets/logo2.jpg'),
                                    // ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  // Text("Clebinho", textScaleFactor: 1.25,)
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  AutoSizeText(
                                    empresaSnap.data.data['nomeEmpresa'],
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: "Bitter-Bold",
                                      color: Colors.black,
                                      letterSpacing: .6,
                                      fontSize: 27,
                                    ),
                                  ),
                                  AutoSizeText(
                                    empresaSnap.data.data['categoria'],
                                    //add categoria para poder puxar do database
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Bitter-Bold",
                                      letterSpacing: .6,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  // SmoothStarRating(
                                  //   allowHalfRating: false,
                                  //   onRatingChanged: (v) {
                                  //     setState(() {
                                  //       _rating = v;
                                  //     });
                                  //   },
                                  //   starCount: 5,
                                  //   rating: _rating,
                                  //   size: 27.0,
                                  //   color: Colors.orange,
                                  //   borderColor: Colors.orange,
                                  // ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  // Text(
                                  //   "$_rating",
                                  //   textScaleFactor: 2,
                                  // )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              onPressed: () async {
                                await showDialog(
                                    builder: (context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        title: Text(
                                          "ENDEREÇO:",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontFamily: "Bitter-Bold",
                                              color: Colors.black,
                                              letterSpacing: .6),
                                        ),
                                        content: Text(
                                          "${empresaSnap.data.data['complemento']}",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: "Domine-Regular",
                                              color: Colors.black,
                                              letterSpacing: .6),
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text("OK"),
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
                            IconButton(
                              onPressed: () async {
                                await showDialog(
                                    builder: (context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        title: Text(
                                          "CONTATO:",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontFamily: "Bitter-Bold",
                                              color: Colors.black,
                                              letterSpacing: .6),
                                        ),
                                        content: Text(
                                          "${empresaSnap.data.data['telefone'].toString()}",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: "Domine-Regular",
                                              color: Colors.black,
                                              letterSpacing: .6),
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text("MENSAGEM"),
                                            onPressed: () async {
                                              await ligarEmpresa(empresaSnap
                                                  .data.data['telefone']
                                                  .toString());
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          FlatButton(
                                            child: Text("LIGAR"),
                                            onPressed: () async {
                                              await ligarEmpresa(empresaSnap
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
                            IconButton(
                              onPressed: () async {
                                await showDialog(
                                    builder: (context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        title: Text(
                                          "HORÁRIO DE FUNCIONAMENTO:",
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontFamily: "Bitter-Bold",
                                            color: Colors.black,
                                          ),
                                        ),
                                        content: SingleChildScrollView(
                                          child: Column(
                                            children: <Widget>[
                                              Text(empresaSnap.data
                                                          .data['segVal'] ==
                                                      true
                                                  ? "Seg " +
                                                      empresaSnap.data
                                                          .data['horaInicio'] +
                                                      " às " +
                                                      empresaSnap.data
                                                          .data['horaTermino']
                                                  : ''),
                                              Text(empresaSnap.data
                                                          .data['terVal'] ==
                                                      true
                                                  ? "Ter " +
                                                      empresaSnap.data
                                                          .data['horaInicio'] +
                                                      " às " +
                                                      empresaSnap.data
                                                          .data['horaTermino']
                                                  : ''),
                                              Text(empresaSnap.data
                                                          .data['quaVal'] ==
                                                      true
                                                  ? "Qua " +
                                                      empresaSnap.data
                                                          .data['horaInicio'] +
                                                      " às " +
                                                      empresaSnap.data
                                                          .data['horaTermino']
                                                  : ''),
                                              Text(empresaSnap.data
                                                          .data['quiVal'] ==
                                                      true
                                                  ? "Qui " +
                                                      empresaSnap.data
                                                          .data['horaInicio'] +
                                                      " às " +
                                                      empresaSnap.data
                                                          .data['horaTermino']
                                                  : ''),
                                              Text(empresaSnap.data
                                                          .data['sexVal'] ==
                                                      true
                                                  ? "Sex " +
                                                      empresaSnap.data
                                                          .data['horaInicio'] +
                                                      " às " +
                                                      empresaSnap.data
                                                          .data['horaTermino']
                                                  : ''),
                                              Text(empresaSnap.data
                                                          .data['sabVal'] ==
                                                      true
                                                  ? "Sáb " +
                                                      empresaSnap.data
                                                          .data['horaInicio'] +
                                                      " às " +
                                                      empresaSnap.data
                                                          .data['horaTermino']
                                                  : ''),
                                              Text(empresaSnap.data
                                                          .data['domVal'] ==
                                                      true
                                                  ? "Dom " +
                                                      empresaSnap.data
                                                          .data['horaInicio'] +
                                                      " às " +
                                                      empresaSnap.data
                                                          .data['horaTermino']
                                                  : ''),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text("OK"),
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
                          ],
                        ),
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
                                      OfertaModel produto =
                                          OfertaModel.fromJson(
                                              snapshot
                                                  .data.documents[index].data,
                                              snapshot.data.documents[index]
                                                  .documentID);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  OfertaDetalhe(
                                                    produto: produto,
                                                  )));
                                    },
                                    child: Image.network(
                                      snapshot
                                          .data.documents[index].data['imagem'],
                                      scale: 0.9,
                                      loadingBuilder:
                                          (context, child, imgChunck) {
                                        if (imgChunck == null) {
                                          return child;
                                        } else {
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                      },
                                    ),
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
                            .collection('ofertas')
                            .where("empresaDona",
                                isEqualTo: widget.empresa.empresaID)
                            .where("mostrar", isEqualTo: true)
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
      floatingActionButton: (global.fbUser != null &&
              empresa.donoEmpresa == global.fbUser.uid)
          ? Wrap(
              direction: Axis.horizontal,
              children: <Widget>[
                new FloatingActionButton(
                  heroTag: null,
                  onPressed: () => mainBottomSheet(context),
                  child: new Icon(Icons.keyboard_arrow_up),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  heroTag: null,
                  child: Icon(Icons.add_a_photo),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ImageCapture(empresa.empresaID)));
                  },
                ),
              ],
            )
          : null,
    );
  }
}

// ListTile _createTile(
//     BuildContext context, String name, IconData icon, Function action) {
//   return ListTile(
//     leading: Icon(icon),
//     title: Text(name),
//     onTap: () {
//       Navigator.pop(context);
//       action();
//     },
//   );
// }

// _action1() {
//   print('action 1');
// }

// _action2() {
//   print('action 2');
// }

// _action3() {
//   print('action 3');
// }
