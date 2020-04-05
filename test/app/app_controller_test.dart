import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/app_module.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  initModule(AppModule());
  AppController app;

  setUp(() {
    app = AppModule.to.get<AppController>();
  });

  group('AppController Test', () {
    test("First Test", () {
      expect(app, isInstanceOf<AppController>());
    });

    test("Set Value", () async {});
  });
}
