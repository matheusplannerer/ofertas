import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/modules/publicar_ofertas/components/publicar_cartaz/publicar_cartaz_controller.dart';
import 'package:ofertas/app/shared/components/button/button_widget.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:provider/provider.dart';

class PublicarCartazPage extends StatefulWidget {
  final String title;
  final String bs64Img;
  const PublicarCartazPage(
      {Key key, this.title = "PublicarCartaz", this.bs64Img})
      : super(key: key);

  @override
  _PublicarCartazPageState createState() => _PublicarCartazPageState();
}

class _PublicarCartazPageState extends State<PublicarCartazPage> {
  var controller = PublicarCartazController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<GlobalService>(context);
    return Scaffold(
      body: Observer(
        builder: (_) {
          return ListView(
            children: [
              RepaintBoundary(
                key: controller.globalKey,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      height: 400,
                      width: 350,
                      child: Image.asset(
                        "assets/cartaz2.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      height: 400,
                      width: 285,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 90),
                          ),
                          AutoSizeText(
                            controller.nomeProduto,
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: 'Xampolo',
                              color: Colors.red,
                              fontSize: 80,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                          ),
                          AutoSizeText(
                            controller.infosAdicionais,
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: 'Xampolo',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30),
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: <Widget>[
                              AutoSizeText(
                                'R\$ ',
                                maxLines: 1,
                                style: TextStyle(
                                  fontFamily: 'Xampolo',
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 40,
                                ),
                              ),
                              AutoSizeText(
                                "${controller.precoDescontoProduto}",
                                maxLines: 1,
                                style: TextStyle(
                                  fontFamily: 'Xampolo',
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 90,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
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
                        labelStyle:
                            TextStyle(color: Colors.grey[700], fontSize: 15),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(),
                        ),
                        labelText: 'Nome do Produto',
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    TextField(
                      onChanged: controller.validatePreco,
                      keyboardType: TextInputType.number,
                      controller: controller.precoController,
                      decoration: InputDecoration(
                        prefixText: "R\$",
                        errorText: controller.erroPrecoDesconto
                            ? controller.textErroPrecoDesconto
                            : null,
                        labelStyle:
                            TextStyle(color: Colors.grey[700], fontSize: 15),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(),
                        ),
                        labelText: 'Valor com desconto',
                      ),
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
                              border: Border.all(color: Colors.grey[500]),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(width: 10),
                                Icon(
                                  Icons.calendar_today,
                                  size: 40,
                                ),
                                Expanded(
                                  child: Text(
                                    controller.validade ?? "Validade da oferta",
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
                        labelStyle:
                            TextStyle(color: Colors.grey[700], fontSize: 15),
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
                      onTap: () async {
                        controller.validateAll();
                        if (controller.hasError) return;

                        await controller.updateBs64();
                        Modular.navigatorKey.currentState.pushNamed(
                            '/publicarOfertas/concluir_oferta',
                            arguments: controller.oferta);
                      },
                      text: "AVANÇAR",
                    )
                    // Container(
                    //   child: RaisedButton(
                    //     color: Colors.orange,
                    //     child: Text('Visualizar Cartaz'),
                    //     onPressed: () async {
                    //       // _validateNomeProduto(_nomeProduto.text);
                    //       // _validatePreco();
                    //       // FocusScope.of(context).requestFocus(FocusNode());
                    //       // showLoadingDialog(tapDismiss: false);
                    //       // await Future.delayed(
                    //       //     Duration(seconds: 1, milliseconds: 500));
                    //       // hideLoadingDialog();
                    //       // if (!_erroInfosAdicionais &&
                    //       //     !_erroNomeProduto &&
                    //       //     !_erroValidadeOferta &&
                    //       //     !_erroPrecoDescontoProduto) {
                    //       //   produto.nomeProduto =
                    //       //       _nomeProduto.text.toUpperCase();
                    //       //   produto.desconto = _precoDescontoProduto.text;
                    //       //   produto.infos = _infosAdicionais.text;
                    //       //   produto.mostrar = true;

                    //       //   var base64 = await _capturePng();
                    //       //   Navigator.of(context).pop([base64, produto]);
                    //     },
                    //   ),
                    // ),
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
