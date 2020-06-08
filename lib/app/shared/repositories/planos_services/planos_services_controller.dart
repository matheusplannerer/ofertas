import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/models/planos_admin_model.dart';
import 'package:ofertas/app/shared/models/planos_model.dart';
import 'package:ofertas/app/shared/repositories/planos_services/repositories/planos_services_repository_interface.dart';
part 'planos_services_controller.g.dart';

class PlanosRepositoryController = _PlanosRepositoryControllerBase
    with _$PlanosRepositoryController;

abstract class _PlanosRepositoryControllerBase with Store {
  IPlanosRepository _planosRepo = Modular.get();

  @observable
  PlanosModel _plano;
  @computed
  PlanosModel get plano => _plano;

  @action
  void updateLocalPlano(PlanosModel value) => _plano = value;

  @action
  Future<Map<String, PlanosAdminModel>> getPlanos() async {
    try {
      var planos = await _planosRepo.getPlanos();
      return planos;
    } catch (e) {
      print(e);
      return throw e;
    }
  }

  @action
  Future<Map<int, dynamic>> applyCupom(
      String cupom, PlanosModel actualPlan) async {
    try {
      var result = await _planosRepo.applyCupom(cupom, actualPlan);
      return result;
    } catch (e) {
      return throw e;
    }
  }

  @action
  Future setPlano(PlanosModel plano, FirebaseUser user) async {
    try {
      await _planosRepo.setPlano(plano, user);
    } catch (e) {
      return throw e;
    }
  }

  @action
  Future updatePlano(PlanosModel plano, FirebaseUser user) async {
    try {
      await _planosRepo.updatePlano(plano, user);
    } catch (e) {
      return throw e;
    }
  }
}
