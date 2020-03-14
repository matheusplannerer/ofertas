import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, fbUser) {
        print(fbUser.data);
        if (fbUser.data != null) {
          return FutureBuilder<DocumentSnapshot>(
            future: Firestore.instance
                .collection('usuarios')
                .document(fbUser.data.uid)
                .get(),
            builder: (context, userSnap) {
              if (userSnap.connectionState == ConnectionState.done &&
                  userSnap.hasData) {
                UserModel user = UserModel.fromJson(userSnap.data.data);
                return LoadingProvider(
                  loadingWidgetBuilder: (context, themeData) {
                    return SpinKitDualRing(
                      color: Colors.orange,
                      size: 35,
                    );
                  },
                  child: MultiProvider(
                    providers: [
                      Provider<GlobalService>(
                        create: (_) => GlobalService(fbUser.data, user),
                      )
                    ],
                    child: MaterialApp(
                      navigatorKey: Modular.navigatorKey,
                      title: 'Flutter Slidy',
                      theme: ThemeData(
                        primarySwatch: Colors.blue,
                      ),
                      initialRoute: '/',
                      onGenerateRoute: Modular.generateRoute,
                    ),
                  ),
                );
              } else {
                return LoadingProvider(
                  loadingWidgetBuilder: (context, themeData) {
                    return SpinKitDualRing(
                      color: Colors.orange,
                      size: 35,
                    );
                  },
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
                      initialRoute: '/',
                      onGenerateRoute: Modular.generateRoute,
                    ),
                  ),
                );
              }
            },
          );
        } else if (fbUser.data == null) {
          return LoadingProvider(
            loadingWidgetBuilder: (context, themeData) {
              return SpinKitDualRing(
                color: Colors.orange,
                size: 35,
              );
            },
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
                initialRoute: '/',
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
