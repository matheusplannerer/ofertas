import 'package:flutter/material.dart';
import 'package:ofertas/app/shared/models/planos_admin_model.dart';

class FreePlanWidget extends StatelessWidget {
  final bool canChoose;
  final PlanosAdminModel plano;
  FreePlanWidget({this.plano, this.canChoose});
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
                  color: Colors.white,
                ),
                onPressed: null,
              ),
              Center(
                child: Text(
                  "Básico",
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
          Center(
            child: RichText(
              text: TextSpan(
                text: "GRÁTIS",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
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
            subtitle: Text("Apenas ${plano.numberProfile}"),
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
              Icons.close,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
