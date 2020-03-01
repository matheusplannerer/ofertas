import 'package:ofertas/app/modules/login/services/login_service.dart';
import 'package:ofertas/app/modules/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/modules/login/login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginService()),
        Bind((i) => LoginController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
