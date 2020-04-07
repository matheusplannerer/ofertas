import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:ofertas/app/modules/perfil_empresa_feed/components/fotos_empresa_feed/fotos_empresa_feed_widget.dart';
import 'package:ofertas/app/modules/perfil_empresa_feed/components/header_empresa_feed/header_empresa_feed_widget.dart';
import 'perfil_empresa_feed_controller.dart';

class PerfilEmpresaFeedPage extends StatefulWidget {
  final String empresaID;
  const PerfilEmpresaFeedPage({Key key, this.empresaID}) : super(key: key);

  @override
  _PerfilEmpresaFeedPageState createState() => _PerfilEmpresaFeedPageState();
}

class _PerfilEmpresaFeedPageState
    extends ModularState<PerfilEmpresaFeedPage, PerfilEmpresaFeedController> {
  //use 'controller' variable to access controller
  _PerfilEmpresaFeedPageState();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    controller.setEmpId(widget.empresaID);
    controller.fetchPage();
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
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        backgroundColor: Colors.orange,
        color: Colors.white,
        onRefresh: () {
          print("TESTANDO");
          return controller.fetchPage();
        },
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Observer(
                  builder: (_) {
                    return HeaderEmpresaFeedWidget(
                      controller.empresa,
                      controller: controller,
                    );
                  },
                ),
                Container(
                  child: Observer(
                    builder: (_) {
                      if (controller.ofertas == null) return Container();
                      if (controller.ofertas != null)
                        return Flexible(
                          fit: FlexFit.loose,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.ofertas.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                            ),
                            itemBuilder: (_, index) {
                              // return Text("$index");
                              print("BUILDOU AQUI DE NOVO $index");
                              return FotosEmpresaFeedWiget(
                                  controller.ofertas[index]);
                            },
                          ),
                        );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
