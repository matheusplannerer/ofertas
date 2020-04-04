import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/pages/splash/splash_controller.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  ReactionDisposer disposer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    disposer = autorun((_) async {
      if (controller.status == AuthStatus.signedOff) {
        await Future.delayed(Duration(seconds: 1));
        Modular.to.pushReplacementNamed('/login');
      }
      if (controller.status == AuthStatus.signedIn) {
        await Future.delayed(Duration(seconds: 1));
        Modular.to.pushReplacementNamed('/home');
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
