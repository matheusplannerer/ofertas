import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:ofertas/models/produtos.dart';
import 'package:ofertas/paginas/postagem/concluir_oferta.dart';

class InformacoesOferta extends StatefulWidget {
  InformacoesOferta({this.base64, this.imageFile, this.empresaID});
  final File imageFile; //Galeria ou foto
  final String base64; //Cartaz
  final String empresaID;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InformacoesOfertaState();
  }
}

class _InformacoesOfertaState extends State<InformacoesOferta> {
  OfertaModel produto;

  List<String> descontoPrecoAux = ['0', '0', '0'];
  List<String> precoAux = ['0', '0', '0'];

//Number Format
  void _formatPreco(String lastDigitoAux) {
    String lastDigito = "$lastDigitoAux";
    String newText = '';
    if (lastDigito != 'null') {
      //ADICIONOU UM VALOR

      // String newText = '';
      // newText = text;
      // if (text.length > 3) {
      //   newText.replaceRange(
      //       newText.length - 3, newText.length - 3, "${newText[newText.length - 3]},");
      // }

      if (precoAux.first == "0") {
        //Substituir zeros
        precoAux.add(lastDigito);
        precoAux.removeAt(0);
      } else {
        precoAux.add(lastDigito);
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
      if (precoAux.length > 3) {
        precoAux.removeLast();
      } else {
        precoAux.insert(0, "0");
        precoAux.removeLast();
      }
    }
    for (var i = 0; i < precoAux.length; i++) {
      if (i == precoAux.length - 3) {
        newText = newText + "${precoAux[i]},";
      } else {
        newText = newText + "${precoAux[i]}";
      }
    }

    // print(newText);
    // print(precoAux);

    setState(() {
      _precoProduto = TextEditingController(text: newText);
    });
  }

  void _formatDescontoPreco(String lastDigitoAux) {
    String lastDigito = "$lastDigitoAux";
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
        descontoPrecoAux.removeLast();
      } else {
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
    });
  }

// //Masks
//   var maskPreco = MaskTextInputFormatter(
//     mask: '###,##',
//     filter: {"#": RegExp(r'[0-9]')},
//   );

//Controladores do erro
  bool _erroNomeProduto = false;
  bool _erroPrecoProduto = false;
  bool _erroPrecoDescontoProduto = false;
  bool _erroValidadeOferta = false;
  bool _erroInfosAdicionais = false;

//Controladores do textfield
  TextEditingController _nomeProduto = TextEditingController();
  TextEditingController _precoProduto = TextEditingController(text: "0,00");
  TextEditingController _precoDescontoProduto =
      TextEditingController(text: "0,00");
  TextEditingController _validadeOferta = TextEditingController();
  TextEditingController _infosAdicionais = TextEditingController();

//Textos do erro
  String _textErroNomeProduto = '';
  String _textErroPrecoProduto = '';
  String _textErroPrecoDescontoProduto = '';
  String _textErroValidadeOferta = '';
  String _textErroInfosAdicionais = '';

//Focusnode
  FocusNode _focusNodePreco = FocusNode();
  FocusNode _focusNodeDescontoPreco = FocusNode();

