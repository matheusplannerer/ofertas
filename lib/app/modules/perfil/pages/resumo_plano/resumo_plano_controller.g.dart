// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resumo_plano_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResumoPlanoController on _ResumoPlanoControllerBase, Store {
  Computed<bool> _$hasDescontoComputed;

  @override
  bool get hasDesconto =>
      (_$hasDescontoComputed ??= Computed<bool>(() => super.hasDesconto)).value;

  final _$isBoletoAtom = Atom(name: '_ResumoPlanoControllerBase.isBoleto');

  @override
  bool get isBoleto {
    _$isBoletoAtom.context.enforceReadPolicy(_$isBoletoAtom);
    _$isBoletoAtom.reportObserved();
    return super.isBoleto;
  }

  @override
  set isBoleto(bool value) {
    _$isBoletoAtom.context.conditionallyRunInAction(() {
      super.isBoleto = value;
      _$isBoletoAtom.reportChanged();
    }, _$isBoletoAtom, name: '${_$isBoletoAtom.name}_set');
  }

  final _$descontoAtom = Atom(name: '_ResumoPlanoControllerBase.desconto');

  @override
  double get desconto {
    _$descontoAtom.context.enforceReadPolicy(_$descontoAtom);
    _$descontoAtom.reportObserved();
    return super.desconto;
  }

  @override
  set desconto(double value) {
    _$descontoAtom.context.conditionallyRunInAction(() {
      super.desconto = value;
      _$descontoAtom.reportChanged();
    }, _$descontoAtom, name: '${_$descontoAtom.name}_set');
  }

  final _$cupomTextAtom = Atom(name: '_ResumoPlanoControllerBase.cupomText');

  @override
  String get cupomText {
    _$cupomTextAtom.context.enforceReadPolicy(_$cupomTextAtom);
    _$cupomTextAtom.reportObserved();
    return super.cupomText;
  }

  @override
  set cupomText(String value) {
    _$cupomTextAtom.context.conditionallyRunInAction(() {
      super.cupomText = value;
      _$cupomTextAtom.reportChanged();
    }, _$cupomTextAtom, name: '${_$cupomTextAtom.name}_set');
  }

  final _$erroDescontoAtom =
      Atom(name: '_ResumoPlanoControllerBase.erroDesconto');

  @override
  bool get erroDesconto {
    _$erroDescontoAtom.context.enforceReadPolicy(_$erroDescontoAtom);
    _$erroDescontoAtom.reportObserved();
    return super.erroDesconto;
  }

  @override
  set erroDesconto(bool value) {
    _$erroDescontoAtom.context.conditionallyRunInAction(() {
      super.erroDesconto = value;
      _$erroDescontoAtom.reportChanged();
    }, _$erroDescontoAtom, name: '${_$erroDescontoAtom.name}_set');
  }

  final _$erroTextStringAtom =
      Atom(name: '_ResumoPlanoControllerBase.erroTextString');

  @override
  String get erroTextString {
    _$erroTextStringAtom.context.enforceReadPolicy(_$erroTextStringAtom);
    _$erroTextStringAtom.reportObserved();
    return super.erroTextString;
  }

  @override
  set erroTextString(String value) {
    _$erroTextStringAtom.context.conditionallyRunInAction(() {
      super.erroTextString = value;
      _$erroTextStringAtom.reportChanged();
    }, _$erroTextStringAtom, name: '${_$erroTextStringAtom.name}_set');
  }

  final _$applyCupomAsyncAction = AsyncAction('applyCupom');

  @override
  Future<dynamic> applyCupom() {
    return _$applyCupomAsyncAction.run(() => super.applyCupom());
  }

  final _$setPlanoAsyncAction = AsyncAction('setPlano');

  @override
  Future<dynamic> setPlano() {
    return _$setPlanoAsyncAction.run(() => super.setPlano());
  }

  final _$_ResumoPlanoControllerBaseActionController =
      ActionController(name: '_ResumoPlanoControllerBase');

  @override
  void setCupom(String value) {
    final _$actionInfo =
        _$_ResumoPlanoControllerBaseActionController.startAction();
    try {
      return super.setCupom(value);
    } finally {
      _$_ResumoPlanoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isBoleto: ${isBoleto.toString()},desconto: ${desconto.toString()},cupomText: ${cupomText.toString()},erroDesconto: ${erroDesconto.toString()},erroTextString: ${erroTextString.toString()},hasDesconto: ${hasDesconto.toString()}';
    return '{$string}';
  }
}
