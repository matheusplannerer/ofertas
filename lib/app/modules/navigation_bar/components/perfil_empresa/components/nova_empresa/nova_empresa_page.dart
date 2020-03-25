import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/shared/components/button/button_widget.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class NovaEmpresaPage extends StatefulWidget {
  final String title;
  const NovaEmpresaPage({Key key, this.title = "NovaEmpresa"})
      : super(key: key);

  @override
  _NovaEmpresaPageState createState() => _NovaEmpresaPageState();
}

class _NovaEmpresaPageState extends State<NovaEmpresaPage> {
  @override
  Widget build(BuildContext context) {
    var global = Provider.of<GlobalService>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Center(
          child: ButtonWidget(
            height: 50,
            width: MediaQuery.of(context).size.width - 60,
            onTap: () {
              if (global.fbUser.isEmailVerified)
                Modular.navigatorKey.currentState.pushNamed('/cadastroEmpresa');
              else {
                var alertStyle = AlertStyle(
                  titleStyle: TextStyle(color: Colors.grey[500], fontSize: 20),
                );
                Alert(
                  style: alertStyle,
                  context: global.actualNavigator.currentState.context,
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
                        await global.fbUser.sendEmailVerification();
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
    );
  }
}
