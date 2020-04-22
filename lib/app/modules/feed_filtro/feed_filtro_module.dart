import 'package:ofertas/app/modules/feed_filtro/pages/feed_filtrado/feed_filtrado_controller.dart';
import 'package:ofertas/app/modules/feed_filtro/feed_filtro_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/modules/feed_filtro/feed_filtro_page.dart';
import 'package:ofertas/app/modules/feed_filtro/pages/feed_filtrado/feed_filtrado_page.dart';
import 'package:ofertas/app/modules/perfil_empresa_feed/pages/horarios_feed/horarios_feed_page.dart';
import 'package:ofertas/app/modules/perfil_empresa_feed/perfil_empresa_feed_page.dart';
import 'package:ofertas/app/pages/oferta_details/oferta_details_page.dart';

class FeedFiltroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FeedFiltradoController()),
        Bind((i) => FeedFiltroController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => FeedFiltroPage()),
        Router('/filtro/:id',
            child: (_, args) =>
                FeedFiltradoPage(int.tryParse(args.params['id']))),
        Router('/oferta_details',
            child: (_, args) => OfertaDetailsPage(
                  oferta: args.data['oferta'],
                  fetchPage: args.data['fetchPage'],
                )),
        Router('/empresa/:id',
            child: (_, args) =>
                PerfilEmpresaFeedPage(empresaID: args.params['id'])),
        Router('/empresa/:id/horarios',
            child: (_, args) => HorariosFeedPage(empresa: args.data))
      ];

  static Inject get to => Inject<FeedFiltroModule>.of();
}
