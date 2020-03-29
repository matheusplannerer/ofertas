import 'package:dio/dio.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';
import 'package:ofertas/app/pages/splash/splash_page.dart';
import 'package:ofertas/app/shared/repositories/auth/repositories/auth_repository.dart';
import 'package:ofertas/app/shared/repositories/auth/repositories/auth_repository_interface.dart';
import 'package:ofertas/app/modules/cadastro_empresa/cadastro_empresa_module.dart';
import 'package:ofertas/app/modules/publicar_ofertas/publicar_ofertas_module.dart';
import 'package:ofertas/app/shared/components/button/button_controller.dart';
import 'package:ofertas/app/modules/cadastro_usuario/cadastro_usuario_module.dart';
import 'package:ofertas/app/shared/repositories/routes/route_controller.dart';
import 'package:ofertas/app/shared/repositories/sign_up_company/repositories/signup_company_repository.dart';
import 'package:ofertas/app/shared/repositories/sign_up_company/repositories/signup_company_repository_interface.dart';
import 'package:ofertas/app/shared/repositories/sign_up_company/signup_company_controller.dart';
import 'package:ofertas/app/shared/repositories/sign_up_user/repositories/signup_user_repository.dart';
import 'package:ofertas/app/shared/repositories/sign_up_user/repositories/signup_user_repository_interface.dart';
import 'package:ofertas/app/shared/repositories/sign_up_user/signup_user_controller.dart';
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
        Bind((i) => AuthController()),
        Bind((i) => ButtonController()),
        Bind((i) => FeedService()),
        Bind((i) => GlobalService()),
        Bind((i) => AppController()),
        //
        Bind((i) => SignUpController()),
        Bind((i) => RouteController()),
        Bind((i) => AuthController()),
        Bind((i) => SignUpCompanyController()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind<ISignUpCompanyRepository>((i) => SignUpCompanyRepository()),
        Bind<ISignUpRepository>((i) => SignUpRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashPage()),
        Router('/home', module: NavigationBarModule()),
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
