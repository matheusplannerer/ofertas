import 'package:ofertas/app/handler/firebase_notification_handler.dart';
import 'package:ofertas/app/modules/pagamento/pagamento_module.dart';
import 'package:ofertas/app/modules/pagamento/pagamento_page.dart';
import 'package:ofertas/app/modules/perfil/perfil_module.dart';
import 'package:ofertas/app/pages/solicitar_acesso/components/page_two/page_two_controller.dart';
import 'package:ofertas/app/pages/solicitar_acesso/components/page_one/page_one_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa_feed/perfil_empresa_feed_module.dart';
import 'package:ofertas/app/pages/solicitar_acesso/solicitar_acesso_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa/pages/cadastro_empresa/cadastro_empresa_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa/pages/cadastro_empresa/cadastro_empresa_page.dart';
import 'package:ofertas/app/pages/navigation_bar/navigation_bar_controller.dart';
import 'package:ofertas/app/pages/navigation_bar/navigation_bar_page.dart';
import 'package:ofertas/app/pages/solicitar_acesso/solicitar_acesso_page.dart';
import 'package:ofertas/app/pages/splash/splash_controller.dart';
import 'package:ofertas/app/pages/zoom_image/zoom_image_page.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';
import 'package:ofertas/app/pages/splash/splash_page.dart';
import 'package:ofertas/app/modules/publicar_ofertas/publicar_ofertas_module.dart';
import 'package:ofertas/app/shared/components/button/button_controller.dart';
import 'package:ofertas/app/shared/repositories/auth/repositories/auth_repository_firebase.dart';
import 'package:ofertas/app/shared/repositories/auth/repositories/auth_repository_interface.dart';
import 'package:ofertas/app/shared/repositories/fetch_services/fetch_services_controller.dart';
import 'package:ofertas/app/shared/repositories/fetch_services/repositories/fetch_repository_firebase.dart';
import 'package:ofertas/app/shared/repositories/fetch_services/repositories/fetch_repository_interface.dart';
import 'package:ofertas/app/shared/repositories/planos_services/planos_services_controller.dart';
import 'package:ofertas/app/shared/repositories/planos_services/repositories/planos_services_repository.dart';
import 'package:ofertas/app/shared/repositories/planos_services/repositories/planos_services_repository_interface.dart';
import 'package:ofertas/app/shared/repositories/routes/route_controller.dart';
import 'package:ofertas/app/shared/repositories/sign_up_company/repositories/signup_company_repository.dart';
import 'package:ofertas/app/shared/repositories/sign_up_company/repositories/signup_company_repository_interface.dart';
import 'package:ofertas/app/shared/repositories/sign_up_company/signup_company_controller.dart';
import 'package:ofertas/app/shared/repositories/sign_up_user/repositories/signup_user_repository.dart';
import 'package:ofertas/app/shared/repositories/sign_up_user/repositories/signup_user_repository_interface.dart';
import 'package:ofertas/app/shared/repositories/sign_up_user/signup_user_controller.dart';
import 'package:ofertas/app/shared/services/feed_service.dart';
import 'package:ofertas/app/modules/login/login_module.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:ofertas/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PageTwoController()),
        Bind((i) => PageOneController()),
        Bind((i) => AuthController()),
        Bind<IAuthRepository>((i) => FirebaseAuthRepo()),
        Bind<IFetchRepository>((i) => FirebaseFetchRepository()),
        Bind((i) => AppController()),
        Bind((i) => FetchServicesController()),
        Bind((i) => PerfilEmpresaController()),

        Bind((i) => SolicitarAcessoController()),
        Bind((i) => SplashController()),
        Bind((i) => ButtonController()),
        Bind((i) => FeedService()),
        Bind((i) => GlobalService()),
        //
        Bind((i) => FirebaseNotificationHandler()),

        Bind((i) => CadastroEmpresaController()),
        Bind((i) => SignUpController()),
        Bind((i) => RouteController()),
        Bind((i) => NavigationBarController()),
        Bind((i) => SignUpCompanyController()),
        Bind((i) => PlanosRepositoryController()),
        Bind<IPlanosRepository>((i) => PlanosRepository()),
        Bind<ISignUpCompanyRepository>((i) => SignUpCompanyRepository()),
        Bind<ISignUpRepository>((i) => SignUpRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/pagamento', module: PagamentoModule()),
        Router(Modular.initialRoute, child: (_, args) => SplashPage()),
        Router('/home', child: (_, args) => NavigationBarPage()),
        Router('/login', module: LoginModule()),
        Router('/perfil', module: PerfilModule()),
        Router('/empresa', module: PerfilEmpresaFeedModule()),
        Router('/cadastrar_empresa', child: (_, args) => CadastroEmpresaPage()),
        Router('/solicitar_acesso', child: (_, args) => SolicitarAcessoPage()),
        Router('/zoom_image', child: (_, args) => ZoomImage(args.data)),
        Router('/publicarOfertas', module: PublicarOfertasModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
