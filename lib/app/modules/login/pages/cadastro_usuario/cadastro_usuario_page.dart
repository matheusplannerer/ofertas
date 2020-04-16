import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:load/load.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:ofertas/app/modules/login/pages/cadastro_usuario/cadastro_usuario_controller.dart';
import 'package:ofertas/app/shared/components/button/button_widget.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';

class CadastroUsuarioPage extends StatefulWidget {
  final String title;
  const CadastroUsuarioPage({Key key, this.title = "CadastroUsuario"})
      : super(key: key);

  @override
  _CadastroUsuarioPageState createState() => _CadastroUsuarioPageState();
}

class _CadastroUsuarioPageState
    extends ModularState<CadastroUsuarioPage, CadastroUsuarioController> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.setEmail(controller.inserirCodigoController.email);
  }

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
                      decoration: InputDecoration(
                        errorText: controller.erro.erroNome
                            ? controller.erro.textErroNome
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
                      onChanged: controller.setNome,
                    ),
                    SizedBox(height: 15),
                    TextField(
                      inputFormatters: [controller.maskFormatterCelular],
                      onChanged: controller.setContato,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        errorText: controller.erro.erroContato
                            ? controller.erro.textErroContato
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
                      onChanged: controller.setEmail,
                      decoration: InputDecoration(
                        errorText: controller.erro.erroEmail
                            ? controller.erro.textErroEmail
                            : null,
                        labelStyle:
                            TextStyle(color: Colors.black38, fontSize: 15),
                        hintText: controller.inserirCodigoController.email,
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
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
                      onChanged: controller.setSenha,
                      decoration: InputDecoration(
                        errorText: controller.erro.erroSenha
                            ? controller.erro.textErroSenha
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
                      onChanged: controller.setConfirmaSenha,
                      decoration: InputDecoration(
                        labelStyle:
                            TextStyle(color: Colors.black38, fontSize: 15),
                        labelText: 'Confirme sua senha',
                        errorText: controller.erro.erroSenha
                            ? controller.erro.textErroSenha
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
                        controller.validateFields();
                        if (controller.hasError) return;
                        showLoadingDialog(tapDismiss: false);
                        await controller.signUp();
                        hideLoadingDialog();
                      },
                      height: 60,
                      width: MediaQuery.of(context).size.width - 60,
                      text: "AVANÇAR",
                      margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
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
