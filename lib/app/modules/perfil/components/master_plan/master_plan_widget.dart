import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/modules/perfil/components/master_plan/master_plan_controller.dart';
import 'package:ofertas/app/shared/components/button/button_widget.dart';
import 'package:ofertas/app/shared/models/planos_admin_model.dart';

class MasterPlanWidget extends StatelessWidget {
  final bool checked;
  final PlanosAdminModel plano;
  MasterPlanWidget({
    this.checked,
    this.plano,
  });
  final MasterPlanController controller = MasterPlanController();
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.check_circle_outline,
                  color: checked ? null : Colors.white,
                ),
                onPressed: null,
              ),
              Center(
                child: Text(
                  "Master",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              IconButton(
                //Apenas para alinhar
                icon: Icon(
                  Icons.check_circle_outline,
                  color: Colors.white,
                ),
                onPressed: null,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "MENSAL: ",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              RichText(
                text: TextSpan(
                  text: "R\$ ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: "${plano.valores['mensal'].toStringAsFixed(2)} ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                      ),
                    ),
                    TextSpan(
                      text: "/ mês",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Observer(
                builder: (_) {
                  return IconButton(
                    icon: Icon(controller.mensal
                        ? Icons.check_box
                        : Icons.check_box_outline_blank),
                    onPressed: () {
                      controller.setMensal(true);
                      controller.setSemestral(false);
                      controller.setAnual(false);
                    },
                  );
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SEMESTRAL: ",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              RichText(
                text: TextSpan(
                  text: "6x ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: "R\$ ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: "${plano.valores['semestral'].toStringAsFixed(2)} ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                      ),
                    ),
                    TextSpan(
                      text: "/ mês",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Observer(
                builder: (_) {
                  return IconButton(
                    icon: Icon(controller.semestral
                        ? Icons.check_box
                        : Icons.check_box_outline_blank),
                    onPressed: () {
                      controller.setMensal(false);
                      controller.setSemestral(true);
                      controller.setAnual(false);
                    },
                  );
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ANUAL: ",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              RichText(
                text: TextSpan(
                  text: "12x ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: "R\$ ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: "${plano.valores['anual'].toStringAsFixed(2)} ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                      ),
                    ),
                    TextSpan(
                      text: "/ mês",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Observer(
                builder: (_) {
                  return IconButton(
                    icon: Icon(controller.anual
                        ? Icons.check_box
                        : Icons.check_box_outline_blank),
                    onPressed: () {
                      controller.setMensal(false);
                      controller.setSemestral(false);
                      controller.setAnual(true);
                    },
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 15),
          Divider(
            thickness: 1.5,
            height: 0.5,
          ),
          ListTile(
            title: Text(
              "Perfil Empresarial",
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text("Ilimitado"),
            trailing: Icon(
              Icons.check,
              color: Colors.green,
            ),
          ),
          Divider(
            thickness: 1.5,
            height: 0.5,
          ),
          ListTile(
            title: Text(
              "Divulgação de Ofertas",
              style: TextStyle(color: Colors.black),
            ),
            trailing: Icon(
              Icons.check,
              color: Colors.green,
            ),
          ),
          Divider(
            thickness: 1.5,
            height: 0.5,
          ),
          ButtonWidget(
            onTap: () {
              controller.setPlan(plano);
              Modular.to.pushNamed('/perfil/resumo');
            },
            height: 40,
            text: "SELECIONAR",
            margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
          ),
        ],
      ),
    );
  }
}
