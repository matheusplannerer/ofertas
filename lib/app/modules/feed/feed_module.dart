import 'package:ofertas/app/modules/feed/components/ofertas_view/ofertas_view_controller.dart';
import 'package:ofertas/app/modules/feed/feed_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/modules/feed/feed_page.dart';
import 'package:ofertas/app/modules/perfil_empresa/pages/horarios/horarios_page.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_page.dart';
import 'package:ofertas/app/pages/oferta_details/oferta_details_controller.dart';
import 'package:ofertas/app/pages/oferta_details/oferta_details_page.dart';

class FeedModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FeedController()),
        Bind((i) => OfertasViewController()),
        Bind((i) => OfertaDetailsController()),
        Bind((i) => PerfilEmpresaController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => FeedPage()),
        Router('/oferta_details',
            child: (_, args) => OfertaDetailsPage(oferta: args.data)),
        Router('/horarios',
            child: (_, args) => HorariosPage(empresa: args.data)),
        Router('/empresa/:id',
            child: (_, args) =>
                PerfilEmpresaPage(empresaID: args.params['id'])),
        // Router('/empresa',
        //     child: (_, args) => PerfilEmpresaPage(empresaID: args.data)),
      ];

  static Inject get to => Inject<FeedModule>.of();
}
