import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    empresaSnap = widget.empresaSnap;
    empresa = widget.empresa;
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
                                Navigator.of(context).pop();
                                Navigator.of(context)
                                    .pushReplacementNamed('/navbarHome');
                                // Navigator.of(context)
                                //     .pushReplacement(MaterialPageRoute(
                                //         builder: (context) => Dashboard(
                                //               empresaLogada:
                                //                   global.empresaLogada,
                                //               fbUser: global.fbUser,
                                //               user: global.usuario,
                                //             )));
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
                              Navigator.of(context)
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
                                  Navigator.of(context)
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

    bool isDono =
        (global.fbUser != null && empresa.donoEmpresa == global.fbUser.uid);

    return Scaffold(
      body: SingleChildScrollView(
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
                    padding: const EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 0.0),
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
                                                title: Text("ESCOLHER FOTO"),
                                                onTap: () {
                                                  // _pickImage(
                                                  //     ImageSource
                                                  //         .gallery);
                                                },
                                              ),
                                              ListTile(
                                                title: Text("TIRAR FOTO"),
                                                onTap: () {
                                                  // _pickImage(
                                                  //     ImageSource
                                                  //         .camera);
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
                                      image:
                                          empresaSnap.data.data['foto'] != null
                                              ? NetworkImage(
                                                  empresaSnap.data.data['foto'],
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
                                empresaSnap.data.data['nomeEmpresa'] ??= '',
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
                                empresaSnap.data.data['categoria'] ?? "",
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
                            // double lat = empresa.lat;
                            // double lon = empresa.lon;
                            // if (lat != 0 && lon != 0) {
                            //   final url =
                            //       'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
                            //   if (await canLaunch(url)) {
                            //     await launch(url);
                            //   } else {
                            //     throw 'Could not launch $url';
                            //   }
                            // }
                          },
                          icon: Icon(Icons.pin_drop, size: 30),
                        ),
                        IconButton(
                          onPressed: () async {
                            await showDialog(
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
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
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      FlatButton(
                                        child: Text("LIGAR"),
                                        onPressed: () async {
                                          // await ligarEmpresa(
                                          //     empresaSnap.data
                                          //         .data['telefone']
                                          //         .toString());
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
                            // Navigator.of(context).push(
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             Horarios(isDono)));
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
              stream: Firestore.instance
                  .collection('ofertas')
                  .where("empresaDona", isEqualTo: widget.empresa.empresaID)
                  .where("mostrar", isEqualTo: true)
                  .getDocuments()
                  .asStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // return Flexible(
                  //   fit: FlexFit.loose,
                  //   child:
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
                          // OfertaModel produto = OfertaModel.fromJson(
                          //     snapshot.data.documents[index].data,
                          //     snapshot
                          //         .data.documents[index].documentID);
                          // Navigator.of(context)
                          //     .push(MaterialPageRoute(
                          //         builder: (context) => OfertaDetalhe(
                          //               produto: produto,
                          //             )));
                        },
                        child: CachedNetworkImage(
                          imageUrl:
                              snapshot.data.documents[index].data['imagem'],
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
            ),
          ],
        ),
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
                    Navigator.of(context).pushNamed('/publicarOfertas');
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => ImageCapture(empresa.empresaID),
                    //   ),
                    // );
                  },
                ),
              ],
            )
          : null,
    );
  }
}
