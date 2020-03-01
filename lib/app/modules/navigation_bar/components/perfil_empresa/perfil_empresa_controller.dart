import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'perfil_empresa_controller.g.dart';

class PerfilEmpresaController = _PerfilEmpresaBase
    with _$PerfilEmpresaController;

abstract class _PerfilEmpresaBase with Store {
  bool fetched(AsyncSnapshot<DocumentSnapshot> doc) {
    if (doc.connectionState == ConnectionState.done && doc.data.data != null)
      return true;
    else
      return false;
  }

  bool isFetching(AsyncSnapshot<DocumentSnapshot> doc) {
    if (doc.connectionState == ConnectionState.waiting)
      return true;
    else
      return false;
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
