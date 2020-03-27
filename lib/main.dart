import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ofertas/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/shared/models/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // var fbUser = await FirebaseAuth.instance
  //     .currentUser()
  //     .timeout(Duration(seconds: 4), onTimeout: () => null);
  // var userDoc = await Firestore.instance
  //     .collection('usuarios')
  //     .document(fbUser.uid)
  //     .get()
  //     .timeout(Duration(seconds: 4), onTimeout: () => null);

  // UserModel user;
  // if (userDoc != null)
  //   user = UserModel.fromJson(userDoc.data);
  // else
  //   user = null;

  runApp(ModularApp(module: AppModule()));
}
