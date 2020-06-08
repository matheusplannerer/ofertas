import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/modules/perfil/pages/resumo_plano/resumo_plano_controller.dart';
import 'package:ofertas/app/modules/perfil/perfil_controller.dart';
import 'package:ofertas/app/shared/components/button/button_widget.dart';

class ResumoPlanoPage extends StatefulWidget {
  final String title;
  const ResumoPlanoPage({Key key, this.title = "ResumoPlano"})
      : super(key: key);

  @override
  _ResumoPlanoPageState createState() => _ResumoPlanoPageState();
}

class _ResumoPlanoPageState extends State<ResumoPlanoPage> {
  ResumoPlanoController controller = ResumoPlanoController();
  double value;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    value = controller.perfilController.selectPlan.valueTotal;
  }

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
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Divider(
              thickness: 1.5,
              height: 0.5,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    "CUPOM: ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Observer(
                  builder: (_) {
                    return Expanded(
                      flex: 2,
                      child: TextField(
                        onChanged: controller.setCupom,
                        decoration: InputDecoration(
                          hintText: "INSIRA UM CUPOM",
                          errorText: controller.erroDesconto
                              ? controller.erroTextString
                              : null,
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      if (controller.hasDesconto) return;
                      showLoadingDialog(tapDismiss: false);
                      await controller.applyCupom();
                      hideLoadingDialog();
                    },
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1.5,
              height: 0.5,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Subtotal",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "R\$${value.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Observer(
              builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Desconto",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "R\$${controller.desconto.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: !controller.hasDesconto
                            ? Colors.grey
                            : Colors.green,
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 20),
            Observer(
              builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Total",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "${controller.perfilController.selectPlan.numeroParcelas}x R\$${controller.perfilController.selectPlan.valuePerMonth.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: controller.hasDesconto
                            ? Colors.green
                            : Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                      ),
                    ),
                  ],
                );
              },
            ),
            Divider(
              thickness: 1.5,
              height: 1.5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Forma de pagamento",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        controller.isBoleto = true;
                      },
                      child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        width: 90,
                        height: 90,
                        child: Observer(
                          builder: (_) {
                            return Stack(
                              overflow: Overflow.visible,
                              children: [
                                Image.asset(
                                  'assets/boleto_icon.png',
                                  fit: BoxFit.fill,
                                ),
                                Positioned(
                                  child: controller.isBoleto
                                      ? Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        )
                                      : Container(),
                                  top: 0,
                                  left: 0,
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 40),
                    GestureDetector(
                      onTap: () {
                        controller.isBoleto = false;
                      },
                      child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        width: 90,
                        height: 90,
                        child: Observer(
                          builder: (_) {
                            return Stack(
                              overflow: Overflow.visible,
                              children: [
                                Image.asset(
                                  'assets/card_icon.png',
                                  fit: BoxFit.fill,
                                ),
                                Positioned(
                                  child: !controller.isBoleto
                                      ? Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        )
                                      : Container(),
                                  top: 0,
                                  left: 0,
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 50),
            ButtonWidget(
              height: 40,
              text: "PROSSEGUIR",
              width: MediaQuery.of(context).size.width * 0.6,
              onTap: () async {
                showLoadingDialog();
                await Future.delayed(
                    Duration(seconds: 1)); //finge que concluiu a compra
                await controller.setPlano();
                hideLoadingDialog();
                Modular.to.pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
