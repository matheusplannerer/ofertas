import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/modules/feed/feed_module.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_module.dart';
import 'package:ofertas/app/pages/splash/splash_controller.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';
import 'package:ofertas/app/shared/repositories/routes/route_controller.dart';

part 'app_controller.g.dart';

class AppController = _AppBase with _$AppController;

abstract class _AppBase with Store {
  AuthController _auth = Modular.get();
  RouteController _route = Modular.get();

  List<RouterOutlet> pages = [];

  _AppBase() {
    pages = [
      RouterOutlet(
        module: FeedModule(),
        keepAlive: true,
        initialRoute: '/',
        navigatorKey: _route.keyTab1,
      ),
      RouterOutlet(
        module: PerfilEmpresaModule(),
        keepAlive: true,
        navigatorKey: _route.keyTab2,
        initialRoute: '/',
      ),
    ];
  }

  @observable
  FirebaseUser _authInfos;
  @observable
  UserModel _userInfos;

  @computed
  FirebaseUser get authInfos => _auth.authInfos;
  @computed
  UserModel get userInfos => _auth.userInfos;
  @computed
  bool get signedIn => userInfos != null && authInfos != null ? true : false;
  @computed
  bool get hasCompany => userInfos?.empresaPerfil != null ? true : false;
  @computed
  AuthStatus get status => _auth.status;

  @action
  void setAuth(FirebaseUser value) => _authInfos = value;
  @action
  void setUser(UserModel model) => _userInfos = model;

  @action
  Future signOut() async {
    await _auth.signOut();
  }
}
