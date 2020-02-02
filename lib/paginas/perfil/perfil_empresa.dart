import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:ofertas/paginas/perfil/horario.dart';
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

class _PerfilEmpresaPageState extends State<PerfilEmpresaPage>
    with AutomaticKeepAliveClientMixin<PerfilEmpresaPage> {
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
                    .where("donoEmpresa", isEqualTo: global.fbUser.uid)
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
                            title: Text(
                              snapshot.data.documentChanges[i]
                                  .document['nomeEmpresa'],
                            ),
                            onTap: () async {
                              PerfilEmpresa aux = PerfilEmpresa.fromJson(
                                snapshot.data.documentChanges[i].document.data,
                                snapshot.data.documentChanges[i].document
                                    .documentID,
                              );

                              showLoadingDialog(tapDismiss: false);
                              await Firestore.instance
                                  .collection('usuarios')
                                  .document(global.fbUser.uid)
                                  .updateData({'empresaPerfil': aux.empresaID});
                              hideLoadingDialog();
                              setState(() {
                                global.usuario.empresaPerfil = aux.empresaID;
                                empresa = aux;
                                global.empresaLogada = empresa;
                              });
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => Dashboard(
                                            empresaLogada: global.empresaLogada,
                                            fbUser: global.fbUser,
                                            user: global.usuario,
                                          )));
                            },
                            leading: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: snapshot.data.documentChanges[i]
                                          .document['foto'] !=
                                      null
                                  ? CachedNetworkImageProvider(
                                      snapshot.data.documentChanges[i].document
                                          .data['foto'],
                                    )
                                  : AssetImage(
                                      "assets/mogi.jpg",
                                    ),
                            ),
                          ),
                        );
                      }
                      empresas.add(
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CadastroEmpresa(),
                              ),
                            );
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
      },
    );
  }

  _PerfilEmpresaPageState(this.empresa);
  PerfilEmpresa empresa;

  String foto = '';

  bool puxouFotos = false;

  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://ofertas-dd295.appspot.com');
  StorageUploadTask _uploadTask;

  File _imageFile;
  String base64;

  ligarEmpresa(String numero) async {
    if (await canLaunch('tel:+55${numero}')) {
      launch('tel:+55${numero}');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
    bool isDono =
        (global.fbUser != null && empresa.donoEmpresa == global.fbUser.uid);

    // TODO: implement build
    // print(empresaID);
    return Scaffold(
      backgroundColor: Colors.white,
      // ? Drawer(
      //     child: ListView(
      //       children: <Widget>[
      //         ListTile(
      //           title: Row(
      //             children: <Widget>[
      //               Icon(Icons.store,
      //                   color: Colors.orange.shade600, size: 30),
      //               Padding(
      //                 padding: EdgeInsets.only(left: 20.0),
      //                 child: Text(
      //                   'Editar Perfil',
      //                   style: TextStyle(
      //                       fontFamily: "Domine-Bold",
      //                       fontSize: 16,
      //                       color: Colors.black87,
      //                       letterSpacing: .3),
      //                 ),
      //               ),
      //             ],
      //           ),
      //           onTap: () {},
      //         ),
      //         Divider(),
      //       ],
      //     ),
      //   )
      appBar: GradientAppBar(
        gradient: LinearGradient(
          colors: [
            Colors.orange[900],
            Colors.orange[300],
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StreamBuilder<DocumentSnapshot>(
              stream: Firestore.instance
                  .collection('empresas')
                  .document(empresa.empresaID)
                  .get()
                  .asStream(),
              builder: (context, empresaSnap) {
                print(empresa.empresaID);
                if (empresaSnap.hasData) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.loose,
                        // width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  10.0, 20.0, 20.0, 0.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 125,
                                    child: Column(
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () async {
                                            if ((global.fbUser != null &&
                                                empresa.donoEmpresa ==
                                                    global.fbUser.uid))
                                              await showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    content:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        children: <Widget>[
                                                          ListTile(
                                                            title: Text(
                                                                "ESCOLHER FOTO"),
                                                            onTap: () {
                                                              _pickImage(
                                                                  ImageSource
                                                                      .gallery);
                                                            },
                                                          ),
                                                          ListTile(
                                                            title: Text(
                                                                "TIRAR FOTO"),
                                                            onTap: () {
                                                              _pickImage(
                                                                  ImageSource
                                                                      .camera);
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
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
                                                image: empresaSnap.data
                                                            .data['foto'] !=
                                                        null
                                                    ? NetworkImage(
                                                        empresaSnap
                                                            .data.data['foto'],
                                                      )
                                                    : AssetImage(
                                                        'assets/logo2.jpg',
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
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
                                          empresaSnap.data.data['categoria'] ??
                                              "",
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
                                        SizedBox(
                                          height: 5,
                                        ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  IconButton(
                                    onPressed: () async {
                                      double lat = empresa.lat;
                                      double lon = empresa.lon;
                                      if (lat != 0 && lon != 0) {
                                        final url =
                                            'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      }
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
                                                    BorderRadius.circular(20.0),
                                              ),
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
                                                    fontFamily:
                                                        "Domine-Regular",
                                                    color: Colors.black,
                                                    letterSpacing: .6),
                                              ),
                                              actions: <Widget>[
                                                FlatButton(
                                                  child: Text("MENSAGEM"),
                                                  onPressed: () async {
                                                    await ligarEmpresa(
                                                        empresaSnap.data
                                                            .data['telefone']
                                                            .toString());
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                FlatButton(
                                                  child: Text("LIGAR"),
                                                  onPressed: () async {
                                                    await ligarEmpresa(
                                                        empresaSnap.data
                                                            .data['telefone']
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
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Horarios(isDono)));
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
                          ],
                        ),
                      ),
                      StreamBuilder<QuerySnapshot>(
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            // return Flexible(
                            //   fit: FlexFit.loose,
                            //   child:
                            return GridView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: snapshot.data.documents.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    OfertaModel produto = OfertaModel.fromJson(
                                        snapshot.data.documents[index].data,
                                        snapshot
                                            .data.documents[index].documentID);
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => OfertaDetalhe(
                                                  produto: produto,
                                                )));
                                  },
                                  child: CachedNetworkImage(
                                    imageUrl: snapshot
                                        .data.documents[index].data['imagem'],
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
                                );
                              },
                            );
                            // );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                        stream: Firestore.instance
                            .collection('ofertas')
                            .where("empresaDona", isEqualTo: empresa.empresaID)
                            .where("mostrar", isEqualTo: true)
                            .getDocuments()
                            .asStream(),
                      ),
                    ],
                  );
                } else {
                  print('travou aqui');

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: isDono
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ImageCapture(empresa.empresaID),
                      ),
                    );
                  },
                ),
              ],
            )
          : null,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
