import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:ofertas/models/classes_usuarios.dart';
import 'package:ofertas/paginas/perfil/perfil_empresa.dart';

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

    return ListTile(
      title: Text(widget.empresa.nomeEmpresa),
      trailing: Icon(
        Icons.arrow_forward,
        color: Colors.orange,
      ),
      onTap: () async {
        showLoadingDialog(tapDismiss: false);
        var doc = await Firestore.instance
            .collection('empresas')
            .document(widget.empresa.empresaID)
            .get()
            .timeout(Duration(seconds: 15));
        hideLoadingDialog();
        if (doc != null) {
          PerfilEmpresa aux = PerfilEmpresa.fromJson(doc.data, doc.documentID);

          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => PerfilEmpresaPage(aux)));
        }
      },
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border(
            bottom: BorderSide(color: Colors.grey),
            left: BorderSide(color: Colors.grey),
            right: BorderSide(color: Colors.grey),
            top: BorderSide(color: Colors.grey),
          ),
        ),
        child: widget.empresa.foto != null
            ? Image.network(
                widget.empresa.foto,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, imgChunck) {
                  if (imgChunck == null) {
                    return child;
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              )
            : Image.asset(
                "assets/mogi.jpg",
                fit: BoxFit.cover,
              ),
      ),
    );

    // return Row(
    //   children: <Widget>[
    // Expanded(
    //   flex: 1,
    //   child: widget.empresa.foto != null
    //       ? Image.network(
    //           widget.empresa.foto,
    //           fit: BoxFit.cover,
    //           loadingBuilder: (context, child, imgChunck) {
    //             if (imgChunck == null) {
    //               return child;
    //             } else {
    //               return Center(child: CircularProgressIndicator());
    //             }
    //           },
    //         )
    //       : Image.asset(
    //           "assets/mogi.jpg",
    //           fit: BoxFit.cover,
    //         ),
    // ),
    // Expanded(
    //   flex: 3,
    //   child: Container(
    //     decoration: BoxDecoration(
    //       border: Border(
    //         left: BorderSide(width: 1),
    //       ),
    //     ),
    //     child: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: <Widget>[
    //           Text(widget.empresa.nomeEmpresa),
    //           Text(widget.empresa.categoria),
    //         ],
    //       ),
    //     ),
    //   ),
    // )
    //   ],
    // );
  }
}
