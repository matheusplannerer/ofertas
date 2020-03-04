import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/modules/navigation_bar/components/feed/components/empresas_view/empresas_view_widget.dart';
import 'package:ofertas/app/modules/navigation_bar/components/feed/feed_controller.dart';
import 'package:ofertas/app/shared/components/gradient_appbar/gradient_appbar_widget.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:provider/provider.dart';

class FeedPage extends StatefulWidget {
  final String title;
  const FeedPage({Key key, this.title = "Feed", this.navigatorKey})
      : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  ScrollController _scrollController = ScrollController();

  var _feedController = FeedController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _feedController.fetchEmpresas();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (!_feedController.isLoading) {
          _feedController.fetchEmpresas();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<GlobalService>(context);
    print("BUILDOU");
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            if (!global.isLogged)
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.store, color: Colors.orange.shade600, size: 30),
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
                  global.navigatorKeyFeed.currentState.pop();
                  Modular.navigatorKey.currentState
                      .pushReplacementNamed('/login');
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
                global.navigatorKeyFeed.currentState.pop();

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
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.sentiment_very_satisfied,
                      color: Colors.orange.shade600, size: 30),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Assine já',
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
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Planos()));
              },
            ),
            Divider(),
            // if (global.fbUser != null)
            if (global.isLogged)
              ListTile(
                trailing: Icon(Icons.arrow_back, color: Colors.orange.shade400),
                title: Text(
                  'SAIR',
                  style: TextStyle(
                      fontFamily: "Domine-Bold",
                      fontSize: 16,
                      color: Colors.black87,
                      letterSpacing: .3),
                ),
                onTap: () async {
                  global.navigatorKeyFeed.currentState.pop();
                  showLoadingDialog();
                  await Future.delayed(Duration(milliseconds: 500));
                  await FirebaseAuth.instance.signOut();
                  global.signOut();
                  hideLoadingDialog();
                  Modular.navigatorKey.currentState
                      .pushReplacementNamed('/login');
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
          return ListView.builder(
            itemCount: _feedController.empresas.length,
            controller: _scrollController,
            itemBuilder: (context, index) {
              if (_feedController.empresas.length == 0) {
                if (!_feedController.carregou) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Center(
                    child: Text("Sem empresas"),
                  );
                }
              } else {
                return EmpresasViewWidget(_feedController.empresas[index]);
              }
            },
          );
        },
      ),
    );
  }
}
