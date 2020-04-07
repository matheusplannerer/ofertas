import 'package:flutter/material.dart';
import 'package:ofertas/app/pages/solicitar_acesso/solicitar_acesso_controller.dart';
import 'package:ofertas/app/shared/components/button/button_widget.dart';

class PageOneWidget extends StatelessWidget {
  final SolicitarAcessoController controller;
  PageOneWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(height: 20),
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              "Divulgue sua empresa no clube de ofertas da cidade",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ButtonWidget(
              height: 50,
              margin: EdgeInsets.all(20),
              onTap: () {
                controller.nextPage();
              },
              text: "SOLICITE CONVITE"),
          Container(
            height: 150,
            width: 150,
            child: Image.asset('assets/mogi.png'),
          ),
          Container()
        ],
      ),
    );
  }
}
