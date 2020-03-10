import 'package:ofertas/app/modules/navigation_bar/components/zoom_image/zoom_image_controller.dart';
import 'package:ofertas/app/modules/navigation_bar/components/perfil_empresa/components/nova_empresa/nova_empresa_controller.dart';
import 'package:ofertas/app/modules/navigation_bar/components/perfil_empresa/components/empresa/empresa_controller.dart';
import 'package:ofertas/app/modules/navigation_bar/components/feed/components/ofertas_view/ofertas_view_controller.dart';
import 'package:ofertas/app/modules/navigation_bar/components/oferta_details/oferta_details_controller.dart';
import 'package:ofertas/app/modules/navigation_bar/components/feed/components/empresas_view/empresas_view_controller.dart';
import 'package:ofertas/app/modules/navigation_bar/components/feed/feed_page.dart';
import 'package:ofertas/app/modules/navigation_bar/components/perfil_empresa/perfil_empresa_controller.dart';
import 'package:ofertas/app/modules/navigation_bar/components/feed/feed_controller.dart';
import 'package:ofertas/app/modules/navigation_bar/components/zoom_image/zoom_image_page.dart';
import 'package:ofertas/app/modules/navigation_bar/navigation_bar_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/modules/navigation_bar/navigation_bar_page.dart';
import 'package:ofertas/app/modules/navigation_bar/components/perfil_empresa/perfil_empresa_page.dart';

class NavigationBarModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ZoomImageController()),
        Bind((i) => NovaEmpresaController()),
        Bind((i) => EmpresaController()),
        Bind((i) => OfertasViewController()),
        Bind((i) => OfertaDetailsController()),
        Bind((i) => EmpresasViewController()),
        Bind((i) => PerfilEmpresaController()),
        Bind((i) => FeedController()),
        Bind((i) => NavigationBarController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => NavigationBarPage()),
        Router('/feed', child: (_, args) => FeedPage()),
        Router('/zoom_image', child: (_, args) => ZoomImage(args.data)),
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
