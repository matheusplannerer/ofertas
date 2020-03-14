import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/modules/navigation_bar/components/feed/feed_page.dart';
import 'package:ofertas/app/modules/navigation_bar/components/oferta_details/oferta_details_page.dart';
import 'package:ofertas/app/modules/navigation_bar/components/perfil_empresa/components/horarios/horarios_page.dart';
import 'package:ofertas/app/modules/navigation_bar/navigation_bar_controller.dart';
import 'package:ofertas/app/modules/navigation_bar/components/perfil_empresa/perfil_empresa_page.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:provider/provider.dart';

class NavigationBarPage extends StatefulWidget {
  final String title;
  const NavigationBarPage({Key key, this.title = "NavigationBar"})
      : super(key: key);

  @override
  _NavigationBarPageState createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  var _navController = NavigationBarController();
  List<Widget> pages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<GlobalService>(context);
    pages = [
      Navigator(
        key: global.navigatorKeyFeed,
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case '/':
                  return FeedPage();
                case '/perfilEmpresa':
                  return PerfilEmpresaPage(
                    empresaID: settings.arguments,
                  );
                case '/oferta_details':
                  return OfertaDetailsPage(
                    oferta: settings.arguments,
                  );
              }
            },
          );
        },
      ),
      Navigator(
        key: global.navigatorKeyPerfil,
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case '/':
                  return PerfilEmpresaPage(
                    empresaID: settings.arguments,
                  );
                case '/oferta_details':
                  return OfertaDetailsPage(
                    oferta: settings.arguments,
                  );
                case '/perfilEmpresa':
                  return PerfilEmpresaPage(
                    empresaID: settings.arguments,
                  );
                case '/horarios':
                  return HorariosPage(
                    empresaID: settings.arguments,
                  );
              }
            },
          );
        },
      ),
    ];

    return Observer(
      builder: (_) {
        return Scaffold(
          bottomNavigationBar: global.isLogged
              ? BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), title: Text("")),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), title: Text("")),
                  ],
                  currentIndex: _navController.navIndex,
                  selectedItemColor: Colors.orange,
                  onTap: (int index) {
                    _navController.setNavIndex(index, global);
                  },
                )
              : null,
          body: IndexedStack(
            index: _navController.navIndex,
            children: <Widget>[
              ...pages,
            ],
          ),
        );
      },
    );
  }
}
