import 'package:ofertas/app/modules/feed/components/ofertas_view/ofertas_view_controller.dart';
import 'package:ofertas/app/modules/feed/feed_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/modules/feed/feed_page.dart';
import 'package:ofertas/app/modules/perfil_empresa/pages/horarios/horarios_page.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_module.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_page.dart';
import 'package:ofertas/app/modules/perfil_empresa_feed/pages/horarios_feed/horarios_feed_page.dart';
import 'package:ofertas/app/modules/perfil_empresa_feed/perfil_empresa_feed_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa_feed/perfil_empresa_feed_module.dart';
import 'package:ofertas/app/modules/perfil_empresa_feed/perfil_empresa_feed_page.dart';
import 'package:ofertas/app/pages/oferta_details/oferta_details_controller.dart';
import 'package:ofertas/app/pages/oferta_details/oferta_details_page.dart';

class FeedModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FeedController()),
        Bind((i) => OfertasViewController()),
        Bind((i) => OfertaDetailsController()),
        Bind((i) => PerfilEmpresaFeedController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => FeedPage()),
        Router('/oferta_details',
            child: (_, args) => OfertaDetailsPage(oferta: args.data)),
        Router('/empresa/:id',
            child: (_, args) =>
                PerfilEmpresaFeedPage(empresaID: args.params['id'])),
        Router('/empresa/:id/horarios',
            child: (_, args) => HorariosFeedPage(empresa: args.data))
        // Router('/empresa/:id',
        //     child: (_, args) =>
        //         PerfilEmpresaPage(empresaID: args.params['id'])),
        // Router('/empresa',
        //     child: (_, args) => PerfilEmpresaPage(empresaID: args.data)),
      ];

  static Inject get to => Inject<FeedModule>.of();
}
