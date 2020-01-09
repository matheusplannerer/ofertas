import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:ofertas/global/global.dart';
import 'package:ofertas/models/classes_usuarios.dart';
import 'package:ofertas/models/produtos.dart';
import 'package:ofertas/paginas/cadastros/cadastro_page.dart';
import 'package:ofertas/paginas/drawer/entreemcontato.dart';
import 'package:ofertas/paginas/feed/feed_page.dart';
import 'package:ofertas/paginas/feed/oferta_detalhes.dart';
import 'package:ofertas/paginas/login/entrar.dart';
import 'package:ofertas/paginas/perfil/perfil_empresa.dart';
import 'package:ofertas/paginas/perfil/perfil_usuario.dart';
import 'package:ofertas/shared/styles.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

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
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
        title:
            Text('OFERTAS', style: logoWhiteStyle, textAlign: TextAlign.center),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_vintage),
            onPressed: () {
              print('4');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              if (global.fbUser == null)
                ListTile(
                  title: Text('ENTRAR COMO EMPRESA'),
                  trailing: Icon(Icons.person),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Entrar()));
                  },
                ),
              ListTile(
                title: Text('DIVULGUE SUAS OFERTAS'),
                trailing: Icon(Icons.new_releases),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CadastroPage()));
                },
              ),
              ListTile(
                trailing: Icon(Icons.email),
                title: Text("ENTRE EM CONTATO"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EntreEmContato()));
                },
              ),
              ListTile(
                trailing: Icon(Icons.group_add),
                title: Text("INDIQUE O APP"),
                // onTap: () {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => Carteira()));
                // },
              ),
              ListTile(
                trailing: Icon(Icons.star_border),
                title: Text('AVALIE O APP'),
              ),
              if (global.fbUser != null)
                ListTile(
                  trailing: Icon(Icons.report_problem),
                  title: Text('SAIR'),
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
