import 'package:ofertas/app/modules/publicar_ofertas/components/uploader/uploader_controller.dart';
import 'package:ofertas/app/modules/publicar_ofertas/publicar_ofertas_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/modules/publicar_ofertas/publicar_ofertas_page.dart';

class PublicarOfertasModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UploaderController()),
        Bind((i) => PublicarOfertasController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => PublicarOfertasPage()),
      ];

  static Inject get to => Inject<PublicarOfertasModule>.of();
}
