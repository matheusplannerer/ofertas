import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/modules/login/login_controller.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login", this.navigatorKey})
      : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
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

    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      appBar: GradientAppBar(
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {
            controller.appController.setPages([
              controller.appController.feed,
              controller.appController.feedFiltro
            ]);
            Modular.to.pushReplacementNamed('/home');
          },
        ),
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
          Observer(
            builder: (_) {
              return SingleChildScrollView(
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
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 16.0),
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
                                onChanged: controller.setEmail,
                                decoration: InputDecoration(
                                  hintText: "E-mail",
                                  errorText: controller.erro.erroEmail
                                      ? controller.erro.textErroEmail
                                      : null,
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12.0),
                                ),
                              ),
                              SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(30)),
                              Text(
                                "Senha",
                                style: TextStyle(
                                  fontFamily: "Poppins-Medium",
                                  fontSize: ScreenUtil.getInstance().setSp(36),
                                ),
                              ),
                              TextFormField(
                                onChanged: controller.setPass,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Senha",
                                  errorText: controller.erro.erroSenha
                                      ? controller.erro.textErroSenha
                                      : null,
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12.0),
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(35),
                              ),
                              if (controller.erro.erroLogin)
                                Text(
                                  controller.erro.textErroLogin,
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
                                                    Modular.navigatorKey
                                                        .currentState
                                                        .pop();
                                                  },
                                                ),
                                                FlatButton(
                                                  child: Text("RECUPERAR"),
                                                  onPressed: () async {
                                                    if (_email.text.length >
                                                        5) {
                                                      showLoadingDialog();
                                                      await FirebaseAuth
                                                          .instance
                                                          .sendPasswordResetEmail(
                                                              email: controller
                                                                  .email);
                                                      hideLoadingDialog();
                                                      Modular.navigatorKey
                                                          .currentState
                                                          .pop(true);
                                                    }
                                                  },
                                                ),
                                              ],
                                            );
                                          });
                                      if (recuperou ??= false) {
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
                                    controller.validateFields();
                                    if (controller.hasError) return;
                                    showLoadingDialog(tapDismiss: false);
                                    await controller.signInWithEmailAndPass();
                                    hideLoadingDialog();
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
                            onPressed: () async {
                              showLoadingDialog();
                              await controller.signInGoogle();
                              hideLoadingDialog();
                            },
                            backgroundColor: Colors.blueGrey[700],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Possui um código de acesso? ",
                            style: TextStyle(fontFamily: "Poppins-Medium"),
                          ),
                          InkWell(
                            onTap: () {
                              Modular.navigatorKey.currentState
                                  .pushNamed('/login/verificar_id');
                            },
                            child: Text(
                              "Finalize seu cadastro!",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Novo usuário? ",
                            style: TextStyle(fontFamily: "Poppins-Medium"),
                          ),
                          InkWell(
                            onTap: () {
                              Modular.navigatorKey.currentState
                                  .pushNamed('/solicitar_acesso');
                            },
                            child: Text(
                              "Solicitar acesso!",
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
              );
            },
          )
        ],
      ),
    );
  }
}
