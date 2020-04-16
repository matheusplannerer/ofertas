import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/modules/login/pages/inserir_codigo/inserir_codigo_controller.dart';
import 'package:ofertas/app/shared/components/button/button_widget.dart';

class InserirCodigoPage extends StatefulWidget {
  final String title;
  const InserirCodigoPage({Key key, this.title = "InserirCodigo"})
      : super(key: key);

  @override
  _InserirCodigoPageState createState() => _InserirCodigoPageState();
}

class _InserirCodigoPageState extends State<InserirCodigoPage> {
  InserirCodigoController controller = Modular.get();

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
      body: Observer(
        builder: (_) {
          return Container(
            margin: EdgeInsets.all(15),
            child: ListView(
              children: <Widget>[
                Text(
                  "Insira o código de verificação para concluir seu cadastro",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                    errorText:
                        controller.erroEmail ? controller.textErroEmail : null,
                    labelStyle: TextStyle(color: Colors.black38, fontSize: 15),
                    labelText: 'E-mail cadastrado',
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  onChanged: controller.setEmail,
                ),
                SizedBox(height: 15),
                TextField(
                  onChanged: controller.setVerificationId,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    errorText: controller.erroId ? controller.textErroId : null,
                    labelStyle: TextStyle(color: Colors.black38, fontSize: 15),
                    labelText: 'ID de verificação',
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                ButtonWidget(
                  height: 40,
                  text: "AVANÇAR",
                  onTap: () async {
                    controller.validateEmail();
                    if (controller.hasError) return;
                    showLoadingDialog(tapDismiss: false);
                    await controller.validateId();
                    hideLoadingDialog();
                    if (controller.hasError) return;
                    Modular.to.popAndPushNamed('/login/cadastrar_usuario');
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
