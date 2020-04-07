// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concluir_publicacao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConcluirPublicacaoController on _ConcluirPublicacaoBase, Store {
  final _$taskAtom = Atom(name: '_ConcluirPublicacaoBase.task');

  @override
  StorageUploadTask get task {
    _$taskAtom.context.enforceReadPolicy(_$taskAtom);
    _$taskAtom.reportObserved();
    return super.task;
  }

  @override
  set task(StorageUploadTask value) {
    _$taskAtom.context.conditionallyRunInAction(() {
      super.task = value;
      _$taskAtom.reportChanged();
    }, _$taskAtom, name: '${_$taskAtom.name}_set');
  }

  final _$valueAtom = Atom(name: '_ConcluirPublicacaoBase.value');

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

  final _$startUploadAsyncAction = AsyncAction('startUpload');

  @override
  Future<StorageUploadTask> startUpload({File file, String base64}) {
    return _$startUploadAsyncAction
        .run(() => super.startUpload(file: file, base64: base64));
  }

  final _$uploadOfertaAsyncAction = AsyncAction('uploadOferta');

  @override
  Future<dynamic> uploadOferta(OfertaModel oferta) {
    return _$uploadOfertaAsyncAction.run(() => super.uploadOferta(oferta));
  }

  final _$_ConcluirPublicacaoBaseActionController =
      ActionController(name: '_ConcluirPublicacaoBase');

  @override
  void increment() {
    final _$actionInfo =
        _$_ConcluirPublicacaoBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_ConcluirPublicacaoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'task: ${task.toString()},value: ${value.toString()}';
    return '{$string}';
  }
}
