import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/modules/perfil/perfil_controller.dart';
import 'package:ofertas/app/shared/models/planos_admin_model.dart';
import 'package:ofertas/app/shared/models/planos_model.dart';

part 'master_plan_controller.g.dart';

class MasterPlanController = _MasterPlanControllerBase
    with _$MasterPlanController;

abstract class _MasterPlanControllerBase with Store {
  PerfilController perfilController = Modular.get();

  @observable
  bool mensal = true;
  @observable
  bool semestral = false;
  @observable
  bool anual = false;

  @action
  void setMensal(bool value) => mensal = value;
  @action
  void setSemestral(bool value) => semestral = value;
  @action
  void setAnual(bool value) => anual = value;

  @action
  void setPlan(PlanosAdminModel model) {
    double valuePerMonthAux;
    double valueTotalAux;
    int numeroParcelasAux;
    if (mensal) {
      valuePerMonthAux =
          double.tryParse(model.valores['mensal'].toStringAsFixed(2));
      valueTotalAux = valuePerMonthAux * 1;
      numeroParcelasAux = 1;
    }
    if (semestral) {
      valuePerMonthAux =
          double.tryParse(model.valores['semestral'].toStringAsFixed(2));
      valueTotalAux = valuePerMonthAux * 6;
      numeroParcelasAux = 6;
    }
    if (anual) {
      valuePerMonthAux =
          double.tryParse(model.valores['anual'].toStringAsFixed(2));
      valueTotalAux = valuePerMonthAux * 12;
      numeroParcelasAux = 12;
    }

    PlanosModel selectedPlan = PlanosModel(
      plano: model.plano,
      postsLeft: model.numberPosts,
      profileNumberLeft: model.numberProfile,
      valuePerMonth: valuePerMonthAux,
      valueTotal: valueTotalAux,
      numeroParcelas: numeroParcelasAux,
    );
    perfilController.selectPlan = selectedPlan;
  }
}
