import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:ofertas/global/global.dart';
import 'package:ofertas/paginas/cadastros/cadastro_empresa.dart';
import 'package:ofertas/paginas/feed/dashboard.dart';
import 'package:ofertas/paginas/postagem/cartaz.dart';
import 'package:ofertas/paginas/login/entrar.dart';
import 'package:ofertas/teles.dart';
import 'package:ofertas/paginas/drawer/planos.dart';
import 'package:provider/provider.dart';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';

Future<FirebaseUser> isConnected() async {
  try {
    var fbUser = await FirebaseAuth.instance.currentUser();
    return fbUser;
  } catch (e) {
    return null;
  }
}

void main() async {
  var fbUser = await isConnected();

  return runApp(
    ChangeNotifierProvider<Global>(
      builder: (context) => Global(fbUser: fbUser),
      child: LoadingProvider(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // appBarTheme: AppBarTheme(
        // color: Colors.orange
        // ),
        primarySwatch: Colors.orange,
        buttonColor: Colors.orange,
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
          ),
          minWidth: 325.0,
          height: 50.0,
          buttonColor: Colors.blueGrey[300],
        ),
      ),
      home: Dashboard(),
      // home: Teste(),
    );
  }
}
