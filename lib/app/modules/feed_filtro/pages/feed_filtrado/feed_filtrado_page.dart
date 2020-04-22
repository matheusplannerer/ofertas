import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:ofertas/app/modules/feed/components/empresas_view/empresas_view_widget.dart';
import 'package:ofertas/app/modules/feed_filtro/pages/feed_filtrado/feed_filtrado_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_controller.dart';
import 'package:ofertas/app/shared/repositories/sign_up_company/signup_company_controller.dart';

class FeedFiltradoPage extends StatefulWidget {
  final int filtro;
  const FeedFiltradoPage(this.filtro);

  @override
  _FeedFiltradoPageState createState() => _FeedFiltradoPageState();
}

class _FeedFiltradoPageState extends State<FeedFiltradoPage> {
  String categoria;
  FeedFiltradoController controller = FeedFiltradoController();
  ScrollController _scrollController = ScrollController();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SignUpCompanyController aux = Modular.get();
    categoria = aux.categorias[widget.filtro];
    controller.fetchPage(categoria);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        controller.fetchPage(categoria);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      backgroundColor: Colors.orange,
      color: Colors.white,
      onRefresh: () {
        controller.resetPageToFetch();
        return controller.fetchPage(categoria);
      },
      child: Scaffold(
        appBar: GradientAppBar(
          // title: Text(titulo),
          gradient: LinearGradient(
            colors: [
              Colors.orange[900],
              Colors.orange[300],
            ],
          ),
        ),
        body: Observer(
          builder: (_) {
            if (controller.status == RequestStatus.error)
              return Center(
                child: RaisedButton(
                  child: Text("TENTAR NOVAMENTE"),
                  onPressed: () {
                    controller.fetchPage(categoria);
                  },
                ),
              );

            if (controller.empresas == null)
              return Center(
                child: CircularProgressIndicator(),
              );

            if (controller.empresas.length == 0)
              return Center(
                child: Text("SEM OFERTAS CADASTRADAS"),
              );

            return ListView.builder(
              itemCount: controller.empresas.length,
              controller: _scrollController,
              itemBuilder: (context, index) {
                return EmpresasViewWidget(controller.empresas[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
