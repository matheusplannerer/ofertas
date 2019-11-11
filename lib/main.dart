import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ofertas/CA005.dart';
import 'package:ofertas/PE004.dart';
import 'package:ofertas/login.dart';
import 'package:ofertas/CA0010.dart';
import 'package:load/load.dart';
import 'package:ofertas/CA006.dart';
import 'package:ofertas/global/global.dart';
import 'package:ofertas/models/cartaz.dart';
import 'package:ofertas/storage-teste.dart';
import 'package:ofertas/teste.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ofertas/models/descrição_cartaz.dart';

void main() => runApp(
      ChangeNotifierProvider<Global>(
        builder: (context) => Global(),
        child: LoadingProvider(
          child: MyApp(),
        ),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.grey[500]),
        buttonTheme: ButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0),
            ),
            minWidth: 325.0,
            height: 50.0,
            buttonColor: Colors.blueGrey[300]),
      ),
      home: StorageTeste(),
      // home: LoginPage(),
    );
  }
}