//Funções de validação

  void _validateNomeProduto(String text) {
    if (widget.imageFile != null) {
      //Entrou por GALERIA ou FOTO
      if (text.length > 20) {
        setState(() {
          _textErroNomeProduto = "Máximo de 20 caracteres";
          _erroNomeProduto = true;
        });
        return;
      } else {
        setState(() {
          _erroNomeProduto = false;
        });
        return;
      }
    } else {
      //Entrou pelo CARTAZ
      if (text.length > 20) {
        setState(() {
          _textErroNomeProduto = "Máximo de 20 caracteres";
          _erroNomeProduto = true;
        });
        return;
      } else if (text.length > 3) {
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
  }

  void _validatePreco() {
    String preco = '';
    String descontoPreco = '';

    bool isDescontoMaisCaro = false;

    preco = precoAux.join();
    descontoPreco = descontoPrecoAux.join();

    if (int.tryParse(preco) < int.tryParse(descontoPreco))
      isDescontoMaisCaro = true;

    if (int.tryParse(preco) != 0) {
      if (isDescontoMaisCaro) {
        setState(() {
          _erroPrecoDescontoProduto = true;
          _textErroPrecoDescontoProduto =
              "Um desconto não pode ser mais caro que seu valor original!";
        });
      } else {
        setState(() {
          _erroPrecoDescontoProduto = false;
          _textErroPrecoDescontoProduto =
              "Um desconto não pode ser mais caro que seu valor original!";
        });
      }
    } else {
      if (int.tryParse(descontoPreco) != 0) {
        setState(() {
          _erroPrecoDescontoProduto = true;
          _textErroPrecoDescontoProduto =
              "Um desconto não pode ser mais caro que seu valor original!";
        });
      } else {
        setState(() {
          _erroPrecoDescontoProduto = false;
          _textErroPrecoDescontoProduto =
              "Um desconto não pode ser mais caro que seu valor original!";
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // preco.addListener(() {
    //   _formatPreco('');
    // });
    produto = OfertaModel();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _nomeProduto,
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
                SizedBox(height: 10),
                RawKeyboardListener(
                  onKey: (char) {
                    if (char.runtimeType.toString() == "RawKeyDownEvent") {
                      if (char.character != null ||
                          char.logicalKey.debugName == "Backspace") {
                        _formatPreco(char.character);
                      }
                    }
                    // print(char.character);
                  },
                  focusNode: _focusNodePreco,
                  child: TextField(
                    onChanged: (precoText) {},
                    keyboardType: TextInputType.number,
                    controller: _precoProduto,
                    decoration: InputDecoration(
                      helperText: "Opcional caso a foto seja um folheto",
                      prefixText: "R\$",
                      errorText:
                          _erroPrecoProduto ? _textErroPrecoProduto : null,
                      labelStyle:
                          TextStyle(color: Colors.grey[700], fontSize: 15),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Valor sem desconto (opcional)',
                    ),
                  ),
                ),
                SizedBox(height: 10),
                RawKeyboardListener(
                  onKey: (char) {
                    if (char.runtimeType.toString() == "RawKeyDownEvent") {
                      if (char.character != null ||
                          char.logicalKey.debugName == "Backspace") {
                        _formatDescontoPreco(char.character);
                      }
                    }
                    // print(char.character);
                  },
                  focusNode: _focusNodeDescontoPreco,
                  child: TextField(
                    onChanged: (precoText) {},
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
                ),
                SizedBox(height: 10),
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
                SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
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
              ],
            ),
          ),
          SizedBox(height: 40),
          Center(
            child: RaisedButton(
              onPressed: () {
                _validateNomeProduto(_nomeProduto.text);
                _validatePreco();
                if (!_erroInfosAdicionais &&
                    !_erroNomeProduto &&
                    !_erroPrecoDescontoProduto &&
                    !_erroPrecoProduto &&
                    !_erroValidadeOferta) {
                  produto.desconto = _precoDescontoProduto.text;
                  produto.empresaDona = widget.empresaID;
                  produto.idOferta = Firestore.instance
                      .collection('ofertas')
                      .document()
                      .documentID;
                  produto.infos = _infosAdicionais.text;
                  produto.mostrar = true;
                  produto.nomeProduto = _nomeProduto.text.toUpperCase();
                  produto.preco = _precoProduto.text;

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ConcluirOferta(
                        produto: produto,
                        base64: widget.base64 != null ? widget.base64 : null,
                        imageFile:
                            widget.imageFile != null ? widget.imageFile : null,
                        empresaID: widget.empresaID,
                      ),
                    ),
                  );
                }
                // if (formKey.currentState.validate()) {
                //   formKey.currentState.save();
                // }
              },
              child: Text("AVANÇAR"),
            ),
          ),
        ],
      ),
    );
  }
}
