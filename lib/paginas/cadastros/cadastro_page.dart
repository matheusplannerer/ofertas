import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:load/load.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:ofertas/controller/services.dart';
import 'package:ofertas/models/classes_usuarios.dart';
import 'package:ofertas/paginas/cadastros/cadastro_empresa.dart';
import 'package:ofertas/paginas/feed/dashboard.dart';
import 'package:provider/provider.dart';
import 'package:ofertas/global/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CadastroPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CadastroPageState();
  }
}

class _CadastroPageState extends State<CadastroPage> {
  User usuario = User();

  var maskFormatterCelular = MaskTextInputFormatter(
      mask: '###########', filter: {"#": RegExp(r'[0-9]')});

  Services services = Services();

  TextEditingController _nomeCompleto;
  TextEditingController _contato;
  TextEditingController _email;
  TextEditingController _senha;
  TextEditingController _confirmSenha;

  String _textErroValidateNome;
  String _textErroValidateContato;
  String _textErroValidateEmail;
  String _textErroValidateSenha;

  bool _erroValidateNome;
  bool _erroValidateContato;
  bool _erroValidateEmail;
  bool _erroValidateSenha;

  @override
  void initState() {
    // TODO: implement initState
    _erroValidateNome = false;
    _erroValidateContato = false;
    _erroValidateEmail = false;
    _erroValidateSenha = false;
    _nomeCompleto = TextEditingController();
    _contato = TextEditingController();
    _email = TextEditingController();
    _senha = TextEditingController();
    _confirmSenha = TextEditingController();

    super.initState();
  }

  void _validateNomeCompleto(String text) {
    int numeroLetras = text.replaceAll(" ", "").length;
    if (text.contains('0') ||
        text.contains('1') ||
        text.contains('2') ||
        text.contains('3') ||
        text.contains('4') ||
        text.contains('5') ||
        text.contains('6') ||
        text.contains('7') ||
        text.contains('8') ||
        text.contains('9') ||
        text.length <= 2 ||
        numeroLetras <= 2) {
      setState(() {
        _erroValidateNome = true;
        _textErroValidateNome = 'Insira um nome válido';
      });
    } else {
      setState(() {
        _erroValidateNome = false;
        _textErroValidateNome = '';
      });
    }
  }

  void _validateEmailFunc(String text) {
    if (!text.contains("@") || text.length < 5) {
      setState(() {
        _erroValidateEmail = true;
        _textErroValidateEmail = 'Insira um e-mail válido';
      });
    } else {
      setState(() {
        _erroValidateEmail = false;
        _textErroValidateEmail = '';
      });
    }
  }

  void _validateContatoFunc(String text) {
    if (text.length <= 5) {
      setState(() {
        _erroValidateContato = true;
        _textErroValidateContato = 'Insira um contato válido';
      });
    } else {
      setState(() {
        _erroValidateContato = false;
        _textErroValidateContato = '';
      });
    }
  }

  void _validateSenhaFunc(String senha, String confirmSenha) {
    if (senha != confirmSenha) {
      setState(() {
        _erroValidateSenha = true;
        _textErroValidateSenha = 'As senhas não coincidem';
      });
      return;
    }

    if (senha.length < 6) {
      print('SENHA RUIM');
      setState(() {
        _erroValidateSenha = true;
        _textErroValidateSenha = 'Senha muito fraca';
      });
      return;
    }

    setState(() {
      _erroValidateSenha = false;
      _textErroValidateSenha = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<Global>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GradientAppBar(
        title: Text(
          "CADASTRO",
          style: TextStyle(
              fontFamily: "Poppins-Bold",
              color: Colors.white,
              letterSpacing: .6),
        ),
        centerTitle: true,
        gradient: LinearGradient(
          colors: [
            Colors.orange[900],
            Colors.orange[300],
          ],
        ),
      ),
      // body: Container(),
      body: Container(
        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                SizedBox(height: 30),
                TextField(
                  // inputFormatters: [],
                  controller: _nomeCompleto,
                  decoration: InputDecoration(
                    errorText: _erroValidateNome ? _textErroValidateNome : null,
                    labelStyle: TextStyle(color: Colors.black38, fontSize: 15),
                    labelText: 'Nome completo',
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  inputFormatters: [maskFormatterCelular],
                  controller: _contato,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    errorText:
                        _erroValidateContato ? _textErroValidateContato : null,
                    labelStyle: TextStyle(color: Colors.black38, fontSize: 15),
                    labelText: 'Contato',
                    hintText: '(DDD) XXXXX-XXXX',
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    errorText:
                        _erroValidateEmail ? _textErroValidateEmail : null,
                    labelStyle: TextStyle(color: Colors.black38, fontSize: 15),
                    labelText: 'E-mail',
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: _senha,
                  obscureText: true,
                  decoration: InputDecoration(
                    errorText:
                        _erroValidateSenha ? _textErroValidateSenha : null,
                    labelStyle: TextStyle(color: Colors.black38, fontSize: 15),
                    labelText: 'Senha (utilizado para acesso ao app)',
                    hintText: 'Mínimo de 6 caracteres e ao menos 1 número',
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: _confirmSenha,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black38, fontSize: 15),
                    labelText: 'Confirme sua senha',
                    errorText:
                        _erroValidateSenha ? _textErroValidateSenha : null,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  obscureText: true,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width - 60,
                              height: ScreenUtil.getInstance().setHeight(100),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFFF8A65),
                                    Color(0xFFFF5722),
                                    Color(0xFFD84315)
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xFF6078ea).withOpacity(.3),
                                      offset: Offset(0.0, 8.0),
                                      blurRadius: 8.0)
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () async {
                                    // antes era onPressed, não sei se muda algo

                                    _validateNomeCompleto(
                                      _nomeCompleto.text.toUpperCase(),
                                    );
                                    _validateEmailFunc(
                                        _email.text.toLowerCase());
                                    _validateContatoFunc(_contato.text);
                                    _validateSenhaFunc(
                                        _senha.text, _confirmSenha.text);

                                    if (_erroValidateContato ||
                                        _erroValidateEmail ||
                                        _erroValidateNome ||
                                        _erroValidateSenha) {
                                      print('testando');
                                      return;
                                    }

                                    usuario.email =
                                        _email.text.toLowerCase().trim();
                                    usuario.nome =
                                        _nomeCompleto.text.toUpperCase();
                                    usuario.celular = _contato.text;
                                    usuario.senha = _senha.text;

                                    showLoadingDialog(tapDismiss: false);
                                    var fbUser = await services.auth.signUp(
                                        usuario.email, usuario.senha, usuario);

                                    if (fbUser.runtimeType != FirebaseUser) {
                                      //Não cadastrou
                                      hideLoadingDialog();
                                      setState(() {
                                        _erroValidateEmail = true;
                                        _textErroValidateEmail = fbUser;
                                      });
                                      return;
                                    }

                                    global.fbUser = fbUser;
                                    usuario.usuarioID = global.fbUser.uid;

                                    global.usuario = usuario;
                                    await fbUser.sendEmailVerification();
                                    hideLoadingDialog();
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (context) => Dashboard(
                                                  fbUser: global.fbUser,
                                                )));
                                  },
                                  child: Center(
                                    child: Text(
                                      "AVANÇAR",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Poppins-Bold",
                                          fontSize: 18,
                                          letterSpacing: 1.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
