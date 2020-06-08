import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/modules/perfil_empresa/pages/nova_empresa/nova_empresa_controller.dart';
import 'package:ofertas/app/shared/components/button/button_widget.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:ofertas/app/shared/repositories/routes/route_controller.dart';
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
                RouteController route = Modular.get();
                route.actualNavigator.currentState
                    .pushNamed('/cadastrar_empresa');
              },
              text: "NOVA EMPRESA",
            ),
          ),
        ],
      ),
    );
  }
}
