import 'package:ofertas/app/modules/cadastro_empresa/cadastro_empresa_module.dart';
import 'package:ofertas/app/modules/publicar_ofertas/publicar_ofertas_module.dart';
import 'package:ofertas/app/shared/components/button/button_controller.dart';
import 'package:ofertas/app/modules/cadastro_usuario/cadastro_usuario_module.dart';
import 'package:ofertas/app/shared/services/feed_service.dart';
import 'package:ofertas/app/modules/login/login_module.dart';
import 'package:ofertas/app/modules/navigation_bar/navigation_bar_module.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:ofertas/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ButtonController()),
        Bind((i) => FeedService()),
        Bind((i) => GlobalService()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: NavigationBarModule()),
        // Router('/feed', module: FeedModule()),
        Router('/login', module: LoginModule()),
        Router('/cadastroUsuario', module: CadastroUsuarioModule()),
        Router('/cadastroEmpresa', module: CadastroEmpresaModule()),
        Router('/publicarOfertas', module: PublicarOfertasModule()),
        // Router('/empresaPerfil', module: PerfilEmpresaModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
