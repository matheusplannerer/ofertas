import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/modules/navigation_bar/components/perfil_empresa/components/empresa/empresa_controller.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class EmpresaPage extends StatefulWidget {
  final AsyncSnapshot<DocumentSnapshot> empresaSnap;
  final PerfilEmpresaModel empresa;
  final String title;
  const EmpresaPage(
      {Key key, this.title = "Empresa", this.empresaSnap, this.empresa})
      : super(key: key);

  @override
  _EmpresaPageState createState() => _EmpresaPageState();
}

class _EmpresaPageState extends State<EmpresaPage> {
  AsyncSnapshot<DocumentSnapshot> empresaSnap;
  PerfilEmpresaModel empresa;
  EmpresaController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    empresaSnap = widget.empresaSnap;
    empresa = widget.empresa;
    controller = EmpresaController(empresaModel: empresa);
  }

  List<Widget> empresas = [];

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<GlobalService>(context);
    mainBottomSheet(BuildContext context) {
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
                                PerfilEmpresaModel aux =
                                    PerfilEmpresaModel.fromJson(
                                  snapshot
                                      .data.documentChanges[i].document.data,
                                  snapshot.data.documentChanges[i].document
                                      .documentID,
                                );

                                showLoadingDialog(tapDismiss: false);
                                await Firestore.instance
                                    .collection('usuarios')
                                    .document(global.fbUser.uid)
                                    .updateData(
                                        {'empresaPerfil': aux.empresaID});
                                hideLoadingDialog();
                                setState(() {
                                  global.usuario.empresaPerfil = aux.empresaID;
                                  empresa = aux;
                                  global.setEmpresaLogada(empresa);
                                });

                                global.navigatorKeyPerfil.currentState.pop();
                                global.navigatorKeyPerfil.currentState
                                    .pushReplacementNamed('/',
                                        arguments:
                                            controller.empresaModel.empresaID);
                              },
                              leading: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage: snapshot
                                            .data
                                            .documentChanges[i]
                                            .document['foto'] !=
                                        null
                                    ? CachedNetworkImageProvider(
                                        snapshot.data.documentChanges[i]
                                            .document.data['foto'],
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
                              Modular.navigatorKey.currentState
                                  .pushNamed('/cadastroEmpresa');
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
                                  Modular.navigatorKey.currentState
                                      .pushNamed('/cadastroEmpresa');
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

    bool isDono = (global.fbUser != null &&
        controller.empresaModel.donoEmpresa == global.fbUser.uid);

    return Scaffold(
      body: Observer(
        builder: (context) {
          return SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  fit: FlexFit.loose,
                  // width: MediaQuery.of(context).size.width,
                  child: Column(
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
                                      // if ((global.fbUser != null &&
                                      //     empresa.donoEmpresa ==
                                      //         global.fbUser.uid))
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
                                                    onTap: () async {
                                                      Navigator.of(context)
                                                          .pop();
                                                      var img = await controller
                                                          .getImage(0);
                                                      // await Future.delayed(
                                                      //     Duration(seconds: 1));
                                                      showLoadingDialog();
                                                      await controller
                                                          .uploadImage(
                                                        controller.empresaModel
                                                            .empresaID,
                                                        controller
                                                            .empresaModel.foto,
                                                        img,
                                                      );
                                                      hideLoadingDialog();
                                                      controller.updateModel(
                                                          controller
                                                              .empresaModel);
                                                      // global.navigatorKeyPerfil
                                                      //     .currentState
                                                      //     .pushNamedAndRemoveUntil(
                                                      //         '/',
                                                      //         ModalRoute.withName(
                                                      //             '/'),
                                                      //         arguments: empresa
                                                      //             .empresaID);
                                                      // global.navigatorKeyPerfil
                                                      //     .currentState
                                                      //     .pop();
                                                      // _pickImage(
                                                      //     ImageSource
                                                      //         .gallery);
                                                    },
                                                  ),
                                                  ListTile(
                                                    title: Text("TIRAR FOTO"),
                                                    onTap: () async {
                                                      Navigator.of(context)
                                                          .pop();
                                                      var img = await controller
                                                          .getImage(1);
                                                      // await Future.delayed(
                                                      //     Duration(seconds: 1));
                                                      showLoadingDialog();
                                                      await controller
                                                          .uploadImage(
                                                        controller.empresaModel
                                                            .empresaID,
                                                        controller
                                                            .empresaModel.foto,
                                                        img,
                                                      );
                                                      hideLoadingDialog();
                                                      controller.updateModel(
                                                          controller
                                                              .empresaModel);
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
                                            color: Colors.orange, width: 2.0),
                                        borderRadius: BorderRadius.circular(45),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: controller.empresaModel.foto !=
                                                  null
                                              ? NetworkImage(
                                                  controller.empresaModel.foto,
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
                                    controller.empresaModel.nomeEmpresa ??= '',
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
                                    controller.empresaModel.categoria ?? "",
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          "${controller.empresaModel.telefone.toString()}",
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
                                              // await ligarEmpresa(
                                              //     empresaSnap.data
                                              //         .data['telefone']
                                              //         .toString());
                                              global.navigatorKeyPerfil
                                                  .currentState
                                                  .pop();
                                            },
                                          ),
                                          FlatButton(
                                            child: Text("LIGAR"),
                                            onPressed: () async {
                                              // await ligarEmpresa(
                                              //     empresaSnap.data
                                              //         .data['telefone']
                                              //         .toString());
                                              global.navigatorKeyPerfil
                                                  .currentState
                                                  .pop();
                                            },
                                          ),
                                          FlatButton(
                                            child: Text("OK"),
                                            onPressed: () {
                                              global.navigatorKeyPerfil
                                                  .currentState
                                                  .pop();
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
                              onPressed: () {},
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
                  stream: Firestore.instance
                      .collection('ofertas')
                      .where("empresaDona",
                          isEqualTo: controller.empresaModel.empresaID)
                      .where("mostrar", isEqualTo: true)
                      .getDocuments()
                      .asStream(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: snapshot.data.documents.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              OfertaModel oferta = OfertaModel.fromJson(
                                  snapshot.data.documents[index].data,
                                  snapshot.data.documents[index].documentID);
                              global.actualNavigator.currentState.pushNamed(
                                  '/oferta_details',
                                  arguments: oferta);
                            },
                            child: CachedNetworkImage(
                              alignment: Alignment.center,
                              imageUrl:
                                  snapshot.data.documents[index].data['imagem'],
                              fit: BoxFit.contain,
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
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: isDono
          ? Wrap(
              direction: Axis.horizontal,
              children: <Widget>[
                new FloatingActionButton(
                  backgroundColor: Colors.orange,
                  heroTag: null,
                  onPressed: () => mainBottomSheet(context),
                  child: new Icon(Icons.keyboard_arrow_up),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  backgroundColor: Colors.orange,
                  heroTag: null,
                  child: Icon(Icons.add_a_photo),
                  onPressed: () {
                    Modular.navigatorKey.currentState.pushNamed(
                        '/publicarOfertas/${controller.empresaModel.empresaID}');
                  },
                ),
              ],
            )
          : null,
    );
  }
}
