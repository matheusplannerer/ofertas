import 'package:ofertas/app/modules/cadastro_usuario/services/auth_service.dart';
import 'package:ofertas/app/modules/cadastro_usuario/cadastro_usuario_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/modules/cadastro_usuario/cadastro_usuario_page.dart';

class CadastroUsuarioModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthService()),
        Bind((i) => CadastroUsuarioController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => CadastroUsuarioPage()),
      ];

  static Inject get to => Inject<CadastroUsuarioModule>.of();
}
