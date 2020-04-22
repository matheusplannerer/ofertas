import 'package:ofertas/app/modules/perfil_empresa_feed/components/header_empresa_feed/header_empresa_feed_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa_feed/components/fotos_empresa_feed/fotos_empresa_feed_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa_feed/pages/horarios_feed/horarios_feed_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa_feed/perfil_empresa_feed_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/modules/perfil_empresa_feed/perfil_empresa_feed_page.dart';
import 'package:ofertas/app/pages/oferta_details/oferta_details_page.dart';

class PerfilEmpresaFeedModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HeaderEmpresaFeedController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => PerfilEmpresaFeedPage()),
        Router('/oferta_details',
            child: (_, args) => OfertaDetailsPage(
                  oferta: args.data,
                )),
      ];

  static Inject get to => Inject<PerfilEmpresaFeedModule>.of();
}
