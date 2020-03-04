import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/shared/components/button/button_widget.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height / 2 - 25,
        ),
        Center(
          child: ButtonWidget(
            height: 50,
            width: MediaQuery.of(context).size.width - 60,
            onTap: () {
              Modular.navigatorKey.currentState.pushNamed('/cadastroEmpresa');
            },
            text: "NOVA EMPRESA",
          ),
        ),
      ],
    );
  }
}
