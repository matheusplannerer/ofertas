import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:load/load.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:ofertas/app/modules/cadastro_usuario/cadastro_usuario_controller.dart';
import 'package:ofertas/app/modules/cadastro_usuario/services/auth_service.dart';
import 'package:ofertas/app/shared/components/button/button_widget.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:provider/provider.dart';

class CadastroUsuarioPage extends StatefulWidget {
  final String title;
  const CadastroUsuarioPage({Key key, this.title = "CadastroUsuario"})
      : super(key: key);

  @override
  _CadastroUsuarioPageState createState() => _CadastroUsuarioPageState();
}

class _CadastroUsuarioPageState extends State<CadastroUsuarioPage> {
  var _cadastroController = CadastroUsuarioController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        // title: Text(titulo),
        gradient: LinearGradient(
          colors: [
            Colors.orange[900],
            Colors.orange[300],
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: ListView(
          children: <Widget>[
            Observer(
              builder: (_) {
                return Column(
                  children: [
                    SizedBox(height: 30),
                    TextField(
                      // inputFormatters: [],
                      decoration: InputDecoration(
                        errorText: _cadastroController.erroNome
                            ? _cadastroController.textErroValidateNome
                            : null,
                        labelStyle:
                            TextStyle(color: Colors.black38, fontSize: 15),
                        labelText: 'Nome completo',
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(),
                        ),
                      ),
                      onChanged: _cadastroController.setNome,
                    ),
                    SizedBox(height: 15),
                    TextField(
                      inputFormatters: [
                        _cadastroController.maskFormatterCelular
                      ],
                      onChanged: _cadastroController.setContato,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        errorText: _cadastroController.erroContato
                            ? _cadastroController.textErroValidateContato
                            : null,
                        labelStyle:
                            TextStyle(color: Colors.black38, fontSize: 15),
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
                      onChanged: _cadastroController.setEmail,
                      decoration: InputDecoration(
                        errorText: _cadastroController.erroEmail
                            ? _cadastroController.textErroValidateEmail
                            : null,
                        labelStyle:
                            TextStyle(color: Colors.black38, fontSize: 15),
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
                      obscureText: true,
                      onChanged: _cadastroController.setSenha,
                      decoration: InputDecoration(
                        errorText: _cadastroController.erroSenha
                            ? _cadastroController.textErroValidateSenha
                            : null,
                        labelStyle:
                            TextStyle(color: Colors.black38, fontSize: 15),
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
                      onChanged: _cadastroController.setConfirmaSenha,
                      decoration: InputDecoration(
                        labelStyle:
                            TextStyle(color: Colors.black38, fontSize: 15),
                        labelText: 'Confirme sua senha',
                        errorText: _cadastroController.erroSenha
                            ? _cadastroController.textErroValidateSenha
                            : null,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(),
                        ),
                      ),
                      obscureText: true,
                    ),
                    ButtonWidget(
                      onTap: () async {
                        // antes era onPressed, não sei se muda algo

                        _cadastroController.validateFields();

                        if (_cadastroController.hasError) return;

                        _cadastroController.atualizaContato();

                        showLoadingDialog(tapDismiss: false);
                        var _service = AuthService();
                        var fbUser =
                            await _service.signUp(_cadastroController.usuario);
                        hideLoadingDialog();
                        //Deu bom
                        var global = Provider.of<GlobalService>(context);
                        if (fbUser is FirebaseUser) {
                          global.signIn(
                              fire: fbUser, user: _cadastroController.usuario);
                          fbUser.sendEmailVerification();
                          Navigator.of(context).pushReplacementNamed('/');
                          return;
                        }

                        //Gera um erro
                        if (fbUser is String) {
                          _cadastroController.setErroCadastro(fbUser);
                          return;
                        }
                      },
                      height: 60,
                      width: MediaQuery.of(context).size.width - 60,
                      text: "AVANÇAR",
                      margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    ),
                    Observer(
                      builder: (_) {
                        if (_cadastroController.erroCadastro != null)
                          return Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Text(_cadastroController.erroCadastro),
                          );

                        return Container();
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
