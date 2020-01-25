import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:ofertas/global/global.dart';
import 'package:ofertas/models/classes_usuarios.dart';
import 'package:ofertas/paginas/cadastros/cadastro_empresa.dart';
import 'package:ofertas/paginas/feed/dashboard.dart';
import 'package:ofertas/paginas/postagem/cartaz.dart';
import 'package:ofertas/paginas/login/entrar.dart';
import 'package:ofertas/teles.dart';
import 'package:ofertas/paginas/drawer/planos.dart';
import 'package:ofertas/paginas/perfil/perfil_empresa.dart';
import 'package:provider/provider.dart';
import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';

// Future<FirebaseUser> isConnected() async {
//   try {
//     var fbUser = await FirebaseAuth.fromApp(FirebaseApp(name: "[DEFAULT]"))
//         .currentUser();
//     print(fbUser);
//     return fbUser;
//   } catch (e) {
//     print(e);
//     return null;
//   }
// }

Future<Widget> getLandingPage() async {
  return StreamBuilder<FirebaseUser>(
    stream: FirebaseAuth.instance.onAuthStateChanged,
    builder: (BuildContext context, snapshot) {
      if (snapshot.hasData && (!snapshot.data.isAnonymous)) {
        return FutureBuilder<DocumentSnapshot>(
          future: Firestore.instance
              .collection('usuarios')
              .document(snapshot.data.uid)
              .get(),
          builder: (context, user) {
            if (user.hasData) {
              User userAux = User.fromJson(user.data.data);

              return FutureBuilder<DocumentSnapshot>(
                future: Firestore.instance
                    .collection('empresas')
                    .document(userAux.empresaPerfil)
                    .get(),
                builder: (context, empresa) {
                  if (empresa.hasData) {
                    PerfilEmpresa empresaAux = PerfilEmpresa.fromJson(
                        empresa.data.data, empresa.data.documentID);

                    return Dashboard(
                      fbUser: snapshot.data,
                      user: userAux,
                      empresaLogada: empresaAux,
                    );
                  }

                  return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              );
            }

            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        );
      }

      return Dashboard();
    },
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp.configure(
    name: 'default',
    options: Platform.isIOS
        ? FirebaseOptions(
            googleAppID: '',
          )
        : FirebaseOptions(
            apiKey: "AIzaSyANKFx2A_kS9zc-t4GnE05XbNgU6PMNWcA",
            databaseURL: "https://ofertas-dd295.firebaseio.com",
            projectID: "ofertas-dd295",
            storageBucket: "ofertas-dd295.appspot.com",
            googleAppID: "1:115359535931:android:374033c17ec3822b2b1d1e",
          ),
  );
  runApp(
    ChangeNotifierProvider<Global>(
      builder: (context) => Global(),
      child: LoadingProvider(
        child: MaterialApp(
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
          home: await getLandingPage(),
          // home: Teste(),
        ),
      ),
    ),
  );
}
