import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/modules/perfil_empresa/pages/nova_empresa/nova_empresa_controller.dart';
import 'package:ofertas/app/shared/components/button/button_widget.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class NovaEmpresaPage extends StatefulWidget {
  final String title;
  const NovaEmpresaPage({Key key, this.title = "NovaEmpresa"})
      : super(key: key);

  @override
  _NovaEmpresaPageState createState() => _NovaEmpresaPageState();
}

class _NovaEmpresaPageState
    extends ModularState<NovaEmpresaPage, NovaEmpresaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        gradient: LinearGradient(
          colors: [
            Colors.orange[900],
            Colors.orange[300],
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Center(
            child: ButtonWidget(
              height: 50,
              width: MediaQuery.of(context).size.width - 60,
              onTap: () {
                print(controller.appController.authInfos.isEmailVerified);
                if (controller.appController.authInfos.isEmailVerified)
                  Modular.navigatorKey.currentState
                      .pushNamed('/cadastrar_empresa');
                else {
                  var alertStyle = AlertStyle(
                    titleStyle:
                        TextStyle(color: Colors.grey[500], fontSize: 20),
                  );
                  Alert(
                    style: alertStyle,
                    context: controller
                        .routeController.actualNavigator.currentState.context,
                    title: "Confirmação de dados",
                    closeFunction: () {},
                    content: Text(
                      "Antes de continuar, pedimos para que confirme o e-mail cadastrado",
                      style: TextStyle(color: Colors.black26, fontSize: 18),
                      textAlign: TextAlign.justify,
                    ),
                    type: AlertType.error,
                    buttons: [
                      DialogButton(
                        child: Text(
                          "REENVIAR E-MAIL",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        color: Colors.orange,
                        height: 60,
                        onPressed: () async {
                          showLoadingDialog(tapDismiss: false);
                          await controller.appController.authInfos
                              .sendEmailVerification();
                          hideLoadingDialog();
                        },
                      ),
                    ],
                  ).show();
                }
              },
              text: "NOVA EMPRESA",
            ),
          ),
        ],
      ),
    );
  }
}
