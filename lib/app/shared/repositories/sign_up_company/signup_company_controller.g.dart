// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_company_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpCompanyController on _SignUpCompanyControllerBase, Store {
  Computed<String> _$nomeUnidadeComputed;

  @override
  String get nomeUnidade =>
      (_$nomeUnidadeComputed ??= Computed<String>(() => super.nomeUnidade))
          .value;
  Computed<String> _$tipoComputed;

  @override
  String get tipo =>
      (_$tipoComputed ??= Computed<String>(() => super.tipo)).value;
  Computed<String> _$cepComputed;

  @override
  String get cep => (_$cepComputed ??= Computed<String>(() => super.cep)).value;
  Computed<String> _$logradouroComputed;

  @override
  String get logradouro =>
      (_$logradouroComputed ??= Computed<String>(() => super.logradouro)).value;
  Computed<String> _$bairroComputed;

  @override
  String get bairro =>
      (_$bairroComputed ??= Computed<String>(() => super.bairro)).value;
  Computed<String> _$estadoComputed;

  @override
  String get estado =>
      (_$estadoComputed ??= Computed<String>(() => super.estado)).value;
  Computed<String> _$numeroComputed;

  @override
  String get numero =>
      (_$numeroComputed ??= Computed<String>(() => super.numero)).value;
  Computed<String> _$complementoComputed;

  @override
  String get complemento =>
      (_$complementoComputed ??= Computed<String>(() => super.complemento))
          .value;
  Computed<String> _$telefoneComputed;

  @override
  String get telefone =>
      (_$telefoneComputed ??= Computed<String>(() => super.telefone)).value;
  Computed<String> _$emailComputed;

  @override
  String get email =>
      (_$emailComputed ??= Computed<String>(() => super.email)).value;
  Computed<String> _$siteComputed;

  @override
  String get site =>
      (_$siteComputed ??= Computed<String>(() => super.site)).value;
  Computed<ObservableList<DropdownMenuItem<String>>> _$subcategoriaComputed;

  @override
  ObservableList<DropdownMenuItem<String>> get subcategoria =>
      (_$subcategoriaComputed ??=
              Computed<ObservableList<DropdownMenuItem<String>>>(
                  () => super.subcategoria))
          .value;
  Computed<String> _$subCategoriaStringComputed;

  @override
  String get subCategoriaString => (_$subCategoriaStringComputed ??=
          Computed<String>(() => super.subCategoriaString))
      .value;
  Computed<bool> _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError)).value;

  final _$subcategoriasAuxAtom =
      Atom(name: '_SignUpCompanyControllerBase.subcategoriasAux');

  @override
  ObservableList<DropdownMenuItem<String>> get subcategoriasAux {
    _$subcategoriasAuxAtom.context.enforceReadPolicy(_$subcategoriasAuxAtom);
    _$subcategoriasAuxAtom.reportObserved();
    return super.subcategoriasAux;
  }

  @override
  set subcategoriasAux(ObservableList<DropdownMenuItem<String>> value) {
    _$subcategoriasAuxAtom.context.conditionallyRunInAction(() {
      super.subcategoriasAux = value;
      _$subcategoriasAuxAtom.reportChanged();
    }, _$subcategoriasAuxAtom, name: '${_$subcategoriasAuxAtom.name}_set');
  }

  final _$nomeUnidadeControllerAtom =
      Atom(name: '_SignUpCompanyControllerBase.nomeUnidadeController');

  @override
  TextEditingController get nomeUnidadeController {
    _$nomeUnidadeControllerAtom.context
        .enforceReadPolicy(_$nomeUnidadeControllerAtom);
    _$nomeUnidadeControllerAtom.reportObserved();
    return super.nomeUnidadeController;
  }

  @override
  set nomeUnidadeController(TextEditingController value) {
    _$nomeUnidadeControllerAtom.context.conditionallyRunInAction(() {
      super.nomeUnidadeController = value;
      _$nomeUnidadeControllerAtom.reportChanged();
    }, _$nomeUnidadeControllerAtom,
        name: '${_$nomeUnidadeControllerAtom.name}_set');
  }

  final _$tipoControllerAtom =
      Atom(name: '_SignUpCompanyControllerBase.tipoController');

  @override
  TextEditingController get tipoController {
    _$tipoControllerAtom.context.enforceReadPolicy(_$tipoControllerAtom);
    _$tipoControllerAtom.reportObserved();
    return super.tipoController;
  }

  @override
  set tipoController(TextEditingController value) {
    _$tipoControllerAtom.context.conditionallyRunInAction(() {
      super.tipoController = value;
      _$tipoControllerAtom.reportChanged();
    }, _$tipoControllerAtom, name: '${_$tipoControllerAtom.name}_set');
  }

  final _$cepControllerAtom =
      Atom(name: '_SignUpCompanyControllerBase.cepController');

  @override
  TextEditingController get cepController {
    _$cepControllerAtom.context.enforceReadPolicy(_$cepControllerAtom);
    _$cepControllerAtom.reportObserved();
    return super.cepController;
  }

  @override
  set cepController(TextEditingController value) {
    _$cepControllerAtom.context.conditionallyRunInAction(() {
      super.cepController = value;
      _$cepControllerAtom.reportChanged();
    }, _$cepControllerAtom, name: '${_$cepControllerAtom.name}_set');
  }

  final _$logradouroControllerAtom =
      Atom(name: '_SignUpCompanyControllerBase.logradouroController');

  @override
  TextEditingController get logradouroController {
    _$logradouroControllerAtom.context
        .enforceReadPolicy(_$logradouroControllerAtom);
    _$logradouroControllerAtom.reportObserved();
    return super.logradouroController;
  }

  @override
  set logradouroController(TextEditingController value) {
    _$logradouroControllerAtom.context.conditionallyRunInAction(() {
      super.logradouroController = value;
      _$logradouroControllerAtom.reportChanged();
    }, _$logradouroControllerAtom,
        name: '${_$logradouroControllerAtom.name}_set');
  }

  final _$bairroControllerAtom =
      Atom(name: '_SignUpCompanyControllerBase.bairroController');

  @override
  TextEditingController get bairroController {
    _$bairroControllerAtom.context.enforceReadPolicy(_$bairroControllerAtom);
    _$bairroControllerAtom.reportObserved();
    return super.bairroController;
  }

  @override
  set bairroController(TextEditingController value) {
    _$bairroControllerAtom.context.conditionallyRunInAction(() {
      super.bairroController = value;
      _$bairroControllerAtom.reportChanged();
    }, _$bairroControllerAtom, name: '${_$bairroControllerAtom.name}_set');
  }

  final _$estadoControllerAtom =
      Atom(name: '_SignUpCompanyControllerBase.estadoController');

  @override
  TextEditingController get estadoController {
    _$estadoControllerAtom.context.enforceReadPolicy(_$estadoControllerAtom);
    _$estadoControllerAtom.reportObserved();
    return super.estadoController;
  }

  @override
  set estadoController(TextEditingController value) {
    _$estadoControllerAtom.context.conditionallyRunInAction(() {
      super.estadoController = value;
      _$estadoControllerAtom.reportChanged();
    }, _$estadoControllerAtom, name: '${_$estadoControllerAtom.name}_set');
  }

  final _$numeroControllerAtom =
      Atom(name: '_SignUpCompanyControllerBase.numeroController');

  @override
  TextEditingController get numeroController {
    _$numeroControllerAtom.context.enforceReadPolicy(_$numeroControllerAtom);
    _$numeroControllerAtom.reportObserved();
    return super.numeroController;
  }

  @override
  set numeroController(TextEditingController value) {
    _$numeroControllerAtom.context.conditionallyRunInAction(() {
      super.numeroController = value;
      _$numeroControllerAtom.reportChanged();
    }, _$numeroControllerAtom, name: '${_$numeroControllerAtom.name}_set');
  }

  final _$complementoControllerAtom =
      Atom(name: '_SignUpCompanyControllerBase.complementoController');

  @override
  TextEditingController get complementoController {
    _$complementoControllerAtom.context
        .enforceReadPolicy(_$complementoControllerAtom);
    _$complementoControllerAtom.reportObserved();
    return super.complementoController;
  }

  @override
  set complementoController(TextEditingController value) {
    _$complementoControllerAtom.context.conditionallyRunInAction(() {
      super.complementoController = value;
      _$complementoControllerAtom.reportChanged();
    }, _$complementoControllerAtom,
        name: '${_$complementoControllerAtom.name}_set');
  }

  final _$telefoneControllerAtom =
      Atom(name: '_SignUpCompanyControllerBase.telefoneController');

  @override
  TextEditingController get telefoneController {
    _$telefoneControllerAtom.context
        .enforceReadPolicy(_$telefoneControllerAtom);
    _$telefoneControllerAtom.reportObserved();
    return super.telefoneController;
  }

  @override
  set telefoneController(TextEditingController value) {
    _$telefoneControllerAtom.context.conditionallyRunInAction(() {
      super.telefoneController = value;
      _$telefoneControllerAtom.reportChanged();
    }, _$telefoneControllerAtom, name: '${_$telefoneControllerAtom.name}_set');
  }

  final _$emailControllerAtom =
      Atom(name: '_SignUpCompanyControllerBase.emailController');

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.context.enforceReadPolicy(_$emailControllerAtom);
    _$emailControllerAtom.reportObserved();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.context.conditionallyRunInAction(() {
      super.emailController = value;
      _$emailControllerAtom.reportChanged();
    }, _$emailControllerAtom, name: '${_$emailControllerAtom.name}_set');
  }

  final _$siteControllerAtom =
      Atom(name: '_SignUpCompanyControllerBase.siteController');

  @override
  TextEditingController get siteController {
    _$siteControllerAtom.context.enforceReadPolicy(_$siteControllerAtom);
    _$siteControllerAtom.reportObserved();
    return super.siteController;
  }

  @override
  set siteController(TextEditingController value) {
    _$siteControllerAtom.context.conditionallyRunInAction(() {
      super.siteController = value;
      _$siteControllerAtom.reportChanged();
    }, _$siteControllerAtom, name: '${_$siteControllerAtom.name}_set');
  }

  final _$cadastroAtom = Atom(name: '_SignUpCompanyControllerBase.cadastro');

  @override
  PerfilEmpresaModel get cadastro {
    _$cadastroAtom.context.enforceReadPolicy(_$cadastroAtom);
    _$cadastroAtom.reportObserved();
    return super.cadastro;
  }

  @override
  set cadastro(PerfilEmpresaModel value) {
    _$cadastroAtom.context.conditionallyRunInAction(() {
      super.cadastro = value;
      _$cadastroAtom.reportChanged();
    }, _$cadastroAtom, name: '${_$cadastroAtom.name}_set');
  }

  final _$_nomeUnidadeAtom =
      Atom(name: '_SignUpCompanyControllerBase._nomeUnidade');

  @override
  String get _nomeUnidade {
    _$_nomeUnidadeAtom.context.enforceReadPolicy(_$_nomeUnidadeAtom);
    _$_nomeUnidadeAtom.reportObserved();
    return super._nomeUnidade;
  }

  @override
  set _nomeUnidade(String value) {
    _$_nomeUnidadeAtom.context.conditionallyRunInAction(() {
      super._nomeUnidade = value;
      _$_nomeUnidadeAtom.reportChanged();
    }, _$_nomeUnidadeAtom, name: '${_$_nomeUnidadeAtom.name}_set');
  }

  final _$_tipoAtom = Atom(name: '_SignUpCompanyControllerBase._tipo');

  @override
  String get _tipo {
    _$_tipoAtom.context.enforceReadPolicy(_$_tipoAtom);
    _$_tipoAtom.reportObserved();
    return super._tipo;
  }

  @override
  set _tipo(String value) {
    _$_tipoAtom.context.conditionallyRunInAction(() {
      super._tipo = value;
      _$_tipoAtom.reportChanged();
    }, _$_tipoAtom, name: '${_$_tipoAtom.name}_set');
  }

  final _$_cepAtom = Atom(name: '_SignUpCompanyControllerBase._cep');

  @override
  String get _cep {
    _$_cepAtom.context.enforceReadPolicy(_$_cepAtom);
    _$_cepAtom.reportObserved();
    return super._cep;
  }

  @override
  set _cep(String value) {
    _$_cepAtom.context.conditionallyRunInAction(() {
      super._cep = value;
      _$_cepAtom.reportChanged();
    }, _$_cepAtom, name: '${_$_cepAtom.name}_set');
  }

  final _$_logradouroAtom =
      Atom(name: '_SignUpCompanyControllerBase._logradouro');

  @override
  String get _logradouro {
    _$_logradouroAtom.context.enforceReadPolicy(_$_logradouroAtom);
    _$_logradouroAtom.reportObserved();
    return super._logradouro;
  }

  @override
  set _logradouro(String value) {
    _$_logradouroAtom.context.conditionallyRunInAction(() {
      super._logradouro = value;
      _$_logradouroAtom.reportChanged();
    }, _$_logradouroAtom, name: '${_$_logradouroAtom.name}_set');
  }

  final _$_bairroAtom = Atom(name: '_SignUpCompanyControllerBase._bairro');

  @override
  String get _bairro {
    _$_bairroAtom.context.enforceReadPolicy(_$_bairroAtom);
    _$_bairroAtom.reportObserved();
    return super._bairro;
  }

  @override
  set _bairro(String value) {
    _$_bairroAtom.context.conditionallyRunInAction(() {
      super._bairro = value;
      _$_bairroAtom.reportChanged();
    }, _$_bairroAtom, name: '${_$_bairroAtom.name}_set');
  }

  final _$_estadoAtom = Atom(name: '_SignUpCompanyControllerBase._estado');

  @override
  String get _estado {
    _$_estadoAtom.context.enforceReadPolicy(_$_estadoAtom);
    _$_estadoAtom.reportObserved();
    return super._estado;
  }

  @override
  set _estado(String value) {
    _$_estadoAtom.context.conditionallyRunInAction(() {
      super._estado = value;
      _$_estadoAtom.reportChanged();
    }, _$_estadoAtom, name: '${_$_estadoAtom.name}_set');
  }

  final _$_numeroAtom = Atom(name: '_SignUpCompanyControllerBase._numero');

  @override
  String get _numero {
    _$_numeroAtom.context.enforceReadPolicy(_$_numeroAtom);
    _$_numeroAtom.reportObserved();
    return super._numero;
  }

  @override
  set _numero(String value) {
    _$_numeroAtom.context.conditionallyRunInAction(() {
      super._numero = value;
      _$_numeroAtom.reportChanged();
    }, _$_numeroAtom, name: '${_$_numeroAtom.name}_set');
  }

  final _$_complementoAtom =
      Atom(name: '_SignUpCompanyControllerBase._complemento');

  @override
  String get _complemento {
    _$_complementoAtom.context.enforceReadPolicy(_$_complementoAtom);
    _$_complementoAtom.reportObserved();
    return super._complemento;
  }

  @override
  set _complemento(String value) {
    _$_complementoAtom.context.conditionallyRunInAction(() {
      super._complemento = value;
      _$_complementoAtom.reportChanged();
    }, _$_complementoAtom, name: '${_$_complementoAtom.name}_set');
  }

  final _$_telefoneAtom = Atom(name: '_SignUpCompanyControllerBase._telefone');

  @override
  String get _telefone {
    _$_telefoneAtom.context.enforceReadPolicy(_$_telefoneAtom);
    _$_telefoneAtom.reportObserved();
    return super._telefone;
  }

  @override
  set _telefone(String value) {
    _$_telefoneAtom.context.conditionallyRunInAction(() {
      super._telefone = value;
      _$_telefoneAtom.reportChanged();
    }, _$_telefoneAtom, name: '${_$_telefoneAtom.name}_set');
  }

  final _$_emailAtom = Atom(name: '_SignUpCompanyControllerBase._email');

  @override
  String get _email {
    _$_emailAtom.context.enforceReadPolicy(_$_emailAtom);
    _$_emailAtom.reportObserved();
    return super._email;
  }

  @override
  set _email(String value) {
    _$_emailAtom.context.conditionallyRunInAction(() {
      super._email = value;
      _$_emailAtom.reportChanged();
    }, _$_emailAtom, name: '${_$_emailAtom.name}_set');
  }

  final _$_siteAtom = Atom(name: '_SignUpCompanyControllerBase._site');

  @override
  String get _site {
    _$_siteAtom.context.enforceReadPolicy(_$_siteAtom);
    _$_siteAtom.reportObserved();
    return super._site;
  }

  @override
  set _site(String value) {
    _$_siteAtom.context.conditionallyRunInAction(() {
      super._site = value;
      _$_siteAtom.reportChanged();
    }, _$_siteAtom, name: '${_$_siteAtom.name}_set');
  }

  final _$_subcategoriaAtom =
      Atom(name: '_SignUpCompanyControllerBase._subcategoria');

  @override
  String get _subcategoria {
    _$_subcategoriaAtom.context.enforceReadPolicy(_$_subcategoriaAtom);
    _$_subcategoriaAtom.reportObserved();
    return super._subcategoria;
  }

  @override
  set _subcategoria(String value) {
    _$_subcategoriaAtom.context.conditionallyRunInAction(() {
      super._subcategoria = value;
      _$_subcategoriaAtom.reportChanged();
    }, _$_subcategoriaAtom, name: '${_$_subcategoriaAtom.name}_set');
  }

  final _$textErroNomeUnidadeAtom =
      Atom(name: '_SignUpCompanyControllerBase.textErroNomeUnidade');

  @override
  String get textErroNomeUnidade {
    _$textErroNomeUnidadeAtom.context
        .enforceReadPolicy(_$textErroNomeUnidadeAtom);
    _$textErroNomeUnidadeAtom.reportObserved();
    return super.textErroNomeUnidade;
  }

  @override
  set textErroNomeUnidade(String value) {
    _$textErroNomeUnidadeAtom.context.conditionallyRunInAction(() {
      super.textErroNomeUnidade = value;
      _$textErroNomeUnidadeAtom.reportChanged();
    }, _$textErroNomeUnidadeAtom,
        name: '${_$textErroNomeUnidadeAtom.name}_set');
  }

  final _$textErroTipoAtom =
      Atom(name: '_SignUpCompanyControllerBase.textErroTipo');

  @override
  String get textErroTipo {
    _$textErroTipoAtom.context.enforceReadPolicy(_$textErroTipoAtom);
    _$textErroTipoAtom.reportObserved();
    return super.textErroTipo;
  }

  @override
  set textErroTipo(String value) {
    _$textErroTipoAtom.context.conditionallyRunInAction(() {
      super.textErroTipo = value;
      _$textErroTipoAtom.reportChanged();
    }, _$textErroTipoAtom, name: '${_$textErroTipoAtom.name}_set');
  }

  final _$textErroCepAtom =
      Atom(name: '_SignUpCompanyControllerBase.textErroCep');

  @override
  String get textErroCep {
    _$textErroCepAtom.context.enforceReadPolicy(_$textErroCepAtom);
    _$textErroCepAtom.reportObserved();
    return super.textErroCep;
  }

  @override
  set textErroCep(String value) {
    _$textErroCepAtom.context.conditionallyRunInAction(() {
      super.textErroCep = value;
      _$textErroCepAtom.reportChanged();
    }, _$textErroCepAtom, name: '${_$textErroCepAtom.name}_set');
  }

  final _$textErroLogradouroAtom =
      Atom(name: '_SignUpCompanyControllerBase.textErroLogradouro');

  @override
  String get textErroLogradouro {
    _$textErroLogradouroAtom.context
        .enforceReadPolicy(_$textErroLogradouroAtom);
    _$textErroLogradouroAtom.reportObserved();
    return super.textErroLogradouro;
  }

  @override
  set textErroLogradouro(String value) {
    _$textErroLogradouroAtom.context.conditionallyRunInAction(() {
      super.textErroLogradouro = value;
      _$textErroLogradouroAtom.reportChanged();
    }, _$textErroLogradouroAtom, name: '${_$textErroLogradouroAtom.name}_set');
  }

  final _$textErroBairroAtom =
      Atom(name: '_SignUpCompanyControllerBase.textErroBairro');

  @override
  String get textErroBairro {
    _$textErroBairroAtom.context.enforceReadPolicy(_$textErroBairroAtom);
    _$textErroBairroAtom.reportObserved();
    return super.textErroBairro;
  }

  @override
  set textErroBairro(String value) {
    _$textErroBairroAtom.context.conditionallyRunInAction(() {
      super.textErroBairro = value;
      _$textErroBairroAtom.reportChanged();
    }, _$textErroBairroAtom, name: '${_$textErroBairroAtom.name}_set');
  }

  final _$textErroEstadoAtom =
      Atom(name: '_SignUpCompanyControllerBase.textErroEstado');

  @override
  String get textErroEstado {
    _$textErroEstadoAtom.context.enforceReadPolicy(_$textErroEstadoAtom);
    _$textErroEstadoAtom.reportObserved();
    return super.textErroEstado;
  }

  @override
  set textErroEstado(String value) {
    _$textErroEstadoAtom.context.conditionallyRunInAction(() {
      super.textErroEstado = value;
      _$textErroEstadoAtom.reportChanged();
    }, _$textErroEstadoAtom, name: '${_$textErroEstadoAtom.name}_set');
  }

  final _$textErroNumeroAtom =
      Atom(name: '_SignUpCompanyControllerBase.textErroNumero');

  @override
  String get textErroNumero {
    _$textErroNumeroAtom.context.enforceReadPolicy(_$textErroNumeroAtom);
    _$textErroNumeroAtom.reportObserved();
    return super.textErroNumero;
  }

  @override
  set textErroNumero(String value) {
    _$textErroNumeroAtom.context.conditionallyRunInAction(() {
      super.textErroNumero = value;
      _$textErroNumeroAtom.reportChanged();
    }, _$textErroNumeroAtom, name: '${_$textErroNumeroAtom.name}_set');
  }

  final _$textErroComplementoAtom =
      Atom(name: '_SignUpCompanyControllerBase.textErroComplemento');

  @override
  String get textErroComplemento {
    _$textErroComplementoAtom.context
        .enforceReadPolicy(_$textErroComplementoAtom);
    _$textErroComplementoAtom.reportObserved();
    return super.textErroComplemento;
  }

  @override
  set textErroComplemento(String value) {
    _$textErroComplementoAtom.context.conditionallyRunInAction(() {
      super.textErroComplemento = value;
      _$textErroComplementoAtom.reportChanged();
    }, _$textErroComplementoAtom,
        name: '${_$textErroComplementoAtom.name}_set');
  }

  final _$textErroTelefoneAtom =
      Atom(name: '_SignUpCompanyControllerBase.textErroTelefone');

  @override
  String get textErroTelefone {
    _$textErroTelefoneAtom.context.enforceReadPolicy(_$textErroTelefoneAtom);
    _$textErroTelefoneAtom.reportObserved();
    return super.textErroTelefone;
  }

  @override
  set textErroTelefone(String value) {
    _$textErroTelefoneAtom.context.conditionallyRunInAction(() {
      super.textErroTelefone = value;
      _$textErroTelefoneAtom.reportChanged();
    }, _$textErroTelefoneAtom, name: '${_$textErroTelefoneAtom.name}_set');
  }

  final _$textErroEmailAtom =
      Atom(name: '_SignUpCompanyControllerBase.textErroEmail');

  @override
  String get textErroEmail {
    _$textErroEmailAtom.context.enforceReadPolicy(_$textErroEmailAtom);
    _$textErroEmailAtom.reportObserved();
    return super.textErroEmail;
  }

  @override
  set textErroEmail(String value) {
    _$textErroEmailAtom.context.conditionallyRunInAction(() {
      super.textErroEmail = value;
      _$textErroEmailAtom.reportChanged();
    }, _$textErroEmailAtom, name: '${_$textErroEmailAtom.name}_set');
  }

  final _$textErroSiteAtom =
      Atom(name: '_SignUpCompanyControllerBase.textErroSite');

  @override
  String get textErroSite {
    _$textErroSiteAtom.context.enforceReadPolicy(_$textErroSiteAtom);
    _$textErroSiteAtom.reportObserved();
    return super.textErroSite;
  }

  @override
  set textErroSite(String value) {
    _$textErroSiteAtom.context.conditionallyRunInAction(() {
      super.textErroSite = value;
      _$textErroSiteAtom.reportChanged();
    }, _$textErroSiteAtom, name: '${_$textErroSiteAtom.name}_set');
  }

  final _$textErroSubcategoriaAtom =
      Atom(name: '_SignUpCompanyControllerBase.textErroSubcategoria');

  @override
  String get textErroSubcategoria {
    _$textErroSubcategoriaAtom.context
        .enforceReadPolicy(_$textErroSubcategoriaAtom);
    _$textErroSubcategoriaAtom.reportObserved();
    return super.textErroSubcategoria;
  }

  @override
  set textErroSubcategoria(String value) {
    _$textErroSubcategoriaAtom.context.conditionallyRunInAction(() {
      super.textErroSubcategoria = value;
      _$textErroSubcategoriaAtom.reportChanged();
    }, _$textErroSubcategoriaAtom,
        name: '${_$textErroSubcategoriaAtom.name}_set');
  }

  final _$erroNomeUnidadeAtom =
      Atom(name: '_SignUpCompanyControllerBase.erroNomeUnidade');

  @override
  bool get erroNomeUnidade {
    _$erroNomeUnidadeAtom.context.enforceReadPolicy(_$erroNomeUnidadeAtom);
    _$erroNomeUnidadeAtom.reportObserved();
    return super.erroNomeUnidade;
  }

  @override
  set erroNomeUnidade(bool value) {
    _$erroNomeUnidadeAtom.context.conditionallyRunInAction(() {
      super.erroNomeUnidade = value;
      _$erroNomeUnidadeAtom.reportChanged();
    }, _$erroNomeUnidadeAtom, name: '${_$erroNomeUnidadeAtom.name}_set');
  }

  final _$erroTipoAtom = Atom(name: '_SignUpCompanyControllerBase.erroTipo');

  @override
  bool get erroTipo {
    _$erroTipoAtom.context.enforceReadPolicy(_$erroTipoAtom);
    _$erroTipoAtom.reportObserved();
    return super.erroTipo;
  }

  @override
  set erroTipo(bool value) {
    _$erroTipoAtom.context.conditionallyRunInAction(() {
      super.erroTipo = value;
      _$erroTipoAtom.reportChanged();
    }, _$erroTipoAtom, name: '${_$erroTipoAtom.name}_set');
  }

  final _$erroCepAtom = Atom(name: '_SignUpCompanyControllerBase.erroCep');

  @override
  bool get erroCep {
    _$erroCepAtom.context.enforceReadPolicy(_$erroCepAtom);
    _$erroCepAtom.reportObserved();
    return super.erroCep;
  }

  @override
  set erroCep(bool value) {
    _$erroCepAtom.context.conditionallyRunInAction(() {
      super.erroCep = value;
      _$erroCepAtom.reportChanged();
    }, _$erroCepAtom, name: '${_$erroCepAtom.name}_set');
  }

  final _$erroLogradouroAtom =
      Atom(name: '_SignUpCompanyControllerBase.erroLogradouro');

  @override
  bool get erroLogradouro {
    _$erroLogradouroAtom.context.enforceReadPolicy(_$erroLogradouroAtom);
    _$erroLogradouroAtom.reportObserved();
    return super.erroLogradouro;
  }

  @override
  set erroLogradouro(bool value) {
    _$erroLogradouroAtom.context.conditionallyRunInAction(() {
      super.erroLogradouro = value;
      _$erroLogradouroAtom.reportChanged();
    }, _$erroLogradouroAtom, name: '${_$erroLogradouroAtom.name}_set');
  }

  final _$erroBairroAtom =
      Atom(name: '_SignUpCompanyControllerBase.erroBairro');

  @override
  bool get erroBairro {
    _$erroBairroAtom.context.enforceReadPolicy(_$erroBairroAtom);
    _$erroBairroAtom.reportObserved();
    return super.erroBairro;
  }

  @override
  set erroBairro(bool value) {
    _$erroBairroAtom.context.conditionallyRunInAction(() {
      super.erroBairro = value;
      _$erroBairroAtom.reportChanged();
    }, _$erroBairroAtom, name: '${_$erroBairroAtom.name}_set');
  }

  final _$erroEstadoAtom =
      Atom(name: '_SignUpCompanyControllerBase.erroEstado');

  @override
  bool get erroEstado {
    _$erroEstadoAtom.context.enforceReadPolicy(_$erroEstadoAtom);
    _$erroEstadoAtom.reportObserved();
    return super.erroEstado;
  }

  @override
  set erroEstado(bool value) {
    _$erroEstadoAtom.context.conditionallyRunInAction(() {
      super.erroEstado = value;
      _$erroEstadoAtom.reportChanged();
    }, _$erroEstadoAtom, name: '${_$erroEstadoAtom.name}_set');
  }

  final _$erroNumeroAtom =
      Atom(name: '_SignUpCompanyControllerBase.erroNumero');

  @override
  bool get erroNumero {
    _$erroNumeroAtom.context.enforceReadPolicy(_$erroNumeroAtom);
    _$erroNumeroAtom.reportObserved();
    return super.erroNumero;
  }

  @override
  set erroNumero(bool value) {
    _$erroNumeroAtom.context.conditionallyRunInAction(() {
      super.erroNumero = value;
      _$erroNumeroAtom.reportChanged();
    }, _$erroNumeroAtom, name: '${_$erroNumeroAtom.name}_set');
  }

  final _$erroComplementoAtom =
      Atom(name: '_SignUpCompanyControllerBase.erroComplemento');

  @override
  bool get erroComplemento {
    _$erroComplementoAtom.context.enforceReadPolicy(_$erroComplementoAtom);
    _$erroComplementoAtom.reportObserved();
    return super.erroComplemento;
  }

  @override
  set erroComplemento(bool value) {
    _$erroComplementoAtom.context.conditionallyRunInAction(() {
      super.erroComplemento = value;
      _$erroComplementoAtom.reportChanged();
    }, _$erroComplementoAtom, name: '${_$erroComplementoAtom.name}_set');
  }

  final _$erroTelefoneAtom =
      Atom(name: '_SignUpCompanyControllerBase.erroTelefone');

  @override
  bool get erroTelefone {
    _$erroTelefoneAtom.context.enforceReadPolicy(_$erroTelefoneAtom);
    _$erroTelefoneAtom.reportObserved();
    return super.erroTelefone;
  }

  @override
  set erroTelefone(bool value) {
    _$erroTelefoneAtom.context.conditionallyRunInAction(() {
      super.erroTelefone = value;
      _$erroTelefoneAtom.reportChanged();
    }, _$erroTelefoneAtom, name: '${_$erroTelefoneAtom.name}_set');
  }

  final _$erroEmailAtom = Atom(name: '_SignUpCompanyControllerBase.erroEmail');

  @override
  bool get erroEmail {
    _$erroEmailAtom.context.enforceReadPolicy(_$erroEmailAtom);
    _$erroEmailAtom.reportObserved();
    return super.erroEmail;
  }

  @override
  set erroEmail(bool value) {
    _$erroEmailAtom.context.conditionallyRunInAction(() {
      super.erroEmail = value;
      _$erroEmailAtom.reportChanged();
    }, _$erroEmailAtom, name: '${_$erroEmailAtom.name}_set');
  }

  final _$erroSiteAtom = Atom(name: '_SignUpCompanyControllerBase.erroSite');

  @override
  bool get erroSite {
    _$erroSiteAtom.context.enforceReadPolicy(_$erroSiteAtom);
    _$erroSiteAtom.reportObserved();
    return super.erroSite;
  }

  @override
  set erroSite(bool value) {
    _$erroSiteAtom.context.conditionallyRunInAction(() {
      super.erroSite = value;
      _$erroSiteAtom.reportChanged();
    }, _$erroSiteAtom, name: '${_$erroSiteAtom.name}_set');
  }

  final _$erroSubcategoriaAtom =
      Atom(name: '_SignUpCompanyControllerBase.erroSubcategoria');

  @override
  bool get erroSubcategoria {
    _$erroSubcategoriaAtom.context.enforceReadPolicy(_$erroSubcategoriaAtom);
    _$erroSubcategoriaAtom.reportObserved();
    return super.erroSubcategoria;
  }

  @override
  set erroSubcategoria(bool value) {
    _$erroSubcategoriaAtom.context.conditionallyRunInAction(() {
      super.erroSubcategoria = value;
      _$erroSubcategoriaAtom.reportChanged();
    }, _$erroSubcategoriaAtom, name: '${_$erroSubcategoriaAtom.name}_set');
  }

  final _$fetchCepAsyncAction = AsyncAction('fetchCep');

  @override
  Future<dynamic> fetchCep() {
    return _$fetchCepAsyncAction.run(() => super.fetchCep());
  }

  final _$signUpCompanyAsyncAction = AsyncAction('signUpCompany');

  @override
  Future<bool> signUpCompany() {
    return _$signUpCompanyAsyncAction.run(() => super.signUpCompany());
  }

  final _$_SignUpCompanyControllerBaseActionController =
      ActionController(name: '_SignUpCompanyControllerBase');

  @override
  void setNomeUnidade(String value) {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super.setNomeUnidade(value);
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTipo(String value) {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super.setTipo(value);
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCep(String value) {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super.setCep(value);
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLogradouro(String value) {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super.setLogradouro(value);
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBairro(String value) {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super.setBairro(value);
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEstado(String value) {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super.setEstado(value);
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumero(String value) {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super.setNumero(value);
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setComplemento(String value) {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super.setComplemento(value);
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTelefone(String value) {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super.setTelefone(value);
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super.setEmail(value);
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSite(String value) {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super.setSite(value);
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  ObservableList<DropdownMenuItem<String>> generateSubcategoria(String value) {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super.generateSubcategoria(value);
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSubcategoria(String value) {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super.setSubcategoria(value);
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _validateNomeUnidade() {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super._validateNomeUnidade();
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _validateLogradouro() {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super._validateLogradouro();
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _validateBairro() {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super._validateBairro();
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _validateEstado() {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super._validateEstado();
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _validateNumero() {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super._validateNumero();
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _validateComplemento() {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super._validateComplemento();
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _validateTelefone() {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super._validateTelefone();
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _validateEmail() {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super._validateEmail();
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateCep() {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super.validateCep();
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _validateSite() {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super._validateSite();
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateFields(String fbUid, String empID) {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super.validateFields(fbUid, empID);
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _atualizaCadastro(String fbUid, String empId) {
    final _$actionInfo =
        _$_SignUpCompanyControllerBaseActionController.startAction();
    try {
      return super._atualizaCadastro(fbUid, empId);
    } finally {
      _$_SignUpCompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'subcategoriasAux: ${subcategoriasAux.toString()},nomeUnidadeController: ${nomeUnidadeController.toString()},tipoController: ${tipoController.toString()},cepController: ${cepController.toString()},logradouroController: ${logradouroController.toString()},bairroController: ${bairroController.toString()},estadoController: ${estadoController.toString()},numeroController: ${numeroController.toString()},complementoController: ${complementoController.toString()},telefoneController: ${telefoneController.toString()},emailController: ${emailController.toString()},siteController: ${siteController.toString()},cadastro: ${cadastro.toString()},textErroNomeUnidade: ${textErroNomeUnidade.toString()},textErroTipo: ${textErroTipo.toString()},textErroCep: ${textErroCep.toString()},textErroLogradouro: ${textErroLogradouro.toString()},textErroBairro: ${textErroBairro.toString()},textErroEstado: ${textErroEstado.toString()},textErroNumero: ${textErroNumero.toString()},textErroComplemento: ${textErroComplemento.toString()},textErroTelefone: ${textErroTelefone.toString()},textErroEmail: ${textErroEmail.toString()},textErroSite: ${textErroSite.toString()},textErroSubcategoria: ${textErroSubcategoria.toString()},erroNomeUnidade: ${erroNomeUnidade.toString()},erroTipo: ${erroTipo.toString()},erroCep: ${erroCep.toString()},erroLogradouro: ${erroLogradouro.toString()},erroBairro: ${erroBairro.toString()},erroEstado: ${erroEstado.toString()},erroNumero: ${erroNumero.toString()},erroComplemento: ${erroComplemento.toString()},erroTelefone: ${erroTelefone.toString()},erroEmail: ${erroEmail.toString()},erroSite: ${erroSite.toString()},erroSubcategoria: ${erroSubcategoria.toString()},nomeUnidade: ${nomeUnidade.toString()},tipo: ${tipo.toString()},cep: ${cep.toString()},logradouro: ${logradouro.toString()},bairro: ${bairro.toString()},estado: ${estado.toString()},numero: ${numero.toString()},complemento: ${complemento.toString()},telefone: ${telefone.toString()},email: ${email.toString()},site: ${site.toString()},subcategoria: ${subcategoria.toString()},subCategoriaString: ${subCategoriaString.toString()},hasError: ${hasError.toString()}';
    return '{$string}';
  }
}
