import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:ofertas/global/global.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:ofertas/models/classes_usuarios.dart';
import 'package:ofertas/models/produtos.dart';
import 'package:ofertas/paginas/cadastros/cadastro_page.dart';
import 'package:ofertas/paginas/drawer/entreemcontato.dart';
import 'package:ofertas/paginas/feed/categorias.dart';
import 'package:ofertas/paginas/feed/feed_page.dart';
import 'package:ofertas/paginas/feed/oferta_detalhes.dart';
import 'package:ofertas/paginas/login/entrar.dart';
import 'package:ofertas/paginas/perfil/perfil_empresa.dart';
import 'package:ofertas/paginas/drawer/planos.dart';
import 'package:ofertas/paginas/perfil/perfil_usuario.dart';
import 'package:ofertas/shared/styles.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:ofertas/paginas/feed/categorias.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DashboardState();
  }
}

const Color bgColor = Color(0xffF4F7FA);
//  const Color primaryColor = Colors.green;
const Color primaryColor = Color(0xFFF57C00);
const Color white = Colors.white;
const Color darkText = Colors.black54;
const Color highlightColor = Colors.orange;

class _DashboardState extends State<Dashboard> {
  int _selected = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<Global>(context);
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: global.fbUser != null
          ? BottomNavigationBar(
              currentIndex: _selected,
              onTap: (index) {
                if (_selected != index) {
                  setState(() {
                    _selected = index;
                    _pageController.animateToPage(
                      _selected,
                      duration: Duration(microseconds: 10),
                      curve: Curves.linear,
                    );
                  });
                }
              },
              items: [
                BottomNavigationBarItem(
                  title: Text("HOME"),
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  title: Text("PERFIL"),
                  icon: Icon(Icons.person),
                ),
              ],
            )
          : null,
      // backgroundColor: Colors.grey[200],
      appBar: GradientAppBar(
        centerTitle: true,
        // elevation: 0,
        // backgroundColor: primaryColor,
        title:
            Text('OFERTAS', 
              style: TextStyle(
              fontSize: 22,
              fontFamily: "Poppins-Bold",
              color: Colors.white,
              letterSpacing: .6),),
              gradient: LinearGradient(
          colors: [
            Colors.orange[900],
            Colors.orange[300],
          ],
      ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CategoriasPage()));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            if (global.fbUser == null)
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Entrar()));
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EntreEmContato()));
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Planos()));
                },
            ),
            Divider(),
            if (global.fbUser != null)
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
                  Navigator.of(context).pop();
                  showLoadingDialog();
                  await Future.delayed(Duration(milliseconds: 400));
                  global.isEmpresa = false;
                  await FirebaseAuth.instance.signOut();
                  hideLoadingDialog();
                  global.fbUser = null;
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Dashboard()));
                },
              ),
          ],
        ),
      ),
      body: global.fbUser != null
          ? PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                FeedPage(),
                PerfilUsuario(),
              ],
            )
          : FeedPage(),
    );
  }
}
