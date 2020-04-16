import 'package:ofertas/app/modules/login/pages/inserir_codigo/inserir_codigo_controller.dart';
import 'package:ofertas/app/modules/login/pages/inserir_codigo/inserir_codigo_page.dart';
import 'package:ofertas/app/modules/login/pages/cadastro_usuario/cadastro_usuario_controller.dart';
import 'package:ofertas/app/modules/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/modules/login/login_page.dart';
import 'package:ofertas/app/modules/login/pages/cadastro_usuario/cadastro_usuario_page.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => InserirCodigoController()),
        Bind((i) => CadastroUsuarioController()),
        Bind((i) => LoginController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => LoginPage()),
        Router('/cadastrar_usuario', child: (_, args) => CadastroUsuarioPage()),
        Router('/verificar_id', child: (_, args) => InserirCodigoPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
