import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
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
  final FirebaseUser fbUser;
  final User user;
  final PerfilEmpresa empresaLogada;
  Dashboard({this.fbUser, this.user, this.empresaLogada});

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
  Widget secondPage;

  int _selected = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    print("INIT STAT");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<Global>(context);
    if (widget.fbUser != null) {
      //Ta logado
      global.fbUser = widget.fbUser;
      global.usuario = widget.user;
      if (global.usuario.empresaPerfil == null ||
          global.usuario.empresaPerfil == '') {
        //Não tem empresa
        print("AQUI");
        secondPage = PerfilUsuario();
      } else {
        global.empresaLogada = widget.empresaLogada;
        print("AQUI2");
        print(global.empresaLogada);
        secondPage = PerfilEmpresaPage(global.empresaLogada);
      }
    }
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
      body: global.fbUser != null
          ?
          // RaisedButton(
          //     onPressed: () async {
          //       var geo = await Geolocator().placemarkFromAddress(
          //           'Rua Henrique Savi 14-44',
          //           localeIdentifier: 'en');
          //       print(geo[0].position.latitude);
          //       print(geo[0].position.longitude);
          //     },
          //     child: Text("TESTE"),
          //   )
          // : Center()
          PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                FeedPage(),
                secondPage,
              ],
            )
          : FeedPage(),
    );
  }
}
