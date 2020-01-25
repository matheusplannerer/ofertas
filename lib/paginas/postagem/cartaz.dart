import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:load/load.dart';
import 'package:ofertas/controller/services.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ofertas/models/produtos.dart';

class Cartaz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CartazState();
  }
}

class _CartazState extends State<Cartaz> {
  Services services = Services();
  String email;
  GlobalKey _globalKey = new GlobalKey();

  OfertaModel produto = OfertaModel();

  List<String> descontoPrecoAux = ['0', '0', '0'];
  String lastDescontoPrecoAux = '';

  //Controladores do erro
  bool _erroNomeProduto = false;
  bool _erroPrecoDescontoProduto = false;
  bool _erroInfosAdicionais = false;
  bool _erroValidadeOferta = false;

//Controladores do textfield
  TextEditingController _nomeProduto = TextEditingController(text: '');
  TextEditingController _infosAdicionais = TextEditingController(text: '');
  TextEditingController _validadeOferta = TextEditingController();
  TextEditingController _precoDescontoProduto =
      TextEditingController(text: "0,00");

//Textos do erro
  String _textErroNomeProduto = '';
  String _textErroInfosAdicionais = '';
  String _textErroPrecoDescontoProduto = '';
  String _textErroValidadeOferta = '';

//Focusnode
  FocusNode _focusNodeDescontoPreco = FocusNode();

  //Number Format
  void _formatDescontoPreco(String lastDigitoAux) {
    String lastDigito = '';
    if (lastDescontoPrecoAux.length > lastDigitoAux.length) {
      lastDigito = "null";
    } else {
      lastDigito = "${lastDigitoAux[lastDigitoAux.length - 1]}";
    }
    // print(lastDigito);
    String newText = '';
    if (lastDigito != 'null') {
      //ADICIONOU UM VALOR

      // String newText = '';
      // newText = text;
      // if (text.length > 3) {
      //   newText.replaceRange(
      //       newText.length - 3, newText.length - 3, "${newText[newText.length - 3]},");
      // }

      if (descontoPrecoAux.first == "0") {
        //Substituir zeros
        descontoPrecoAux.add(lastDigito);
        descontoPrecoAux.removeAt(0);
      } else {
        descontoPrecoAux.add(lastDigito);
      }

      // for (var i = 0; i < precoAux.length; i++) {
      //   if (i == precoAux.length - 3) {
      //     newText = newText + "${precoAux[i]},";
      //   } else {
      //     newText = newText + "${precoAux[i]}";
      //   }
      // }
    } else {
      //REMOVEU UM VALOR
      if (descontoPrecoAux.length > 3) {
        print("Lenght era maior que 3");
        descontoPrecoAux.removeLast();
      } else {
        print("Length MENOR q 3");
        descontoPrecoAux.insert(0, "0");
        descontoPrecoAux.removeLast();
      }
    }
    for (var i = 0; i < descontoPrecoAux.length; i++) {
      if (i == descontoPrecoAux.length - 3) {
        newText = newText + "${descontoPrecoAux[i]},";
      } else {
        newText = newText + "${descontoPrecoAux[i]}";
      }
    }

    // print(newText);
    // print(precoAux);

    setState(() {
      _precoDescontoProduto = TextEditingController(text: newText);
      var cursorPos = _precoDescontoProduto.selection;

      _precoDescontoProduto.text = newText ?? '';

      if (cursorPos.start < _precoDescontoProduto.text.length) {
        cursorPos = new TextSelection.fromPosition(
            new TextPosition(offset: _precoDescontoProduto.text.length));
      }
      _precoDescontoProduto.selection = cursorPos;
      lastDescontoPrecoAux = "${_precoDescontoProduto.text}";
    });
  }

//Funcoes de validação
  void _validateNomeProduto(String text) {
    //Entrou pelo CARTAZ
    if (text.length > 20) {
      setState(() {
        _textErroNomeProduto = "Máximo de 20 caracteres";
        _erroNomeProduto = true;
      });
      return;
    } else if (text.length >= 3) {
      setState(() {
        _erroNomeProduto = false;
      });
      return;
    } else {
      setState(() {
        _textErroNomeProduto = "Mínimo de 3 caracteres";
        _erroNomeProduto = true;
      });
      return;
    }
  }

