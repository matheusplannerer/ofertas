import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:ofertas/controller/services.dart';
import 'package:ofertas/models/icones_customizados.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ofertas/paginas/cadastros/cadastro_page.dart';
import 'package:ofertas/paginas/feed/dashboard.dart';
import 'package:ofertas/paginas/login/SocialIcons.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import '../../global/global.dart';
import 'package:load/load.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Entrar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Entrar();
  }
}

class _Entrar extends State<Entrar> {
  TextEditingController email;
  TextEditingController senha;

  bool _erroEmail = false;
  bool _erroSenha = false;

  String _textErroEmail = '';
  String _textErroSenha = '';

  void _validateEmail(String email) {
    if (email.contains(" ") || !email.contains("@") || email.length < 5) {
      setState(() {
        _erroEmail = true;
        _textErroEmail = "Insira um e-mail válido";
      });
      return;
    }

    setState(() {
      _erroEmail = false;
      _textErroEmail = "";
    });
  }

  void _validateSenha([e]) {
    if (senha.text.length < 6) {
      setState(() {
        _erroSenha = true;
        _textErroSenha = "Senha inválida";
      });
      return;
    }

    setState(() {
      _erroSenha = false;
      _textErroSenha = '';
    });
  }

  dynamic fbUser;

  bool _errorMsg = false;
  bool _isSelected = false;

  String _errorMsgText = '';

  @override
  void initState() {
    // TODO: implement initState
    email = TextEditingController();
    senha = TextEditingController();
    super.initState();
  }

  final Services services = Services();

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);

    var global = Provider.of<Global>(context);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      appBar: GradientAppBar(
        title: Text(
          "LOGIN",
          style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(45),
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
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Image.asset("assets/mogi.png", height: 170),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 40.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(270),
                  ),
                  Container(
                    width: double.infinity,
                    height: ScreenUtil.getInstance().setHeight(600),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, 15.0),
                            blurRadius: 15.0),
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, -10.0),
                            blurRadius: 10.0),
                      ],
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Text("Login",
                          //     style: TextStyle(
                          //         fontSize: ScreenUtil.getInstance().setSp(45),
                          //         fontFamily: "Poppins-Bold",
                          //         letterSpacing: .6)),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(30),
                          ),
                          Text(
                            "E-mail",
                            style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(36),
                            ),
                          ),
                          TextField(
                            controller: email,
                            decoration: InputDecoration(
                              hintText: "E-mail",
                              errorText: _erroEmail ? _textErroEmail : null,
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                          ),
                          SizedBox(
                              height: ScreenUtil.getInstance().setHeight(30)),
                          Text(
                            "Senha",
                            style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(36),
                            ),
                          ),
                          TextFormField(
                            controller: senha,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Senha",
                              errorText: _erroSenha ? _textErroSenha : null,
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(35),
                          ),
                          if (_errorMsg)
                            Text(
                              _errorMsgText,
                              style: TextStyle(color: Colors.red),
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () async {
                                  TextEditingController _email =
                                      TextEditingController();
                                  var recuperou = await showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                              "Insira o e-mail de recuperação"),
                                          content: TextField(
                                            controller: _email,
                                            decoration: InputDecoration(
                                              labelText: "EMAIL",
                                            ),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text("CANCELAR"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            FlatButton(
                                              child: Text("RECUPERAR"),
                                              onPressed: () async {
                                                showLoadingDialog();
                                                await Services()
                                                    .auth
                                                    .recoveryPassword(
                                                        email.text);
                                                hideLoadingDialog();
                                                Navigator.of(context).pop(true);
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                  if (recuperou) {
                                    Scaffold.of(context).showSnackBar(
                                      SnackBar(
                                        duration: Duration(seconds: 3),
                                        content: Text(
                                            "E-mail de recuperação enviado com sucesso"),
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  "Esqueceu a senha?",
                                  style: TextStyle(
                                    color: Colors.orangeAccent,
                                    fontFamily: "Poppins-Medium",
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(28),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[],
                      ),
                      InkWell(
                        child: Container(
                          width: ScreenUtil.getInstance().setWidth(600),
                          height: ScreenUtil.getInstance().setHeight(100),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFFF8A65),
                                Color(0xFFFF5722),
                                Color(0xFFD84315)
                              ],
                            ),
                            borderRadius: BorderRadius.circular(6.0),
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
                                _validateEmail(email.text.toLowerCase());
                                _validateSenha();
                                if (!_erroEmail && !_erroSenha) {
                                  showLoadingDialog();
                                  fbUser = await services.auth
                                      .login(email.text, senha.text);

                                  if (fbUser.runtimeType == FirebaseUser) {
                                    //Logou com sucesso
                                    global.fbUser = fbUser;
                                    global.isEmpresa = true;
                                    var usuario = await services.firestore
                                        .getUsuario(fbUser);
                                    global.usuario = usuario;
                                    if (global.usuario.empresaPerfil != null &&
                                        global.usuario.empresaPerfil != '')
                                      global.empresaLogada = await services
                                          .firestore
                                          .getEmpresaLogada(global.usuario);
                                    else
                                      global.empresaLogada = null;
                                    hideLoadingDialog();
                                    print("LOGADO");
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (context) => Dashboard(
                                                  empresaLogada:
                                                      global.empresaLogada,
                                                  fbUser: global.fbUser,
                                                  user: global.usuario,
                                                ))); //Ver certinho qual a página inicial
                                  } else {
                                    hideLoadingDialog();

                                    _errorMsgText = fbUser;
                                    setState(() {
                                      _errorMsg = true;
                                    });
                                  }
                                }
                              },
                              child: Center(
                                child: Text(
                                  "ENTRAR",
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
                  SizedBox(height: ScreenUtil.getInstance().setHeight(25)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      horizontalLine(),
                      Text(
                        "Ou",
                        style: TextStyle(
                            fontSize: 16.0, fontFamily: "Poppins-Medium"),
                      ),
                      horizontalLine()
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SignInButtonBuilder(
                        text: 'Cadastre com Google',
                        icon: FontAwesomeIcons.google,
                        mini: true,
                        onPressed: () {},
                        backgroundColor: Colors.blueGrey[700],
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(15),
                      ),
                      SignInButtonBuilder(
                        text: 'Cadastre com Facebook',
                        icon: FontAwesomeIcons.facebookF,
                        mini: true,
                        onPressed: () {},
                        backgroundColor: Colors.blue[800],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Novo usuário? ",
                        style: TextStyle(fontFamily: "Poppins-Medium"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CadastroPage()));
                        },
                        child: Text(
                          "Cadastre-se",
                          style: TextStyle(
                              color: Colors.orangeAccent,
                              fontFamily: "Poppins-Bold"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
