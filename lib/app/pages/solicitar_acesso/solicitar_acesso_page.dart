import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/pages/solicitar_acesso/solicitar_acesso_controller.dart';

class SolicitarAcessoPage extends StatefulWidget {
  final String title;
  const SolicitarAcessoPage({Key key, this.title = "SolicitarAcesso"})
      : super(key: key);

  @override
  _SolicitarAcessoPageState createState() => _SolicitarAcessoPageState();
}

class _SolicitarAcessoPageState
    extends ModularState<SolicitarAcessoPage, SolicitarAcessoController> {
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
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Preencha os dados abaixo para contato",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 12),
                Observer(
                  builder: (_) {
                    return TextField(
                      decoration: InputDecoration(
                          labelText: "Nome completo",
                          errorText: controller.erroNome
                              ? controller.textErroNome
                              : null),
                      onChanged: controller.setNome,
                    );
                  },
                ),
                SizedBox(height: 8),
                Observer(
                  builder: (_) {
                    return TextField(
                      decoration: InputDecoration(
                          labelText: "Whatsapp ou telefone para contato",
                          errorText: controller.erroContato
                              ? controller.textErroContato
                              : null),
                      onChanged: controller.setContato,
                    );
                  },
                ),
                SizedBox(height: 8),
                Observer(
                  builder: (_) {
                    return TextField(
                      decoration: InputDecoration(
                          labelText: "E-mail",
                          errorText: controller.erroEmail
                              ? controller.textErroEmail
                              : null),
                      onChanged: controller.setEmail,
                    );
                  },
                ),
                SizedBox(height: 8),
                Observer(
                  builder: (_) {
                    return TextField(
                      decoration: InputDecoration(
                          labelText: "Nome da empresa",
                          errorText: controller.erroEmpresa
                              ? controller.textErroEmpresa
                              : null),
                      onChanged: controller.setEmpresa,
                    );
                  },
                ),
                SizedBox(height: 15),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 100,
                  child: RaisedButton(
                    color: Colors.orange,
                    onPressed: () async {
                      controller.validateFields();
                      if (controller.hasError) return;
                      showLoadingDialog(tapDismiss: false);
                      await controller.sendRequest();
                      hideLoadingDialog();
                      Modular.to.pop();
                    },
                    child: Text(
                      "SOLICITAR CONVITE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
