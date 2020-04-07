import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';
import 'package:ofertas/app/shared/repositories/sign_up_company/signup_company_controller.dart';

part 'cadastro_empresa_controller.g.dart';

class CadastroEmpresaController = _CadastroEmpresaBase
    with _$CadastroEmpresaController;

abstract class _CadastroEmpresaBase with Store {
//Mascaras
  var maskCep = MaskTextInputFormatter(
      filter: {"#": RegExp(r'[0-9]')}, mask: "#####-###");

  var maskTelefone = MaskTextInputFormatter(
      filter: {"#": RegExp(r'[0-9]')}, mask: "###########");

  SignUpCompanyController signUpCompanyController = SignUpCompanyController();
  AuthController authController = Modular.get();
  AppController appController = Modular.get();

  _CadastroEmpresaBase();

  @action
  void setNomeUnidade(String value) {
    signUpCompanyController.setNomeUnidade(value);
  }

  @action
  void setTipo(String value) {
    signUpCompanyController.setTipo(value);
  }

  @action
  void setCep(String value) {
    signUpCompanyController.setCep(value);
  }

  @action
  void setLogradouro(String value) {
    signUpCompanyController.setLogradouro(value);
  }

  @action
  void setBairro(String value) {
    signUpCompanyController.setBairro(value);
  }

  @action
  void setEstado(String value) {
    signUpCompanyController.setEstado(value);
  }

  @action
  void setNumero(String value) {
    signUpCompanyController.setNumero(value);
  }

  @action
  void setComplemento(String value) {
    signUpCompanyController.setComplemento(value);
  }

  @action
  void setTelefone(String value) {
    signUpCompanyController.setTelefone(value);
  }

  @action
  void setEmail(String value) {
    signUpCompanyController.setEmail(value);
  }

  @action
  void setSite(String value) {
    signUpCompanyController.setSite(value);
  }

  @action
  void validateAll(String fbUid, String empID) {
    //Setters
    setBairro(signUpCompanyController.bairroController.text
        .toUpperCase()
        .trimRight()
        .trimLeft());
    setCep(signUpCompanyController.cepController.text);
    setComplemento(signUpCompanyController.complementoController.text
        .toUpperCase()
        .trimRight()
        .trimLeft());
    setEmail(signUpCompanyController.emailController.text
        .toLowerCase()
        .trimRight()
        .trimLeft());
    setEstado(signUpCompanyController.estadoController.text.toUpperCase());
    setLogradouro(signUpCompanyController.logradouroController.text
        .toUpperCase()
        .trimLeft()
        .trimRight());
    setNomeUnidade(signUpCompanyController.nomeUnidadeController.text
        .toUpperCase()
        .trimLeft()
        .trimRight());
    setNumero(
        signUpCompanyController.numeroController.text.trimRight().trimLeft());
    setSite(signUpCompanyController.siteController.text
        .toLowerCase()
        .trimRight()
        .trimLeft());
    setTelefone(signUpCompanyController.telefoneController.text);
    //Validators
    signUpCompanyController.validateFields(fbUid, empID);
  }
}
