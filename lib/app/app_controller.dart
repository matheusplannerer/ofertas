import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';

part 'app_controller.g.dart';

class AppController = _AppBase with _$AppController;

abstract class _AppBase with Store {
  @observable
  FirebaseUser _authInfos;
  @observable
  UserModel _userInfos;

  @computed
  FirebaseUser get authInfos => _authInfos;
  @computed
  UserModel get userInfos => _userInfos;
  @computed
  bool get signedIn => userInfos != null && authInfos != null ? true : false;
  @computed
  bool get hasCompany => _userInfos?.empresaPerfil != null ? true : false;

  @action
  void setAuth(FirebaseUser value) => _authInfos = value;
  @action
  void setUser(UserModel model) => _userInfos = model;

  @action
  void signIn(FirebaseUser _authInfos, UserModel _userInfos) {
    setAuth(_authInfos);
    setUser(_userInfos);
  }

  @action
  void signOut() {
    AuthController controller = Modular.get();
    controller.signOut();
    setAuth(null);
    setUser(null);
  }
}
