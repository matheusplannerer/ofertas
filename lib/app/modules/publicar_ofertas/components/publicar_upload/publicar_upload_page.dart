import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/modules/publicar_ofertas/components/publicar_upload/publicar_upload_controller.dart';
import 'package:ofertas/app/shared/components/button/button_widget.dart';

class PublicarUploadPage extends StatefulWidget {
  final String empresaID;
  final File imgFile;
  const PublicarUploadPage({Key key, this.empresaID, this.imgFile})
      : super(key: key);

  @override
  _PublicarUploadPageState createState() => _PublicarUploadPageState();
}

class _PublicarUploadPageState extends State<PublicarUploadPage> {
  PublicarUploadController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PublicarUploadController();
    controller.oferta.imgFileAux = widget.imgFile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          controller.updateImg(widget.imgFile);
          return ListView(
            children: <Widget>[
              if (controller.oferta.imgFileAux != null)
                Container(
                  // height: MediaQuery.of(context).size.height - 150,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        color: Colors.green,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 300,
                        child: Image.file(
                          controller.oferta.imgFileAux,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              onChanged: controller.setNomeProduto,
                              decoration: InputDecoration(
                                errorText: controller.erroNomeProduto
                                    ? controller.textErroNomeProduto
                                    : null,
                                labelStyle: TextStyle(
                                    color: Colors.grey[700], fontSize: 15),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(),
                                ),
                                labelText: 'Nome do Produto',
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Observer(
                              builder: (_) {
                                return TextField(
                                  onChanged: controller.formatPreco,
                                  keyboardType: TextInputType.number,
                                  controller: controller.precoController,
                                  decoration: InputDecoration(
                                    prefixText: "R\$",
                                    errorText: controller.erroPrecoProduto
                                        ? controller.textErroPrecoProduto
                                        : null,
                                    labelStyle: TextStyle(
                                        color: Colors.grey[700], fontSize: 15),
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(),
                                    ),
                                    labelText: 'Valor sem desconto',
                                  ),
                                );
                              },
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Observer(
                              builder: (_) {
                                return TextField(
                                  onChanged: controller.formatPrecoDesconto,
                                  keyboardType: TextInputType.number,
                                  controller:
                                      controller.precoDescontoController,
                                  decoration: InputDecoration(
                                    prefixText: "R\$",
                                    errorText: controller.erroPrecoDesconto
                                        ? controller.textErroPrecoDesconto
                                        : null,
                                    labelStyle: TextStyle(
                                        color: Colors.grey[700], fontSize: 15),
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(),
                                    ),
                                    labelText: 'Valor com desconto',
                                  ),
                                );
                              },
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Observer(
                              builder: (_) {
                                return GestureDetector(
                                  onTap: () async {
                                    var dateTime = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now().subtract(
                                        Duration(days: 1),
                                      ),
                                      lastDate: DateTime.now().add(
                                        Duration(days: 365),
                                      ),
                                    );
                                    if (dateTime != null) {
                                      controller.oferta.validade =
                                          Timestamp.fromDate(dateTime);
                                      controller.setValidade(dateTime);
                                    }
                                  },
                                  child: Container(
                                    height: 60,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      shape: BoxShape.rectangle,
                                      border:
                                          Border.all(color: Colors.grey[500]),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.calendar_today,
                                          size: 40,
                                        ),
                                        Expanded(
                                          child: Text(
                                            controller.validade ??
                                                "Validade da oferta",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        if (controller.validade == null)
                                          Icon(
                                            Icons.calendar_today,
                                            size: 40,
                                            color: Colors.grey[300],
                                          ),
                                        if (controller.validade != null)
                                          IconButton(
                                            icon: Icon(Icons.close),
                                            onPressed: () {
                                              controller.resetValidade();
                                            },
                                          ),
                                        SizedBox(width: 10),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: 3,
                              onChanged: controller.setInfosAdicionais,
                              // controller: _infosAdicionais,
                              maxLength: 20,
                              decoration: InputDecoration(
                                // errorText: _erroInfosAdicionais
                                //     ? _textErroInfosAdicionais
                                //     : null,
                                labelStyle: TextStyle(
                                    color: Colors.grey[700], fontSize: 15),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(),
                                ),
                                labelText: 'Informações adicionais (opcional)',
                              ),
                            ),
                            SizedBox(height: 10),
                            ButtonWidget(
                              height: 40,
                              width: MediaQuery.of(context).size.width - 60,
                              onTap: () {
                                controller.validateAll();
                                if (controller.hasError) return;
                                print(controller.oferta.nomeProduto);
                                print(controller.oferta.desconto);
                                print(controller.oferta.preco);
                                print(controller.oferta.validade);
                                print(controller.oferta.infos);
                                Modular.navigatorKey.currentState.pushNamed(
                                    '/publicarOfertas/concluir_oferta/upload',
                                    arguments: {
                                      'oferta': controller.oferta,
                                      'id': widget.empresaID
                                    });
                              },
                              text: "AVANÇAR",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
