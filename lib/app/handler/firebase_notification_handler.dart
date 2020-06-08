import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/shared/models/user_model.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';

class FirebaseNotificationHandler {
  String token;
  FirebaseMessaging _firebaseMessaging;

  FirebaseNotificationHandler() {
    setUpFirebase();
  }

  Future updateFCMToken(UserModel user) async {
    print('updatou');
    try {
      if (token == null) {
        await Future.delayed(Duration(seconds: 10));
        updateFCMToken(user);
      } else {
        await Firestore.instance
            .collection('fcm_token')
            .document(user.id)
            .setData({'email': user.email, 'fcmToken': token});
      }
      return;
    } catch (e) {
      return throw e;
    }
  }

  void setUpFirebase() async {
    _firebaseMessaging = FirebaseMessaging();
    token = await _firebaseMessaging.getToken();
    AppController appController = Modular.get();
    if (appController.signedIn) updateFCMToken(appController.userInfos);
    firebaseCloudMessagingListeners();
  }

  void firebaseCloudMessagingListeners() {
    if (Platform.isIOS) iOSPermission();

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("on message $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("VOLTOU PRO APP");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("ABRIU O APP");
      },
    );
  }

  void iOSPermission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }
}
