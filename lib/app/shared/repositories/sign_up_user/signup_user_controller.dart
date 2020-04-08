import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';
import 'package:ofertas/app/shared/repositories/sign_up_user/repositories/signup_user_repository_interface.dart';
part 'signup_user_controller.g.dart';

class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  ISignUpRepository _signUpRepository = Modular.get();

  @action
  Future<FirebaseUser> createUserWithEmailAndPassword(UserModel model) async {
    try {
      var _authInfos = await _signUpRepository.createUserWithEmailAndPassword(
          model.email, model.senha);
      return _authInfos.user;
    } catch (e) {
      return throw e;
    }
  }

  @action
  Future createUserCollection(UserModel model) async {
    try {
      await _signUpRepository.createUserCollection(model);
    } catch (e) {
      return throw e;
    }
  }
}
