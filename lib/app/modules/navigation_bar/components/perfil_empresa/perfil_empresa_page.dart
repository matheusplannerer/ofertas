import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/modules/navigation_bar/components/perfil_empresa/components/empresa/empresa_page.dart';
import 'package:ofertas/app/modules/navigation_bar/components/perfil_empresa/components/nova_empresa/nova_empresa_page.dart';
import 'package:ofertas/app/modules/navigation_bar/components/perfil_empresa/perfil_empresa_controller.dart';
import 'package:ofertas/app/shared/components/button/button_widget.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
import 'package:provider/provider.dart';

class PerfilEmpresaPage extends StatefulWidget {
  final PerfilEmpresaModel empresa;
  final String empresaID;

  final String title;
  const PerfilEmpresaPage(
      {Key key, this.title = "PerfilEmpresa", this.empresa, this.empresaID})
      : super(key: key);

  @override
  _PerfilEmpresaPageState createState() => _PerfilEmpresaPageState();
}

class _PerfilEmpresaPageState extends State<PerfilEmpresaPage> {
  PerfilEmpresaModel empresa;
  String empresaID;
  var _empresaController = PerfilEmpresaController();

  @override
  void initState() {
    super.initState();
    empresa = widget.empresa;
    empresaID = widget.empresaID;
  }

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<GlobalService>(context);

    Widget _selectPage() {
      if (empresaID != null || global.usuario?.empresaPerfil != null) {
        return StreamBuilder<DocumentSnapshot>(
          builder: (context, empresaSnap) {
            if (_empresaController.fetched(empresaSnap)) {
              PerfilEmpresaModel empresaModel = PerfilEmpresaModel.fromJson(
                  empresaSnap.data.data, empresaSnap.data.documentID);
              return EmpresaPage(
                empresaSnap: empresaSnap,
                empresa: empresaModel,
              );
            } else if (_empresaController.isFetching(empresaSnap)) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
          stream: Firestore.instance
              .collection('empresas')
              .document(widget.empresaID == null
                  ? global.usuario.empresaPerfil
                  : widget.empresaID)
              .get()
              .asStream(),
          initialData: null,
        );
      } else {
        return NovaEmpresaPage();
      }
    }

    return Scaffold(
      appBar: GradientAppBar(
        gradient: LinearGradient(
          colors: [
            Colors.orange[900],
            Colors.orange[300],
          ],
        ),
      ),
      body: _selectPage(),
    );
  }
}
