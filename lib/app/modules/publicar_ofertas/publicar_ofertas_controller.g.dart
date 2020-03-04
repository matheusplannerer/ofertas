// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publicar_ofertas_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PublicarOfertasController on _PublicarOfertasBase, Store {
  final _$imgFileAtom = Atom(name: '_PublicarOfertasBase.imgFile');

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

  final _$bs64CartazAtom = Atom(name: '_PublicarOfertasBase.bs64Cartaz');

  @override
  String get bs64Cartaz {
    _$bs64CartazAtom.context.enforceReadPolicy(_$bs64CartazAtom);
    _$bs64CartazAtom.reportObserved();
    return super.bs64Cartaz;
  }

  @override
  set bs64Cartaz(String value) {
    _$bs64CartazAtom.context.conditionallyRunInAction(() {
      super.bs64Cartaz = value;
      _$bs64CartazAtom.reportChanged();
    }, _$bs64CartazAtom, name: '${_$bs64CartazAtom.name}_set');
  }

  final _$pageIndexAtom = Atom(name: '_PublicarOfertasBase.pageIndex');

  @override
  int get pageIndex {
    _$pageIndexAtom.context.enforceReadPolicy(_$pageIndexAtom);
    _$pageIndexAtom.reportObserved();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.context.conditionallyRunInAction(() {
      super.pageIndex = value;
      _$pageIndexAtom.reportChanged();
    }, _$pageIndexAtom, name: '${_$pageIndexAtom.name}_set');
  }

  final _$getImageAsyncAction = AsyncAction('getImage');

  @override
  Future<dynamic> getImage(int value, Size device) {
    return _$getImageAsyncAction.run(() => super.getImage(value, device));
  }

  final _$_PublicarOfertasBaseActionController =
      ActionController(name: '_PublicarOfertasBase');

  @override
  void setPageIndex(int value) {
    final _$actionInfo = _$_PublicarOfertasBaseActionController.startAction();
    try {
      return super.setPageIndex(value);
    } finally {
      _$_PublicarOfertasBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'imgFile: ${imgFile.toString()},bs64Cartaz: ${bs64Cartaz.toString()},pageIndex: ${pageIndex.toString()}';
    return '{$string}';
  }
}
