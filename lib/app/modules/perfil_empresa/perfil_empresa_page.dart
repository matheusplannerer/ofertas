import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:load/load.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa/components/fotos_empresa/fotos_empresa_widget.dart';
import 'package:ofertas/app/modules/perfil_empresa/components/header_empresa/header_empresa_widget.dart';
import 'package:ofertas/app/modules/perfil_empresa/pages/nova_empresa/nova_empresa_page.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_controller.dart';
import 'package:ofertas/app/shared/components/button/button_widget.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';
import 'package:ofertas/app/shared/repositories/routes/route_controller.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class PerfilEmpresaPage extends StatefulWidget {
  final String empresaID;

  const PerfilEmpresaPage({Key key, this.empresaID}) : super(key: key);

  @override
  _PerfilEmpresaPageState createState() {
    return _PerfilEmpresaPageState();
  }
}

class _PerfilEmpresaPageState
    extends ModularState<PerfilEmpresaPage, PerfilEmpresaController> {
  List<Widget> empresas = [];
  ScrollController _scrollController = ScrollController();
  AppController appController = Modular.get();
  RouteController routeController = Modular.get();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetchPage();
    _scrollController.addListener(() {
      // if(_scrollController.position.)
    });
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
                          isEqualTo: controller.appController.authInfos.uid)
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
                                    PerfilEmpresaModel.fromJson(snapshot
                                        .data.documentChanges[i].document.data);

                                showLoadingDialog(tapDismiss: false);
                                await controller.changeEmpresa(aux);
                                hideLoadingDialog();
                                Navigator.of(context).pop();
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
                        if (appController.userPlano.profileNumberLeft > 1)
                          empresas.add(
                            FlatButton(
                              onPressed: () async {
                                await routeController.tab2Nav
                                    .pushNamed('/cadastrar_empresa');
                                controller.fetchPage();
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
                                onPressed: () async {
                                  await routeController.tab2Nav
                                      .pushNamed('/cadastrar_empresa');
                                  controller.fetchPage();
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

    return Observer(
      builder: (_) {
        if (!appController.hasCompany) return NovaEmpresaPage();
        return Scaffold(
          // endDrawer: Drawer(
          //   child: ListView(
          //     children: <Widget>[
          //       if (!controller.appController.signedIn)
          //         ListTile(
          //           title: Row(
          //             children: <Widget>[
          //               Icon(Icons.store,
          //                   color: Colors.orange.shade600, size: 30),
          //               Padding(
          //                 padding: EdgeInsets.only(left: 20.0),
          //                 child: Text(
          //                   '',
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
          //       Divider(),
          //     ],
          //   ),
          // ),
          appBar: GradientAppBar(
            gradient: LinearGradient(
              colors: [
                Colors.orange[900],
                Colors.orange[300],
              ],
            ),
          ),
          body: RefreshIndicator(
            key: _refreshIndicatorKey,
            backgroundColor: Colors.orange,
            color: Colors.white,
            onRefresh: () {
              print("TESTANDO");
              return controller.fetchPage();
            },
            child: ListView(
              controller: _scrollController,
              physics: AlwaysScrollableScrollPhysics(),
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Observer(
                      builder: (_) {
                        return HeaderEmpresaWidget(
                          controller.empresa,
                          controller: controller,
                        );
                      },
                    ),
                    Observer(
                      builder: (_) {
                        if (controller.ofertas == null) return Container();
                        if (controller.ofertas.length >= 0)
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.ofertas.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 5),
                            controller: _scrollController,
                            itemBuilder: (_, index) {
                              return FotosEmpresaWidget(
                                controller.ofertas[index],
                                controller: controller,
                              );
                            },
                          );
                      },
                    ),
                  ],
                )
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
                    if (appController.userPlano.postsLeft != 0)
                      FloatingActionButton(
                        backgroundColor: Colors.orange,
                        heroTag: null,
                        child: Icon(Icons.add_a_photo),
                        onPressed: () async {
                          await Modular.navigatorKey.currentState.pushNamed(
                              '/publicarOfertas/${controller.empresa.empresaID}');
                          controller.fetchPage();
                        },
                      ),
                  ],
                )
              : null,
        );
      },
    );
  }
}
