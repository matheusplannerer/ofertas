import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ofertas/app/shared/components/button/button_controller.dart';
import 'package:ofertas/app/app_module.dart';

void main() {
  initModule(AppModule());
  ButtonController button;

  setUp(() {
    button = AppModule.to.get<ButtonController>();
  });

  group('ButtonController Test', () {
    test("First Test", () {
      expect(button, isInstanceOf<ButtonController>());
    });

    test("Set Value", () {
      expect(button.value, equals(0));
      button.increment();
      expect(button.value, equals(1));
    });
  });
}
