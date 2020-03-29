import 'package:ofertas/app/modules/cadastro_usuario/cadastro_usuario_module.dart';
import 'package:ofertas/app/modules/feed/feed_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/modules/feed/feed_page.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_module.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_page.dart';

class FeedModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FeedController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => FeedPage()),
        // Router('/empresa',
        //     child: (_, args) => PerfilEmpresaPage(empresaID: args.data)),
        Router('/cadastroUsuario', module: CadastroUsuarioModule()),
      ];

  static Inject get to => Inject<FeedModule>.of();
}
