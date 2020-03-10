import 'package:ofertas/app/modules/publicar_ofertas/components/concluir_publicacao/concluir_publicacao_page.dart';
import 'package:ofertas/app/modules/publicar_ofertas/components/publicar_cartaz/publicar_cartaz_controller.dart';
import 'package:ofertas/app/modules/publicar_ofertas/components/publicar_cartaz/publicar_cartaz_page.dart';
import 'package:ofertas/app/modules/publicar_ofertas/components/publicar_upload/publicar_upload_controller.dart';
import 'package:ofertas/app/modules/publicar_ofertas/components/publicar_upload/publicar_upload_page.dart';
import 'package:ofertas/app/modules/publicar_ofertas/components/uploader/uploader_controller.dart';
import 'package:ofertas/app/modules/publicar_ofertas/publicar_ofertas_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/modules/publicar_ofertas/publicar_ofertas_page.dart';

class PublicarOfertasModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PublicarCartazController()),
        Bind((i) => PublicarUploadController()),
        Bind((i) => UploaderController()),
        Bind((i) => PublicarOfertasController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/:id',
          child: (_, args) => PublicarOfertasPage(
            empresaID: args.params['id'],
          ),
        ),
        Router(
          '/publicar_upload',
          child: (_, args) => PublicarUploadPage(),
        ),
        Router(
          '/publicar_cartaz',
          child: (_, args) => PublicarCartazPage(),
        ),
        Router(
          '/concluir_oferta/:tipo',
          child: (_, args) => ConcluirPublicacaoPage(
              oferta: args.data['oferta'],
              empresaID: args.data['id'],
              tipo: args.params['tipo']),
        ),
      ];

  static Inject get to => Inject<PublicarOfertasModule>.of();
}
