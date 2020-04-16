import 'package:ofertas/app/modules/feed_filtro/feed_filtro_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/modules/feed_filtro/feed_filtro_page.dart';

class FeedFiltroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FeedFiltroController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => FeedFiltroPage()),
      ];

  static Inject get to => Inject<FeedFiltroModule>.of();
}
