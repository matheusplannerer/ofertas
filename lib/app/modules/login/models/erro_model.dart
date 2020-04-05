import 'package:flutter/services.dart';

class ErroLoginModel {
  ErroLoginModel({
    this.erroEmail = false,
    this.erroSenha = false,
    this.erroLogin = false,
    this.textErroEmail = '',
    this.textErroSenha = '',
    this.textErroLogin = '',
  });
  bool erroEmail;
  bool erroSenha;
  bool erroLogin;
  String textErroEmail;
  String textErroSenha;
  String textErroLogin;

  ErroLoginModel copyWith({
    bool erroEmail,
    bool erroSenha,
    bool erroLogin,
    String textErroEmail,
    String textErroSenha,
    String textErroLogin,
  }) {
    return ErroLoginModel(
      erroEmail: erroEmail ?? this.erroEmail,
      erroSenha: erroSenha ?? this.erroSenha,
      erroLogin: erroLogin ?? this.erroLogin,
      textErroEmail: textErroEmail ?? this.textErroEmail,
      textErroSenha: textErroSenha ?? this.textErroSenha,
      textErroLogin: textErroLogin ?? this.textErroLogin,
    );
  }

  ErroLoginModel setErro(PlatformException erro) {
    ErroLoginModel e = ErroLoginModel();
    if (erro.code == "ERROR_USER_NOT_FOUND") {
      e.erroEmail = true;
      e.textErroEmail = "E-mail não cadastrado";
      return e;
    }

    if (erro.code == "ERROR_WRONG_PASSWORD") {
      e.erroSenha = true;
      e.textErroSenha = "Usuário ou senha não encontrados";
      return e;
    }

    if (erro.code is String) {
      e.erroLogin = true;
      e.textErroLogin = "Tente novamente mais tarde";
      return e;
    }

    return e;
  }
}
