import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/pages/solicitar_acesso/solicitar_acesso_controller.dart';
import 'package:ofertas/app/shared/components/button/button_widget.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PageTwoWidget extends StatelessWidget {
  final SolicitarAcessoController controller;
  PageTwoWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: "Nome da empresa",
                          errorText: controller.erroEmpresa
                              ? controller.textErroEmpresa
                              : null),
                      onChanged: controller.setEmpresa,
                    );
                  },
                ),
                SizedBox(height: 50),
                ButtonWidget(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 100,
                  onTap: () async {
                    controller.validateFields();
                    if (controller.hasError) return;
                    showLoadingDialog(tapDismiss: false);
                    try {
                      await controller.sendRequest();
                      hideLoadingDialog();
                      await Alert(
                        type: AlertType.success,
                        title: "Solicitação enviada com sucesso",
                        context: context,
                      ).show();
                      Modular.to.pop();
                    } catch (e) {
                      hideLoadingDialog();
                      print("ERRO!");
                      if (e.code == "EMAIL_ALREADY_REGISTERED") {
                        await Alert(
                          type: AlertType.info,
                          title: "EMAIL JÁ CADASTRADO",
                          context: context,
                        ).show();
                      }
                      await Alert(
                        type: AlertType.error,
                        title: "Verifique sua conexão e tente novamente",
                        context: context,
                      ).show();
                    }
                  },
                  text: "SOLICITAR CONVITE",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
