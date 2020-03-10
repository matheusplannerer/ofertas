// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publicar_upload_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PublicarUploadController on _PublicarUploadBase, Store {
  Computed<String> _$nomeProdutoComputed;

  @override
  String get nomeProduto =>
      (_$nomeProdutoComputed ??= Computed<String>(() => super.nomeProduto))
          .value;
  Computed<String> _$infosAdicionaisComputed;

  @override
  String get infosAdicionais => (_$infosAdicionaisComputed ??=
          Computed<String>(() => super.infosAdicionais))
      .value;
  Computed<String> _$precoProdutoComputed;

  @override
  String get precoProduto =>
      (_$precoProdutoComputed ??= Computed<String>(() => super.precoProduto))
          .value;
  Computed<String> _$precoDescontoProdutoComputed;

  @override
  String get precoDescontoProduto => (_$precoDescontoProdutoComputed ??=
          Computed<String>(() => super.precoDescontoProduto))
      .value;
  Computed<bool> _$erroNomeProdutoComputed;

  @override
  bool get erroNomeProduto => (_$erroNomeProdutoComputed ??=
          Computed<bool>(() => super.erroNomeProduto))
      .value;
  Computed<bool> _$erroInfosAdicionaisComputed;

  @override
  bool get erroInfosAdicionais => (_$erroInfosAdicionaisComputed ??=
          Computed<bool>(() => super.erroInfosAdicionais))
      .value;
  Computed<bool> _$erroPrecoDescontoComputed;

  @override
  bool get erroPrecoDesconto => (_$erroPrecoDescontoComputed ??=
          Computed<bool>(() => super.erroPrecoDesconto))
      .value;
  Computed<bool> _$erroValidadeComputed;

  @override
  bool get erroValidade =>
      (_$erroValidadeComputed ??= Computed<bool>(() => super.erroValidade))
          .value;
  Computed<bool> _$erroPrecoProdutoComputed;

  @override
  bool get erroPrecoProduto => (_$erroPrecoProdutoComputed ??=
          Computed<bool>(() => super.erroPrecoProduto))
      .value;
  Computed<bool> _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError)).value;
  Computed<String> _$validadeComputed;

  @override
  String get validade =>
      (_$validadeComputed ??= Computed<String>(() => super.validade)).value;

  final _$imgFileAtom = Atom(name: '_PublicarUploadBase.imgFile');

  @override
  File get imgFile {
    _$imgFileAtom.context.enforceReadPolicy(_$imgFileAtom);
    _$imgFileAtom.reportObserved();
    return super.imgFile;
  }

  @override
  set imgFile(File value) {
    _$imgFileAtom.context.conditionallyRunInAction(() {
      super.imgFile = value;
      _$imgFileAtom.reportChanged();
    }, _$imgFileAtom, name: '${_$imgFileAtom.name}_set');
  }

  final _$precoDescontoControllerAtom =
      Atom(name: '_PublicarUploadBase.precoDescontoController');

  @override
  TextEditingController get precoDescontoController {
    _$precoDescontoControllerAtom.context
        .enforceReadPolicy(_$precoDescontoControllerAtom);
    _$precoDescontoControllerAtom.reportObserved();
    return super.precoDescontoController;
  }

  @override
  set precoDescontoController(TextEditingController value) {
    _$precoDescontoControllerAtom.context.conditionallyRunInAction(() {
      super.precoDescontoController = value;
      _$precoDescontoControllerAtom.reportChanged();
    }, _$precoDescontoControllerAtom,
        name: '${_$precoDescontoControllerAtom.name}_set');
  }

  final _$precoControllerAtom =
      Atom(name: '_PublicarUploadBase.precoController');

  @override
  TextEditingController get precoController {
    _$precoControllerAtom.context.enforceReadPolicy(_$precoControllerAtom);
    _$precoControllerAtom.reportObserved();
    return super.precoController;
  }

  @override
  set precoController(TextEditingController value) {
    _$precoControllerAtom.context.conditionallyRunInAction(() {
      super.precoController = value;
      _$precoControllerAtom.reportChanged();
    }, _$precoControllerAtom, name: '${_$precoControllerAtom.name}_set');
  }

  final _$_nomeProdutoAtom = Atom(name: '_PublicarUploadBase._nomeProduto');

  @override
  String get _nomeProduto {
    _$_nomeProdutoAtom.context.enforceReadPolicy(_$_nomeProdutoAtom);
    _$_nomeProdutoAtom.reportObserved();
    return super._nomeProduto;
  }

  @override
  set _nomeProduto(String value) {
    _$_nomeProdutoAtom.context.conditionallyRunInAction(() {
      super._nomeProduto = value;
      _$_nomeProdutoAtom.reportChanged();
    }, _$_nomeProdutoAtom, name: '${_$_nomeProdutoAtom.name}_set');
  }

  final _$_precoProdutoAtom = Atom(name: '_PublicarUploadBase._precoProduto');

  @override
  String get _precoProduto {
    _$_precoProdutoAtom.context.enforceReadPolicy(_$_precoProdutoAtom);
    _$_precoProdutoAtom.reportObserved();
    return super._precoProduto;
  }

  @override
  set _precoProduto(String value) {
    _$_precoProdutoAtom.context.conditionallyRunInAction(() {
      super._precoProduto = value;
      _$_precoProdutoAtom.reportChanged();
    }, _$_precoProdutoAtom, name: '${_$_precoProdutoAtom.name}_set');
  }

  final _$_infosAdicionaisAtom =
      Atom(name: '_PublicarUploadBase._infosAdicionais');

  @override
  String get _infosAdicionais {
    _$_infosAdicionaisAtom.context.enforceReadPolicy(_$_infosAdicionaisAtom);
    _$_infosAdicionaisAtom.reportObserved();
    return super._infosAdicionais;
  }

  @override
  set _infosAdicionais(String value) {
    _$_infosAdicionaisAtom.context.conditionallyRunInAction(() {
      super._infosAdicionais = value;
      _$_infosAdicionaisAtom.reportChanged();
    }, _$_infosAdicionaisAtom, name: '${_$_infosAdicionaisAtom.name}_set');
  }

  final _$_precoDescontoProdutoAtom =
      Atom(name: '_PublicarUploadBase._precoDescontoProduto');

  @override
  String get _precoDescontoProduto {
    _$_precoDescontoProdutoAtom.context
        .enforceReadPolicy(_$_precoDescontoProdutoAtom);
    _$_precoDescontoProdutoAtom.reportObserved();
    return super._precoDescontoProduto;
  }

  @override
  set _precoDescontoProduto(String value) {
    _$_precoDescontoProdutoAtom.context.conditionallyRunInAction(() {
      super._precoDescontoProduto = value;
      _$_precoDescontoProdutoAtom.reportChanged();
    }, _$_precoDescontoProdutoAtom,
        name: '${_$_precoDescontoProdutoAtom.name}_set');
  }

  final _$_validadeDiaAtom = Atom(name: '_PublicarUploadBase._validadeDia');

  @override
  String get _validadeDia {
    _$_validadeDiaAtom.context.enforceReadPolicy(_$_validadeDiaAtom);
    _$_validadeDiaAtom.reportObserved();
    return super._validadeDia;
  }

  @override
  set _validadeDia(String value) {
    _$_validadeDiaAtom.context.conditionallyRunInAction(() {
      super._validadeDia = value;
      _$_validadeDiaAtom.reportChanged();
    }, _$_validadeDiaAtom, name: '${_$_validadeDiaAtom.name}_set');
  }

  final _$_validadeMesAtom = Atom(name: '_PublicarUploadBase._validadeMes');

  @override
  String get _validadeMes {
    _$_validadeMesAtom.context.enforceReadPolicy(_$_validadeMesAtom);
    _$_validadeMesAtom.reportObserved();
    return super._validadeMes;
  }

  @override
  set _validadeMes(String value) {
    _$_validadeMesAtom.context.conditionallyRunInAction(() {
      super._validadeMes = value;
      _$_validadeMesAtom.reportChanged();
    }, _$_validadeMesAtom, name: '${_$_validadeMesAtom.name}_set');
  }

  final _$_validadeAnoAtom = Atom(name: '_PublicarUploadBase._validadeAno');

  @override
  String get _validadeAno {
    _$_validadeAnoAtom.context.enforceReadPolicy(_$_validadeAnoAtom);
    _$_validadeAnoAtom.reportObserved();
    return super._validadeAno;
  }

  @override
  set _validadeAno(String value) {
    _$_validadeAnoAtom.context.conditionallyRunInAction(() {
      super._validadeAno = value;
      _$_validadeAnoAtom.reportChanged();
    }, _$_validadeAnoAtom, name: '${_$_validadeAnoAtom.name}_set');
  }

  final _$_erroNomeProdutoAtom =
      Atom(name: '_PublicarUploadBase._erroNomeProduto');

  @override
  bool get _erroNomeProduto {
    _$_erroNomeProdutoAtom.context.enforceReadPolicy(_$_erroNomeProdutoAtom);
    _$_erroNomeProdutoAtom.reportObserved();
    return super._erroNomeProduto;
  }

  @override
  set _erroNomeProduto(bool value) {
    _$_erroNomeProdutoAtom.context.conditionallyRunInAction(() {
      super._erroNomeProduto = value;
      _$_erroNomeProdutoAtom.reportChanged();
    }, _$_erroNomeProdutoAtom, name: '${_$_erroNomeProdutoAtom.name}_set');
  }

  final _$_erroPrecoProdutoAtom =
      Atom(name: '_PublicarUploadBase._erroPrecoProduto');

  @override
  bool get _erroPrecoProduto {
    _$_erroPrecoProdutoAtom.context.enforceReadPolicy(_$_erroPrecoProdutoAtom);
    _$_erroPrecoProdutoAtom.reportObserved();
    return super._erroPrecoProduto;
  }

  @override
  set _erroPrecoProduto(bool value) {
    _$_erroPrecoProdutoAtom.context.conditionallyRunInAction(() {
      super._erroPrecoProduto = value;
      _$_erroPrecoProdutoAtom.reportChanged();
    }, _$_erroPrecoProdutoAtom, name: '${_$_erroPrecoProdutoAtom.name}_set');
  }

  final _$_erroInfosAdicionaisAtom =
      Atom(name: '_PublicarUploadBase._erroInfosAdicionais');

  @override
  bool get _erroInfosAdicionais {
    _$_erroInfosAdicionaisAtom.context
        .enforceReadPolicy(_$_erroInfosAdicionaisAtom);
    _$_erroInfosAdicionaisAtom.reportObserved();
    return super._erroInfosAdicionais;
  }

  @override
  set _erroInfosAdicionais(bool value) {
    _$_erroInfosAdicionaisAtom.context.conditionallyRunInAction(() {
      super._erroInfosAdicionais = value;
      _$_erroInfosAdicionaisAtom.reportChanged();
    }, _$_erroInfosAdicionaisAtom,
        name: '${_$_erroInfosAdicionaisAtom.name}_set');
  }

  final _$_erroValidadeAtom = Atom(name: '_PublicarUploadBase._erroValidade');

  @override
  bool get _erroValidade {
    _$_erroValidadeAtom.context.enforceReadPolicy(_$_erroValidadeAtom);
    _$_erroValidadeAtom.reportObserved();
    return super._erroValidade;
  }

  @override
  set _erroValidade(bool value) {
    _$_erroValidadeAtom.context.conditionallyRunInAction(() {
      super._erroValidade = value;
      _$_erroValidadeAtom.reportChanged();
    }, _$_erroValidadeAtom, name: '${_$_erroValidadeAtom.name}_set');
  }

  final _$_erroPrecoDescontoAtom =
      Atom(name: '_PublicarUploadBase._erroPrecoDesconto');

  @override
  bool get _erroPrecoDesconto {
    _$_erroPrecoDescontoAtom.context
        .enforceReadPolicy(_$_erroPrecoDescontoAtom);
    _$_erroPrecoDescontoAtom.reportObserved();
    return super._erroPrecoDesconto;
  }

  @override
  set _erroPrecoDesconto(bool value) {
    _$_erroPrecoDescontoAtom.context.conditionallyRunInAction(() {
      super._erroPrecoDesconto = value;
      _$_erroPrecoDescontoAtom.reportChanged();
    }, _$_erroPrecoDescontoAtom, name: '${_$_erroPrecoDescontoAtom.name}_set');
  }

  final _$textErroNomeProdutoAtom =
      Atom(name: '_PublicarUploadBase.textErroNomeProduto');

  @override
  String get textErroNomeProduto {
    _$textErroNomeProdutoAtom.context
        .enforceReadPolicy(_$textErroNomeProdutoAtom);
    _$textErroNomeProdutoAtom.reportObserved();
    return super.textErroNomeProduto;
  }

  @override
  set textErroNomeProduto(String value) {
    _$textErroNomeProdutoAtom.context.conditionallyRunInAction(() {
      super.textErroNomeProduto = value;
      _$textErroNomeProdutoAtom.reportChanged();
    }, _$textErroNomeProdutoAtom,
        name: '${_$textErroNomeProdutoAtom.name}_set');
  }

  final _$textErroInfosAdicionaisAtom =
      Atom(name: '_PublicarUploadBase.textErroInfosAdicionais');

  @override
  String get textErroInfosAdicionais {
    _$textErroInfosAdicionaisAtom.context
        .enforceReadPolicy(_$textErroInfosAdicionaisAtom);
    _$textErroInfosAdicionaisAtom.reportObserved();
    return super.textErroInfosAdicionais;
  }

  @override
  set textErroInfosAdicionais(String value) {
    _$textErroInfosAdicionaisAtom.context.conditionallyRunInAction(() {
      super.textErroInfosAdicionais = value;
      _$textErroInfosAdicionaisAtom.reportChanged();
    }, _$textErroInfosAdicionaisAtom,
        name: '${_$textErroInfosAdicionaisAtom.name}_set');
  }

  final _$textErroPrecoProdutoAtom =
      Atom(name: '_PublicarUploadBase.textErroPrecoProduto');

  @override
  String get textErroPrecoProduto {
    _$textErroPrecoProdutoAtom.context
        .enforceReadPolicy(_$textErroPrecoProdutoAtom);
    _$textErroPrecoProdutoAtom.reportObserved();
    return super.textErroPrecoProduto;
  }

  @override
  set textErroPrecoProduto(String value) {
    _$textErroPrecoProdutoAtom.context.conditionallyRunInAction(() {
      super.textErroPrecoProduto = value;
      _$textErroPrecoProdutoAtom.reportChanged();
    }, _$textErroPrecoProdutoAtom,
        name: '${_$textErroPrecoProdutoAtom.name}_set');
  }

  final _$textErroValidadeAtom =
      Atom(name: '_PublicarUploadBase.textErroValidade');

  @override
  String get textErroValidade {
    _$textErroValidadeAtom.context.enforceReadPolicy(_$textErroValidadeAtom);
    _$textErroValidadeAtom.reportObserved();
    return super.textErroValidade;
  }

  @override
  set textErroValidade(String value) {
    _$textErroValidadeAtom.context.conditionallyRunInAction(() {
      super.textErroValidade = value;
      _$textErroValidadeAtom.reportChanged();
    }, _$textErroValidadeAtom, name: '${_$textErroValidadeAtom.name}_set');
  }

  final _$textErroPrecoDescontoAtom =
      Atom(name: '_PublicarUploadBase.textErroPrecoDesconto');

  @override
  String get textErroPrecoDesconto {
    _$textErroPrecoDescontoAtom.context
        .enforceReadPolicy(_$textErroPrecoDescontoAtom);
    _$textErroPrecoDescontoAtom.reportObserved();
    return super.textErroPrecoDesconto;
  }

  @override
  set textErroPrecoDesconto(String value) {
    _$textErroPrecoDescontoAtom.context.conditionallyRunInAction(() {
      super.textErroPrecoDesconto = value;
      _$textErroPrecoDescontoAtom.reportChanged();
    }, _$textErroPrecoDescontoAtom,
        name: '${_$textErroPrecoDescontoAtom.name}_set');
  }

  final _$_PublicarUploadBaseActionController =
      ActionController(name: '_PublicarUploadBase');

  @override
  void updateImg(File value) {
    final _$actionInfo = _$_PublicarUploadBaseActionController.startAction();
    try {
      return super.updateImg(value);
    } finally {
      _$_PublicarUploadBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValidade(DateTime date) {
    final _$actionInfo = _$_PublicarUploadBaseActionController.startAction();
    try {
      return super.setValidade(date);
    } finally {
      _$_PublicarUploadBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNomeProduto(String value) {
    final _$actionInfo = _$_PublicarUploadBaseActionController.startAction();
    try {
      return super.setNomeProduto(value);
    } finally {
      _$_PublicarUploadBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInfosAdicionais(String value) {
    final _$actionInfo = _$_PublicarUploadBaseActionController.startAction();
    try {
      return super.setInfosAdicionais(value);
    } finally {
      _$_PublicarUploadBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrecoDesconto(String value) {
    final _$actionInfo = _$_PublicarUploadBaseActionController.startAction();
    try {
      return super.setPrecoDesconto(value);
    } finally {
      _$_PublicarUploadBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPreco(String value) {
    final _$actionInfo = _$_PublicarUploadBaseActionController.startAction();
    try {
      return super.setPreco(value);
    } finally {
      _$_PublicarUploadBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateNomeProduto() {
    final _$actionInfo = _$_PublicarUploadBaseActionController.startAction();
    try {
      return super.validateNomeProduto();
    } finally {
      _$_PublicarUploadBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateInfosAdicionais() {
    final _$actionInfo = _$_PublicarUploadBaseActionController.startAction();
    try {
      return super.validateInfosAdicionais();
    } finally {
      _$_PublicarUploadBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePreco() {
    final _$actionInfo = _$_PublicarUploadBaseActionController.startAction();
    try {
      return super.validatePreco();
    } finally {
      _$_PublicarUploadBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePrecoDesconto() {
    final _$actionInfo = _$_PublicarUploadBaseActionController.startAction();
    try {
      return super.validatePrecoDesconto();
    } finally {
      _$_PublicarUploadBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void formatPrecoDesconto(String newValue) {
    final _$actionInfo = _$_PublicarUploadBaseActionController.startAction();
    try {
      return super.formatPrecoDesconto(newValue);
    } finally {
      _$_PublicarUploadBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void formatPreco(String newValue) {
    final _$actionInfo = _$_PublicarUploadBaseActionController.startAction();
    try {
      return super.formatPreco(newValue);
    } finally {
      _$_PublicarUploadBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateAll() {
    final _$actionInfo = _$_PublicarUploadBaseActionController.startAction();
    try {
      return super.validateAll();
    } finally {
      _$_PublicarUploadBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetValidade() {
    final _$actionInfo = _$_PublicarUploadBaseActionController.startAction();
    try {
      return super.resetValidade();
    } finally {
      _$_PublicarUploadBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'imgFile: ${imgFile.toString()},precoDescontoController: ${precoDescontoController.toString()},precoController: ${precoController.toString()},textErroNomeProduto: ${textErroNomeProduto.toString()},textErroInfosAdicionais: ${textErroInfosAdicionais.toString()},textErroPrecoProduto: ${textErroPrecoProduto.toString()},textErroValidade: ${textErroValidade.toString()},textErroPrecoDesconto: ${textErroPrecoDesconto.toString()},nomeProduto: ${nomeProduto.toString()},infosAdicionais: ${infosAdicionais.toString()},precoProduto: ${precoProduto.toString()},precoDescontoProduto: ${precoDescontoProduto.toString()},erroNomeProduto: ${erroNomeProduto.toString()},erroInfosAdicionais: ${erroInfosAdicionais.toString()},erroPrecoDesconto: ${erroPrecoDesconto.toString()},erroValidade: ${erroValidade.toString()},erroPrecoProduto: ${erroPrecoProduto.toString()},hasError: ${hasError.toString()},validade: ${validade.toString()}';
    return '{$string}';
  }
}