import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_controller.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderEmpresaWidget extends StatelessWidget {
  final PerfilEmpresaModel empresa;
  final PerfilEmpresaController controller;
  HeaderEmpresaWidget(this.empresa, {this.controller});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
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
                          if (empresa == null) return;

                          await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                        title: Text("ESCOLHER FOTO"),
                                        onTap: () async {
                                          Navigator.of(context).pop();
                                          var img =
                                              await controller.getImage(0);
                                          // await Future.delayed(
                                          //     Duration(seconds: 1));
                                          showLoadingDialog();
                                          await controller.uploadImage(
                                            empresa.empresaID,
                                            empresa.foto,
                                            img,
                                          );
                                          hideLoadingDialog();
                                          controller.fetchPage();
                                        },
                                      ),
                                      ListTile(
                                        title: Text("TIRAR FOTO"),
                                        onTap: () async {
                                          Navigator.of(context).pop();
                                          var img =
                                              await controller.getImage(1);
                                          // await Future.delayed(
                                          //     Duration(seconds: 1));
                                          showLoadingDialog();
                                          await controller.uploadImage(
                                            empresa.empresaID,
                                            empresa.foto,
                                            img,
                                          );
                                          hideLoadingDialog();
                                          controller.fetchPage();
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
                            border:
                                Border.all(color: Colors.orange, width: 2.0),
                            borderRadius: BorderRadius.circular(45),
                            color: empresa == null
                                ? Colors.grey[300]
                                : Colors.transparent,
                            image: empresa != null
                                ? DecorationImage(
                                    fit: BoxFit.cover,
                                    image: empresa.foto != null
                                        ? NetworkImage(
                                            empresa.foto,
                                          )
                                        : AssetImage(
                                            'assets/mogi.png',
                                          ),
                                  )
                                : null,
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
                        empresa?.nomeEmpresa ?? '',
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
                        empresa?.categoria ?? "",
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
                    if (empresa == null) return;

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
                          context: controller.routeController.actualNavigator
                              .currentState.context,
                          style: alertStyle,
                          buttons: [
                            DialogButton(
                              child: Text(
                                "FECHAR",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              color: Colors.orange,
                              onPressed: () => Navigator.of(controller
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
                    if (empresa == null) return;
                    var alertStyle =
                        AlertStyle(titleStyle: TextStyle(fontSize: 15));
                    Alert(
                      context: controller
                          .routeController.actualNavigator.currentState.context,
                      content: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      child: IconButton(
                                        icon: Icon(Icons.phone_in_talk),
                                        onPressed: () async {
                                          var ligou = await controller
                                              .ligarEmpresa(empresa.telefone);
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
                                              empresa?.telefone,
                                              style: TextStyle(
                                                  color: Colors.grey[500],
                                                  fontSize: 16),
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
                                          await controller.enviaEmail();
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
                            Navigator.of(controller.routeController
                                    .actualNavigator.currentState.context)
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
                    if (empresa == null) return;
                    controller.routeController.actualNavigator.currentState
                        .pushNamed(
                      '/horarios',
                      arguments: empresa,
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
  }
}
