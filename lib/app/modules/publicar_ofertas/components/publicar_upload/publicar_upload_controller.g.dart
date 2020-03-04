// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publicar_upload_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PublicarUploadController on _PublicarUploadBase, Store {
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

  final _$valueAtom = Atom(name: '_PublicarUploadBase.value');

  @override
  int get value {
    _$valueAtom.context.enforceReadPolicy(_$valueAtom);
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.context.conditionallyRunInAction(() {
      super.value = value;
      _$valueAtom.reportChanged();
    }, _$valueAtom, name: '${_$valueAtom.name}_set');
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
  void increment() {
    final _$actionInfo = _$_PublicarUploadBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_PublicarUploadBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'imgFile: ${imgFile.toString()},value: ${value.toString()}';
    return '{$string}';
  }
}
