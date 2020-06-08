import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/modules/perfil/perfil_controller.dart';
import 'package:ofertas/app/shared/models/cupom_model.dart';
import 'package:ofertas/app/shared/repositories/planos_services/planos_services_controller.dart';

part 'resumo_plano_controller.g.dart';

class ResumoPlanoController = _ResumoPlanoControllerBase
    with _$ResumoPlanoController;

abstract class _ResumoPlanoControllerBase with Store {
  PerfilController perfilController = Modular.get();
  AppController appController = Modular.get();
  PlanosRepositoryController planosController = Modular.get();

  @computed
  bool get hasDesconto => desconto == 0 ? false : true;

  @observable
  bool isBoleto = true;

  @observable
  double desconto = 0;

  @observable
  String cupomText;

  @observable
  bool erroDesconto = false;

  @observable
  String erroTextString = "Cupom inserido inválido ou indisponível";

  @action
  void setCupom(String value) => cupomText = value;

  @action
  Future applyCupom() async {
    erroDesconto = false;
    try {
      var data = await planosController.applyCupom(
          cupomText, perfilController.selectPlan);
      perfilController.selectPlan = data[0];
      desconto = data[1];
    } catch (e) {
      if (e.code == "CUPOM_DONT_EXIST") erroDesconto = true;
    }
  }

  @action
  Future setPlano() async {
    try {
      Timestamp hoje = Timestamp.now();
      perfilController.selectPlan.hireDate = hoje;
      perfilController.selectPlan.endDate = Timestamp.fromDate(hoje
          .toDate()
          .add(
              Duration(days: 31 * perfilController.selectPlan.numeroParcelas)));
      perfilController.selectPlan.id = "plano_padrao";
      await planosController.setPlano(
          perfilController.selectPlan, appController.authInfos);
      planosController.updateLocalPlano(perfilController.selectPlan);
      Modular.to.popUntil(ModalRoute.withName('/perfil'));
    } catch (e) {
      print(e);
    }
  }
}