  void _validatePreco() {
    String descontoPreco = '';

    descontoPreco = descontoPrecoAux.join();

    if (int.tryParse(descontoPreco) != 0) {
      //ok
      if (descontoPrecoAux.length >= 6) {
        //erro: maior q 999,99
        setState(() {
          _erroPrecoDescontoProduto = true;
          _textErroPrecoDescontoProduto = "Máximo valor válido: R\$999,99";
        });
        return;
      }

      setState(() {
        //Sem erro, reseta
        _erroPrecoDescontoProduto = false;
        _textErroPrecoDescontoProduto = "";
      });
      return;
    } else {
      //Igual a 0: erro
      setState(() {
        _erroPrecoDescontoProduto = true;
        _textErroPrecoDescontoProduto = "Insira um valor com desconto válido";
      });
    }
  }

  Future<String> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary boundary =
          _globalKey.currentContext.findRenderObject();
      print(boundary);
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      print(image);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      print(byteData);
      var pngBytes = byteData.buffer.asUint8List();
      print(pngBytes);
      var bs64 = base64Encode(pngBytes);

      // print(pngBytes);
      print(bs64);

      setState(() {});
      return bs64;
    } catch (e) {
      print(e);
      return null;
    }
  }
  // Widget horizontalLine() => Padding(
  //       padding: EdgeInsets.symmetric(horizontal: 16.0),
  //       child: Container(
  //         width: ScreenUtil.getInstance().setWidth(120),
  //         height: 1.0,
  //         color: Colors.black,
  //       ),
  //     );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        gradient:
            LinearGradient(colors: [Colors.orange[900], Colors.orange[300]]),
      ),
      body: ListView(
        children: [
          RepaintBoundary(
            key: _globalKey,
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
                        _nomeProduto.text,
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
                        _infosAdicionais.text,
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
                            "${_precoDescontoProduto.text}",
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
            padding: EdgeInsets.only(top: 30),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _nomeProduto,
                  onChanged: (nome) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    errorText: _erroNomeProduto ? _textErroNomeProduto : null,
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
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  onChanged: (infos) {
                    setState(() {});
                  },
                  controller: _infosAdicionais,
                  maxLength: 120,
                  decoration: InputDecoration(
                    errorText:
                        _erroInfosAdicionais ? _textErroInfosAdicionais : null,
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
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                TextField(
                  onChanged: (precoText) {
                    _formatDescontoPreco(precoText);
                  },
                  keyboardType: TextInputType.number,
                  controller: _precoDescontoProduto,
                  decoration: InputDecoration(
                    prefixText: "R\$",
                    errorText: _erroPrecoDescontoProduto
                        ? _textErroPrecoDescontoProduto
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
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                FlatButton(
                  color: Colors.orange,
                  child: Text(
                    "Validade da oferta",
                    textAlign: TextAlign.start,
                  ),
                  onPressed: () async {
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
                    if (dateTime != null)
                      produto.validade = Timestamp.fromDate(dateTime);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Container(
                  child: RaisedButton(
                    color: Colors.orange,
                    child: Text('Visualizar Cartaz'),
                    onPressed: () async {
                      _validateNomeProduto(_nomeProduto.text);
                      _validatePreco();
                      FocusScope.of(context).requestFocus(FocusNode());
                      showLoadingDialog(tapDismiss: false);
                      await Future.delayed(
                          Duration(seconds: 1, milliseconds: 500));
                      hideLoadingDialog();
                      if (!_erroInfosAdicionais &&
                          !_erroNomeProduto &&
                          !_erroValidadeOferta &&
                          !_erroPrecoDescontoProduto) {
                        produto.nomeProduto = _nomeProduto.text.toUpperCase();
                        produto.desconto = _precoDescontoProduto.text;
                        produto.infos = _infosAdicionais.text;
                        produto.mostrar = true;

                        var base64 = await _capturePng();
                        Navigator.of(context).pop([base64, produto]);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
