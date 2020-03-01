import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, fbUser) {
        print(fbUser.data);
        print(fbUser.data);
        if (fbUser.data != null) {
          return LoadingProvider(
            child: MultiProvider(
              providers: [
                Provider<GlobalService>(
                  create: (_) => GlobalService(fbUser.data),
                )
              ],
              child: MaterialApp(
                navigatorKey: Modular.navigatorKey,
                title: 'Flutter Slidy',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                initialRoute: '/navbarHome',
                onGenerateRoute: Modular.generateRoute,
              ),
            ),
          );
        } else if (fbUser.data == null) {
          return LoadingProvider(
            child: MultiProvider(
              providers: [
                Provider<GlobalService>(
                  create: (_) => GlobalService(),
                )
              ],
              child: MaterialApp(
                navigatorKey: Modular.navigatorKey,
                title: 'Flutter Slidy',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                initialRoute: '/navbarHome',
                onGenerateRoute: Modular.generateRoute,
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
