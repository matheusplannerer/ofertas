import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'dart:io';

import 'package:ofertas/app/shared/models/oferta_model.dart';

part 'publicar_upload_controller.g.dart';

class PublicarUploadController = _PublicarUploadBase
    with _$PublicarUploadController;

abstract class _PublicarUploadBase with Store {
  OfertaModel oferta = OfertaModel();
  List<String> oldPrecoDesconto = ["0", "0", "0"];
  List<String> oldPreco = ['0', '0', '0'];
  final String empresaID;

  _PublicarUploadBase({this.empresaID});

  @observable
  File imgFile;

  @action
  void updateImg(File value) {
    oferta.imgFileAux = value;
  }

  @observable
  TextEditingController precoDescontoController =
      TextEditingController(text: '0,00');

  @observable
  TextEditingController precoController = TextEditingController(text: '0,00');

  //CAMPOS
  @observable
  String _nomeProduto = '';

  @observable
  String _precoProduto = '';

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
  bool _erroPrecoProduto = false;

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
  String textErroPrecoProduto;

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
  String get precoProduto => _precoProduto;

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
  bool get erroPrecoProduto => _erroPrecoProduto;

  @computed
  bool get hasError {
    if (_erroInfosAdicionais ||
        _erroNomeProduto ||
        _erroPrecoDesconto ||
        _erroValidade ||
        _erroPrecoProduto) {
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

  @action
  void setPreco(String value) {
    _precoProduto = value;
    oferta.preco = value;
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
  void validateInfosAdicionais() {}

  @action
  void validatePreco() {
    if (oldPreco.length > 5) {
      _erroPrecoProduto = true;
      textErroPrecoProduto = "Valor máximo de R\$999,99";
      return;
    }

    String newText = '';

    for (var i = 0; i < oldPreco.length; i++) {
      if (i == oldPreco.length - 3) {
        newText = newText + "${oldPreco[i]},";
      } else {
        newText = newText + "${oldPreco[i]}";
      }
    }
    String newTextDesconto = '';

    for (var i = 0; i < oldPrecoDesconto.length; i++) {
      if (i == oldPrecoDesconto.length - 3) {
        newTextDesconto = newTextDesconto + "${oldPrecoDesconto[i]},";
      } else {
        newTextDesconto = newTextDesconto + "${oldPrecoDesconto[i]}";
      }
    }

    newText = newText.replaceAll(',', '.');
    newTextDesconto = newTextDesconto.replaceAll(',', '.');

    print(newText);
    print(newTextDesconto);

    double preco = double.tryParse(newText);
    double precoDesconto = double.tryParse(newTextDesconto);

    if (precoDesconto > preco && preco > 0) {
      _erroPrecoProduto = true;
      textErroPrecoProduto = 'Valor com desconto maior que valor sem desconto';
      return;
    }

    _erroPrecoProduto = false;
  }

  @action
  void validatePrecoDesconto() {
    if (oldPrecoDesconto.length > 5) {
      _erroPrecoDesconto = true;
      textErroPrecoDesconto = "Valor máximo de R\$999,99";
      return;
    }

    String newText = '';

    for (var i = 0; i < oldPreco.length; i++) {
      if (i == oldPreco.length - 3) {
        newText = newText + "${oldPreco[i]},";
      } else {
        newText = newText + "${oldPreco[i]}";
      }
    }
    String newTextDesconto = '';

    for (var i = 0; i < oldPrecoDesconto.length; i++) {
      if (i == oldPrecoDesconto.length - 3) {
        newTextDesconto = newTextDesconto + "${oldPrecoDesconto[i]},";
      } else {
        newTextDesconto = newTextDesconto + "${oldPrecoDesconto[i]}";
      }
    }

    newText = newText.replaceAll(',', '.');
    newTextDesconto = newTextDesconto.replaceAll(',', '.');

    print(newText);
    print(newTextDesconto);

    double preco = double.tryParse(newText);
    double precoDesconto = double.tryParse(newTextDesconto);

    if (preco > 0 && precoDesconto == 0) {
      _erroPrecoDesconto = true;
      textErroPrecoDesconto = 'Insira um desconto válido';
      return;
    }

    _erroPrecoDesconto = false;
    print(oldPrecoDesconto);
  }

  @action
  void formatPrecoDesconto(String newValue) {
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
    precoDescontoController = TextEditingController(text: newText);

    precoDescontoController = TextEditingController(text: newText);
    var cursorPos = precoDescontoController.selection;
    if (cursorPos.start < precoDescontoController.text.length) {
      cursorPos = new TextSelection.fromPosition(
          new TextPosition(offset: precoDescontoController.text.length));
    }
    precoDescontoController.selection = cursorPos;

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
  void formatPreco(String newValue) {
    String lastDigito = '';
    //Descubro a operação (inseriu um numero ou deletou)
    if (oldPreco.length >=
        newValue.replaceAll(",", "").replaceAll(".", "").length)
      lastDigito = 'null';
    else
      lastDigito = newValue[newValue.length - 1];

    print(lastDigito);

    if (lastDigito != 'null') {
      if (oldPreco.first == "0") {
        //Substituir zeros
        oldPreco.add(lastDigito);
        oldPreco.removeAt(0);
      } else {
        oldPreco.add(lastDigito);
      }
    } else {
      //Deleta um
      if (oldPreco.length > 3) {
        oldPreco.removeLast();
      } else {
        //Deleta um assegurando a array com 3 elementos iguais a 0
        oldPreco.insert(0, "0");
        oldPreco.removeLast();
      }
    }

    String newText = '';

    for (var i = 0; i < oldPreco.length; i++) {
      if (i == oldPreco.length - 3) {
        newText = newText + "${oldPreco[i]},";
      } else {
        newText = newText + "${oldPreco[i]}";
      }
    }
    print(newText);

    precoController = TextEditingController(text: newText);

    precoController = TextEditingController(text: newText);
    var cursorPos = precoController.selection;
    if (cursorPos.start < precoController.text.length) {
      cursorPos = new TextSelection.fromPosition(
          new TextPosition(offset: precoController.text.length));
    }
    precoController.selection = cursorPos;

    if (oldPreco.length > 5) {
      _erroPrecoProduto = true;
      textErroPrecoProduto = "Valor máximo de R\$999,99";
      return;
    } else {
      _erroPrecoProduto = false;
    }
    print(precoController.text);

    int soma = 0;
    for (var i = 0; i < oldPreco.length; i++) {
      soma = soma + int.tryParse(oldPreco[i]);
    }

    if (!_erroPrecoProduto) {
      oferta.preco = newText;
      setPreco(newText);
    }
  }

  @action
  void validateAll() {
    validateInfosAdicionais();
    validateNomeProduto();
    validatePreco();
    validatePrecoDesconto();
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
