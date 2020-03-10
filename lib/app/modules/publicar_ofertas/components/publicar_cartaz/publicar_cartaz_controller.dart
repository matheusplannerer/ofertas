import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';

part 'publicar_cartaz_controller.g.dart';

class PublicarCartazController = _PublicarCartazBase
    with _$PublicarCartazController;

abstract class _PublicarCartazBase with Store {
  String empresaID;
  GlobalKey globalKey = new GlobalKey();
  OfertaModel oferta = OfertaModel();

  _PublicarCartazBase({this.empresaID});

  List<String> oldPrecoDesconto = ["0", "0", "0"];

//OBSERVABLES
  @observable
  String bs64Cartaz;

  @observable
  TextEditingController precoController = TextEditingController(text: '0,00');

  //CAMPOS
  @observable
  String _nomeProduto = '';

  @observable
  String _infosAdicionais = '';

  @observable
  String _precoDescontoProduto = '';

  //AUXILIAR
  @observable
  String _validadeDia;

  @observable
  String _validadeMes;

  @observable
  String _validadeAno;

  //CONTROLE VALIDACAO CAMPOS
  @observable
  bool _erroNomeProduto = false;

  @observable
  bool _erroInfosAdicionais = false;

  @observable
  bool _erroValidade = false;

  @observable
  bool _erroPrecoDesconto = false;

  //TEXTO DE ERRO CAMPOS
  @observable
  String textErroNomeProduto;

  @observable
  String textErroInfosAdicionais;

  @observable
  String textErroValidade;

  @observable
  String textErroPrecoDesconto;

//VARIAVEIS
  @computed
  String get nomeProduto => _nomeProduto;

  @computed
  String get infosAdicionais => _infosAdicionais;

  @computed
  String get precoDescontoProduto {
    String preco = '';
    preco = precoController.text;
    return preco;
  }

  @computed
  bool get erroNomeProduto => _erroNomeProduto;

  @computed
  bool get erroInfosAdicionais => _erroInfosAdicionais;

  @computed
  bool get erroPrecoDesconto => _erroPrecoDesconto;

  @computed
  bool get erroValidade => _erroValidade;

  @computed
  bool get hasError {
    if (_erroInfosAdicionais ||
        _erroNomeProduto ||
        _erroPrecoDesconto ||
        _erroValidade) {
      return true;
    }
    return false;
  }

  @computed
  String get validade {
    if (_validadeDia != null && _validadeMes != null && _validadeAno != null) {
      String dia = _validadeDia;
      String mes = _validadeMes;
      if (int.tryParse(_validadeDia) < 10) {
        dia = '0$dia';
      }
      if (int.tryParse(_validadeMes) < 10) {
        mes = '0$mes';
      }
      return "$dia/$mes/$_validadeAno";
    }
    return null;
  }

//ACTIONS
  @action
  Future<void> updateBs64() async {
    try {
      print('inside');
      RenderRepaintBoundary boundary =
          globalKey.currentContext.findRenderObject();
      print(boundary);
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      print(image);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      print(byteData);
      var pngBytes = byteData.buffer.asUint8List();
      print(pngBytes);
      var bs64 = base64Encode(pngBytes);

      oferta.bs64ImgAux = bs64;
    } catch (e) {
      print(e);
      return null;
    }
  }

  //SETTERS
  @action
  void setValidade(DateTime date) {
    _validadeDia = date.day.toString();
    _validadeMes = date.month.toString();
    _validadeAno = date.year.toString();
    oferta.validade = Timestamp.fromDate(date);
  }

  @action
  void setNomeProduto(String value) {
    _nomeProduto = value.toUpperCase();
    oferta.nomeProduto = _nomeProduto.toUpperCase();
    validateNomeProduto();
  }

  @action
  void setInfosAdicionais(String value) {
    _infosAdicionais = value;
    oferta.infos = value.toUpperCase();
    validateInfosAdicionais();
  }

  @action
  void setPrecoDesconto(String value) {
    _precoDescontoProduto = value;
    oferta.desconto = value;
  }

  //VALIDATORS
  @action
  void validateNomeProduto() {
    if (_nomeProduto.length > 20) {
      textErroNomeProduto = "Máximo de 20 caracteres";
      _erroNomeProduto = true;
      return;
    } else if (_nomeProduto.length >= 3) {
      _erroNomeProduto = false;
      return;
    } else {
      textErroNomeProduto = "Mínimo de 3 caracteres";
      _erroNomeProduto = true;
      return;
    }
  }

  @action
  void validatePreco(String newValue) {
    String lastDigito = '';
    //Descubro a operação (inseriu um numero ou deletou)
    if (oldPrecoDesconto.length >=
        newValue.replaceAll(",", "").replaceAll(".", "").length)
      lastDigito = 'null';
    else
      lastDigito = newValue[newValue.length - 1];

    if (lastDigito != 'null') {
      if (oldPrecoDesconto.first == "0") {
        //Substituir zeros
        oldPrecoDesconto.add(lastDigito);
        oldPrecoDesconto.removeAt(0);
      } else {
        oldPrecoDesconto.add(lastDigito);
      }
    } else {
      //Deleta um
      if (oldPrecoDesconto.length > 3) {
        oldPrecoDesconto.removeLast();
      } else {
        //Deleta um assegurando a array com 3 elementos iguais a 0
        oldPrecoDesconto.insert(0, "0");
        oldPrecoDesconto.removeLast();
      }
    }

    String newText = '';

    for (var i = 0; i < oldPrecoDesconto.length; i++) {
      if (i == oldPrecoDesconto.length - 3) {
        newText = newText + "${oldPrecoDesconto[i]},";
      } else {
        newText = newText + "${oldPrecoDesconto[i]}";
      }
    }
    precoController = TextEditingController(text: newText);

    precoController = TextEditingController(text: newText);
    var cursorPos = precoController.selection;
    if (cursorPos.start < precoController.text.length) {
      cursorPos = new TextSelection.fromPosition(
          new TextPosition(offset: precoController.text.length));
    }
    precoController.selection = cursorPos;

    if (oldPrecoDesconto.length > 5) {
      _erroPrecoDesconto = true;
      textErroPrecoDesconto = "Valor máximo de R\$999,99";
      return;
    } else {
      _erroPrecoDesconto = false;
    }
    print(oldPrecoDesconto);

    int soma = 0;
    for (var i = 0; i < oldPrecoDesconto.length; i++) {
      soma = soma + int.tryParse(oldPrecoDesconto[i]);
    }
    if (soma >= 45) {
      _erroPrecoDesconto = true;
      textErroPrecoDesconto = "Valor máximo de R\$999,99";
    } else {
      _erroPrecoDesconto = false;
    }

    if (!_erroPrecoDesconto) {
      oferta.desconto = newText;
      setPrecoDesconto(newText);
    }
  }

  @action
  void validateInfosAdicionais() {}

  @action
  void validateAll() {
    validateInfosAdicionais();
    validateNomeProduto();
    if (oferta.nomeProduto == '') oferta.nomeProduto = null;
    if (oferta.infos == '') oferta.infos = null;
    if (oferta.desconto == '' || oferta.desconto == '0,00')
      oferta.desconto = null;
    if (oferta.preco == '' || oferta.preco == '0,00') oferta.nomeProduto = null;
  }

  @action
  void resetValidade() {
    oferta.validade = null;
    _validadeDia = null;
    _validadeMes = null;
    _validadeAno = null;
  }
}
