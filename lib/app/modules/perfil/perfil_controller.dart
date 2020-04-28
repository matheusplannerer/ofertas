import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/shared/models/planos_admin_model.dart';
import 'package:ofertas/app/shared/models/planos_model.dart';
import 'package:ofertas/app/shared/repositories/planos_services/repositories/planos_services_repository.dart';

part 'perfil_controller.g.dart';

class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {
  AppController appController = Modular.get();
  PlanosRepository planosRepo = Modular.get();

  _PerfilControllerBase() {
    print("TESTE");
  }

  @observable
  PlanosModel selectPlan = PlanosModel();

  Map<String, PlanosAdminModel> planos;

  Future<Map<String, PlanosAdminModel>> getPlanos() async {
    try {
      planos = await planosRepo.getPlanos();
      appController.setPlanos(planos);
      return planos;
    } catch (e) {
      print(e);
      return e;
    }
  }
}
