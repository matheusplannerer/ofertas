import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/modules/perfil/perfil_controller.dart';
import 'package:ofertas/app/shared/components/button/button_widget.dart';
import 'package:ofertas/app/shared/models/planos_model.dart';

class PerfilPage extends StatefulWidget {
  final String title;
  const PerfilPage({Key key, this.title = "Perfil"}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  PerfilController controller = Modular.get();
  String plano = " - ";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (controller.appController.userPlano?.plano == AccountPlanos.basico)
      plano = "Básico";
    if (controller.appController.userPlano?.plano == AccountPlanos.pro)
      plano = "Pro";
    if (controller.appController.userPlano?.plano == AccountPlanos.master)
      plano = "Master";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        title: Text("PERFIL"),
        gradient: LinearGradient(
          colors: [
            Colors.orange[900],
            Colors.orange[300],
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
                "Nome: ${controller.appController.userInfos.nome.toUpperCase()}"),
          ),
          Divider(
            thickness: 1.5,
            height: 0.5,
          ),
          ListTile(
            title:
                Text("Contato: ${controller.appController.userInfos.celular}"),
          ),
          Divider(
            thickness: 1.5,
            height: 0.5,
          ),
          ListTile(
            title: Text(
                "E-mail: ${controller.appController.userInfos.email.toLowerCase()}"),
          ),
          Divider(
            thickness: 1.5,
            height: 0.5,
          ),
          ListTile(
            title: Text("Plano: $plano"),
          ),
          Divider(
            thickness: 1.5,
            height: 0.5,
          ),
          ListTile(
            title: Text("Pagamento"),
            subtitle: Text("Minhas formas de pagamento"),
            onTap: () {
              Modular.to.pushNamed('/pagamento');
            },
          ),
          Divider(
            thickness: 1.5,
            height: 0.5,
          ),
          ButtonWidget(
            height: 50,
            margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
            width: MediaQuery.of(context).size.width - 100,
            text: "ASSINE UM PLANO",
            onTap: () async {
              showLoadingDialog(tapDismiss: false);
              await controller.getPlanos();
              hideLoadingDialog();
              Modular.to.pushNamed('/perfil/planos');
            },
          )
        ],
      ),
    );
  }
}
