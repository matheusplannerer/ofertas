import 'package:ofertas/app/modules/feed/components/empresas_view/empresas_view_controller.dart';
import 'package:ofertas/app/modules/feed/components/ofertas_view/ofertas_view_controller.dart';
import 'package:ofertas/app/modules/feed/feed_controller.dart';
import 'package:ofertas/app/modules/feed/feed_page.dart';
import 'package:ofertas/app/modules/navigation_bar/navigation_bar_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/modules/navigation_bar/navigation_bar_page.dart';
import 'package:ofertas/app/modules/perfil_empresa/pages/horarios/horarios_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa/pages/oferta_details/oferta_details_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa/pages/zoom_image/zoom_image_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa/pages/zoom_image/zoom_image_page.dart';

class NavigationBarModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HorariosController()),
        Bind((i) => ZoomImageController()),
        Bind((i) => OfertasViewController()),
        Bind((i) => OfertaDetailsController()),
        Bind((i) => EmpresasViewController()),
        Bind((i) => FeedController()),
        Bind((i) => NavigationBarController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => NavigationBarPage(usuario: args.data)),
        // Router('/feed', child: (_, args) => FeedPage()),
        // Router('/zoom_image', child: (_, args) => ZoomImage(args.data)),
        // Router('/feed', child: (_, args) => FeedPage()),
        // Router(
        //   '/perfilEmpresa/:id',
        //   child: (_, args) => PerfilEmpresaPage(
        //     empresaID: args.params['id'],
        //   ),
        // ),
      ];

  static Inject get to => Inject<NavigationBarModule>.of();
}
