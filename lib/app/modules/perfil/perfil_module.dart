import 'package:ofertas/app/modules/perfil/pages/cartao/cartao_controller.dart';
import 'package:ofertas/app/modules/perfil/pages/boleto/boleto_controller.dart';
import 'package:ofertas/app/modules/perfil/pages/resumo_plano/resumo_plano_controller.dart';
import 'package:ofertas/app/modules/perfil/components/master_plan/master_plan_controller.dart';
import 'package:ofertas/app/modules/perfil/components/pro_plan/pro_plan_controller.dart';
import 'package:ofertas/app/modules/perfil/components/free_plan/free_plan_controller.dart';
import 'package:ofertas/app/modules/perfil/pages/planos/planos_controller.dart';
import 'package:ofertas/app/modules/perfil/pages/planos/planos_page.dart';
import 'package:ofertas/app/modules/perfil/pages/resumo_plano/resumo_plano_page.dart';
import 'package:ofertas/app/modules/perfil/perfil_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/modules/perfil/perfil_page.dart';

class PerfilModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CartaoController()),
        Bind((i) => BoletoController()),
        Bind((i) => ResumoPlanoController()),
        Bind((i) => MasterPlanController()),
        Bind((i) => ProPlanController()),
        Bind((i) => FreePlanController()),
        Bind((i) => PlanosController()),
        Bind((i) => PerfilController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => PerfilPage()),
        Router('/planos', child: (_, args) => PlanosPage()),
        Router('/resumo', child: (_, args) => ResumoPlanoPage()),
      ];

  static Inject get to => Inject<PerfilModule>.of();
}
