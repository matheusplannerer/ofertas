import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/modules/feed/components/empresas_view/empresas_view_widget.dart';
import 'package:ofertas/app/modules/feed/feed_controller.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_controller.dart';

class FeedPage extends StatefulWidget {
  final String title;
  const FeedPage({Key key, this.title = "Feed", this.navigatorKey})
      : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends ModularState<FeedPage, FeedController> {
  ScrollController _scrollController = ScrollController();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetchPage();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        controller.fetchPage();
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
        print("RESET");
        controller.resetPageToFetch();
        return controller.fetchPage();
      },
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              if (!controller.appController.signedIn)
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.store,
                          color: Colors.orange.shade600, size: 30),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Entrar como empresa',
                          style: TextStyle(
                              fontFamily: "Domine-Bold",
                              fontSize: 16,
                              color: Colors.black87,
                              letterSpacing: .3),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    controller.routeController.tab1Nav.pop();
                    Modular.to.pushReplacementNamed('/login');
                  },
                ),
              Divider(),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.chat_bubble_outline,
                        color: Colors.orange.shade500, size: 30),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Entre em contato',
                        style: TextStyle(
                            fontFamily: "Domine-Bold",
                            fontSize: 16,
                            color: Colors.black87,
                            letterSpacing: .3),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  controller.routeController.tab1Nav.pop();

                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => EntreEmContato()));
                },
              ),
              Divider(),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.group_add,
                      color: Colors.orange.shade600,
                      size: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Indique o App',
                        style: TextStyle(
                            fontFamily: "Domine-Bold",
                            fontSize: 16,
                            color: Colors.black87,
                            letterSpacing: .3),
                      ),
                    ),
                  ],
                ),
                // onTap: () {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => Carteira()));
                // },
              ),
              Divider(),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.star_border,
                        color: Colors.orange.shade400, size: 30),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Avalie o app',
                        style: TextStyle(
                            fontFamily: "Domine-Bold",
                            fontSize: 16,
                            color: Colors.black87,
                            letterSpacing: .3),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              if (!controller.appController.signedIn)
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.sentiment_very_satisfied,
                          color: Colors.orange.shade600, size: 30),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Divulgue suas ofertas',
                          style: TextStyle(
                              fontFamily: "Domine-Bold",
                              fontSize: 16,
                              color: Colors.black87,
                              letterSpacing: .3),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Modular.navigatorKey.currentState
                        .pushNamed('/solicitar_acesso');
                  },
                ),
              Divider(),
              // if (global.fbUser != null)
              if (controller.appController.signedIn)
                ListTile(
                  trailing:
                      Icon(Icons.arrow_back, color: Colors.orange.shade400),
                  title: Text(
                    'SAIR',
                    style: TextStyle(
                        fontFamily: "Domine-Bold",
                        fontSize: 16,
                        color: Colors.black87,
                        letterSpacing: .3),
                  ),
                  onTap: () async {
                    controller.routeController.tab1Nav.pop();
                    await Future.delayed(Duration(milliseconds: 250));
                    AppController appController = Modular.get();
                    await appController.signOut();
                    Modular.to.pushReplacementNamed('/login');
                  },
                ),
            ],
          ),
        ),
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
                    controller.fetchPage();
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
