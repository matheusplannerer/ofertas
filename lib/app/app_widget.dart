import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/shared/global_service.dart';
import 'package:ofertas/app/shared/models/user_model.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print(FirebaseAuth.instance);
    return LoadingProvider(
      loadingWidgetBuilder: (context, themeData) {
        return SpinKitDualRing(
          color: Colors.orange,
          size: 35,
        );
      },
      child: MaterialApp(
        navigatorKey: Modular.navigatorKey,
        title: 'Flutter Slidy',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: Modular.generateRoute,
      ),
    );
  }
}
