import 'package:ofertas/app/modules/perfil_empresa/pages/nova_empresa/nova_empresa_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa/pages/nova_empresa/nova_empresa_page.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_page.dart';

class PerfilEmpresaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => NovaEmpresaController()),
        Bind((i) => PerfilEmpresaController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/empresa/:id',
          child: (_, args) {
            return PerfilEmpresaPage(
              empresaID: args.params['id'],
            );
          },
        ),
        Router('/nova_empresa', child: (_, args) => NovaEmpresaPage()),
      ];

  static Inject get to => Inject<PerfilEmpresaModule>.of();
}
