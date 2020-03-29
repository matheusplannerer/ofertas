import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  ReactionDisposer disposer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    disposer = autorun((_) {
      AuthController _auth = Modular.get();
      if (_auth.status == AuthStatus.loggedIn) {
        Modular.to.pushReplacementNamed('/home');
      } else if (_auth.status == AuthStatus.loggedOff) {
        Modular.to.pushReplacementNamed('/login');
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    disposer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.orange,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height / 4,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Image.asset('assets/mogi.png'),
            ),
          )
        ],
      ),
    );
  }
}
