import 'package:ofertas/app/modules/perfil_empresa/components/fotos_empresa/fotos_empresa_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa/components/header_empresa/header_empresa_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa/pages/cadastro_empresa/cadastro_empresa_page.dart';
import 'package:ofertas/app/modules/perfil_empresa/pages/horarios/horarios_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa/pages/horarios/horarios_page.dart';
import 'package:ofertas/app/modules/perfil_empresa/pages/nova_empresa/nova_empresa_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa/pages/nova_empresa/nova_empresa_page.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_page.dart';
import 'package:ofertas/app/pages/oferta_details/oferta_details_page.dart';

class PerfilEmpresaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HeaderEmpresaController()),
        Bind((i) => NovaEmpresaController()),
        Bind((i) => HorariosController()),
        Bind((i) => PerfilEmpresaController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => PerfilEmpresaPage()),
        Router('/oferta_details',
            child: (_, args) => OfertaDetailsPage(oferta: args.data)),
        Router('/horarios',
            child: (_, args) => HorariosPage(empresa: args.data)),
        Router('/nova_empresa', child: (_, args) => NovaEmpresaPage()),
      ];

  static Inject get to => Inject<PerfilEmpresaModule>.of();
}
