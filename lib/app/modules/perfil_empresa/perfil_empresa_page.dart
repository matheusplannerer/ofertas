import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_controller.dart';
import 'package:ofertas/app/shared/components/button/button_widget.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class PerfilEmpresaPage extends StatefulWidget {
  final String empresaID;

  const PerfilEmpresaPage({Key key, this.empresaID}) : super(key: key);

  @override
  _PerfilEmpresaPageState createState() {
    print("AQUI 2");
    print(empresaID);
    return _PerfilEmpresaPageState();
  }
}

class _PerfilEmpresaPageState
    extends ModularState<PerfilEmpresaPage, PerfilEmpresaController> {
  PerfilEmpresaModel empresa;
  List<Widget> empresas = [];
  String empresaID;

  Stream<DocumentSnapshot> stream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    empresaID = widget.empresaID;
    // controller.stream
    stream = Firestore.instance
        .collection('empresas')
        .document(empresaID)
        .get()
        .asStream();
  }

  @override
  Widget build(BuildContext context) {
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
                      .where("donoEmpresa",
                          isEqualTo: controller.authController.fbUser.uid)
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
                                    .document(
                                        controller.authController.fbUser.uid)
                                    .updateData(
                                        {'empresaPerfil': aux.empresaID});
                                hideLoadingDialog();
                                controller.authController.user.empresaPerfil =
                                    aux.empresaID;
                                empresa = aux;
                                // global.setEmpresa Logada(empresa);
                                controller.routeController.tab1Nav.pop();
                                controller.updateModel(empresa);
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

    print(controller.routeController.keyTab2.currentState.widget.initialRoute);

    return Scaffold(
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
          children: <Widget>[
            StreamBuilder<DocumentSnapshot>(
              stream: stream,
              builder: (context, empresaSnap) {
                if (!empresaSnap.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                empresa = PerfilEmpresaModel.fromJson(
                    empresaSnap.data.data, empresaSnap.data.documentID);
                controller.updateModel(empresa);
                return Flexible(
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
                                                  'assets/mogi.png',
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
                                    var alertStyle = AlertStyle(
                                      isCloseButton: true,
                                    );
                                    Alert(
                                      context: controller.routeController
                                          .actualNavigator.currentState.context,
                                      style: alertStyle,
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "FECHAR",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          color: Colors.orange,
                                          onPressed: () => Navigator.of(
                                                  controller
                                                      .routeController
                                                      .actualNavigator
                                                      .currentState
                                                      .context)
                                              .pop(),
                                        ),
                                      ],
                                      title: 'Maps indisponível',
                                      desc:
                                          '${empresa.logradouro}, ${empresa.numero} / ${empresa.estado}',
                                      type: AlertType.info,
                                    ).show();
                                  }
                                }
                              },
                              icon: Icon(Icons.pin_drop, size: 30),
                            ),
                            IconButton(
                              onPressed: () async {
                                var alertStyle = AlertStyle(
                                    titleStyle: TextStyle(fontSize: 15));
                                Alert(
                                  context: controller.routeController
                                      .actualNavigator.currentState.context,
                                  content: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Column(
                                              children: <Widget>[
                                                Container(
                                                  child: IconButton(
                                                    icon: Icon(
                                                        Icons.phone_in_talk),
                                                    onPressed: () async {
                                                      var ligou = await controller
                                                          .ligarEmpresa(
                                                              controller
                                                                  .empresaModel
                                                                  .telefone);
                                                      if (ligou) return;
                                                      Navigator.of(controller
                                                              .routeController
                                                              .actualNavigator
                                                              .currentState
                                                              .context)
                                                          .pop();
                                                      Alert(
                                                        context: controller
                                                            .routeController
                                                            .actualNavigator
                                                            .currentState
                                                            .context,
                                                        title: "Contato: ",
                                                        content: Text(
                                                          controller
                                                              .empresaModel
                                                              .telefone,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey[500],
                                                              fontSize: 16),
                                                        ),
                                                        buttons: [
                                                          DialogButton(
                                                            child: Text(
                                                              "VOLTAR",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.of(controller
                                                                      .routeController
                                                                      .actualNavigator
                                                                      .currentState
                                                                      .context)
                                                                  .pop();
                                                            },
                                                            color:
                                                                Colors.orange,
                                                            height: 40,
                                                          )
                                                        ],
                                                      ).show();
                                                    },
                                                  ),
                                                ),
                                                Text(
                                                  "LIGAR",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey[400],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: <Widget>[
                                                Container(
                                                  child: IconButton(
                                                    icon: Icon(Icons.email),
                                                    onPressed: () async {
                                                      await controller
                                                          .enviaEmail();
                                                    },
                                                  ),
                                                ),
                                                Text(
                                                  "E-MAIL",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey[400],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        "VOLTAR",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(controller
                                                .routeController
                                                .actualNavigator
                                                .currentState
                                                .context)
                                            .pop();
                                      },
                                      color: Colors.orange,
                                      height: 40,
                                    )
                                  ],
                                  title: "Selecione o meio de contato",
                                  style: alertStyle,
                                ).show();
                              },
                              icon: Icon(Icons.phone, size: 30),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.routeController.actualNavigator
                                    .currentState
                                    .pushNamed(
                                  '/horarios',
                                  arguments: controller.empresaModel,
                                );
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
                );
              },
            ),
            StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance
                  .collection('ofertas')
                  .where("empresaDona", isEqualTo: empresaID)
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
                          controller
                              .routeController.actualNavigator.currentState
                              .pushNamed('/oferta_details', arguments: oferta);
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
      ),
      floatingActionButton: controller.isDono
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
