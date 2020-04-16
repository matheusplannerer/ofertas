import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/modules/feed/components/empresas_view/empresas_view_controller.dart';
import 'package:ofertas/app/modules/feed/components/ofertas_view/ofertas_view_widget.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';

class EmpresasViewWidget extends StatefulWidget {
  final PerfilEmpresaModel empresa;
  EmpresasViewWidget(this.empresa);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EmpresasViewWidgetState();
  }
}

class _EmpresasViewWidgetState extends State<EmpresasViewWidget> {
  final int index;
  PerfilEmpresaModel empresa;
  _EmpresasViewWidgetState({this.index});
  final ScrollController _scrollController = ScrollController();
  final EmpresasViewController controller = EmpresasViewController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    empresa = widget.empresa;
    controller.setEmpresa(widget.empresa);
    controller.fetchOfertasEmpresa();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            // color: Colors.orange[200],
            border: Border(
              top: BorderSide(color: Colors.grey[200], width: 5),
            ),
          ),
          child: ListTile(
            title: Text(empresa.nomeEmpresa ??= ''),
            trailing: Icon(
              Icons.arrow_forward,
              color: Colors.orange,
            ),
            onTap: () async {
              // print(empresa.empresaID);
              controller.routeController.tab1Nav
                  .pushNamed('/empresa/${empresa.empresaID}');
            },
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.grey[400],
                shape: BoxShape.circle,
              ),
              child: empresa.foto != null
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(
                        empresa.foto,
                      ),
                    )
                  : CircleAvatar(
                      backgroundImage: AssetImage('assets/mogi.jpg'),
                    ),
            ),
          ),
        ),
        Container(
          height: 10,
          color: Colors.white,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: 140,
          // color: Colors.green,
          width: MediaQuery.of(context).size.width,
          // color: Colors.red,
          child: Observer(
            builder: (_) {
              if (controller.ofertas == null)
                return Center(
                  child: CircularProgressIndicator(),
                );

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.ofertas.length,
                controller: _scrollController,
                itemBuilder: (context, i) {
                  return OfertasViewWidget(controller.ofertas[i]);
                },
              );
            },
          ),
        ),
        SizedBox(height: 25),
      ],
    );
  }
}
