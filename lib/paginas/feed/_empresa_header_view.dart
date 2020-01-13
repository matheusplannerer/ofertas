import 'package:flutter/material.dart';
import 'package:ofertas/models/classes_usuarios.dart';

class HeaderEmpresaView extends StatefulWidget {
  HeaderEmpresaView({this.empresa});
  final PerfilEmpresa empresa;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HeaderEmpresaViewState();
  }
}

class _HeaderEmpresaViewState extends State<HeaderEmpresaView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: widget.empresa.foto != null
              ? Image.network(
                  widget.empresa.foto,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  'assets/mogi.jpg',
                  fit: BoxFit.cover,
                ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1),
                right: BorderSide(width: 1),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(widget.empresa.nomeEmpresa),
                  Text(widget.empresa.categoria),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
