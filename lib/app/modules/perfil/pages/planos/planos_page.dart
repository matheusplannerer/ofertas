import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:ofertas/app/modules/perfil/components/free_plan/free_plan_widget.dart';
import 'package:ofertas/app/modules/perfil/components/master_plan/master_plan_widget.dart';
import 'package:ofertas/app/modules/perfil/components/pro_plan/pro_plan_widget.dart';
import 'package:ofertas/app/modules/perfil/perfil_controller.dart';
import 'package:ofertas/app/shared/models/planos_model.dart';

class PlanosPage extends StatefulWidget {
  final String title;
  const PlanosPage({Key key, this.title = "Planos"}) : super(key: key);

  @override
  _PlanosPageState createState() => _PlanosPageState();
}

class _PlanosPageState extends State<PlanosPage> {
  bool check = false;
  PerfilController perfilController = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        title: Text("ASSINE JÁ"),
        gradient: LinearGradient(
          colors: [
            Colors.orange[900],
            Colors.orange[300],
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10),
          Center(
            child: Text(
              "SELECIONE ABAIXO O PLANO DESEJADO",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Divider(thickness: 5, height: 5),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: FreePlanWidget(
              canChoose: false,
              plano: perfilController.planos['basico'],
            ),
            margin: EdgeInsets.all(15),
          ),
          Divider(thickness: 5, height: 5),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: ProPlanWidget(
              canChoose: perfilController.appController.userPlano.plano ==
                      AccountPlanos.basico
                  ? true
                  : false,
              plano: perfilController.planos['pro'],
            ),
            margin: EdgeInsets.all(15),
          ),
          Divider(thickness: 5, height: 5),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: MasterPlanWidget(
              canChoose: perfilController.appController.userPlano.plano ==
                      AccountPlanos.master
                  ? false
                  : true,
              plano: perfilController.planos['master'],
            ),
            margin: EdgeInsets.all(15),
          ),
        ],
      ),
    );
  }
}
