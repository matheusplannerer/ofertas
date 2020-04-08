import 'package:flutter/services.dart';
import 'package:ofertas/app/modules/login/models/erro_login_model.dart';

class ErroCadastroModel {
  ErroCadastroModel(
      {this.erroContato,
      this.erroEmail,
      this.erroNome,
      this.erroSenha,
      this.textErroContato,
      this.textErroEmail,
      this.textErroNome,
      this.textErroSenha});

  bool erroNome = false;
  bool erroContato = false;
  bool erroEmail = false;
  bool erroSenha = false;

  String textErroNome = '';
  String textErroContato = '';
  String textErroEmail = '';
  String textErroSenha = '';

  ErroCadastroModel copyWith(
      {bool erroNome,
      bool erroContato,
      bool erroEmail,
      bool erroSenha,
      String textErroNome,
      String textErroContato,
      String textErroSenha,
      String textErroEmail}) {
    return new ErroCadastroModel(
      erroContato: erroContato ?? this.erroContato,
      erroEmail: erroEmail ?? this.erroEmail,
      erroNome: erroNome ?? this.erroNome,
      erroSenha: erroSenha ?? this.erroSenha,
      textErroContato: textErroContato ?? this.textErroContato,
      textErroEmail: textErroEmail ?? this.textErroEmail,
      textErroNome: textErroNome ?? this.textErroNome,
      textErroSenha: textErroSenha ?? this.textErroSenha,
    );
  }

  ErroCadastroModel setErro(PlatformException erro) {
    ErroCadastroModel e = ErroCadastroModel();
    if (erro.code == "ERROR_WEAK_PASSWORD") {
      e.erroSenha = true;
      e.textErroSenha = 'Senha fraca';
      return e;
    }

    if (erro.code == "ERROR_INVALID_EMAIL") {
      e.erroEmail = true;
      e.textErroEmail = "E-mail inválido";
      return e;
    }

    if (erro.code == "ERROR_EMAIL_ALREADY_IN_USE") {
      e.erroEmail = true;
      e.textErroEmail = "E-mail já está em uso";
      return e;
    }
    return this;
  }

  factory ErroCadastroModel.fromJson(Map<String, dynamic> json) {
    return ErroCadastroModel(
        //field: json[''],
        );
  }

  Map<String, dynamic> toJson() => {};
}
