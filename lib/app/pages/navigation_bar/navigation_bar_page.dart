import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/modules/feed/feed_module.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_module.dart';
import 'package:ofertas/app/pages/navigation_bar/navigation_bar_controller.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
import 'package:ofertas/app/shared/repositories/routes/route_controller.dart';
import 'package:provider/provider.dart';

class NavigationBarPage extends StatefulWidget {
  final String title;
  const NavigationBarPage({Key key, this.title = "NavigationBar"})
      : super(key: key);

  @override
  _NavigationBarPageState createState() => _NavigationBarPageState();
}

class _NavigationBarPageState
    extends ModularState<NavigationBarPage, NavigationBarController> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<GlobalService>(context);

    return Scaffold(
      bottomNavigationBar: controller.appController.signedIn
          ? Observer(
              builder: (_) {
                return BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      title: Text(""),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      title: Text(""),
                    ),
                  ],
                  currentIndex: controller.navIndex,
                  selectedItemColor: Colors.orange,
                  onTap: (int index) {
                    controller.setNavIndex(index, global);
                  },
                );
              },
            )
          : null,
      body: Observer(
        builder: (_) {
          return IndexedStack(
            index: controller.navIndex,
            children: <Widget>[
              RouterOutlet(
                module: FeedModule(),
                keepAlive: true,
                initialRoute: '/',
                navigatorKey: controller.routeController.keyTab1,
              ),
              RouterOutlet(
                module: PerfilEmpresaModule(),
                keepAlive: true,
                navigatorKey: controller.routeController.keyTab2,
                initialRoute: '/',
              ),
            ],
          );
        },
      ),
    );
  }
}
