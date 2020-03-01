import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ofertas/app/shared/components/gradient_appbar/gradient_appbar_controller.dart';
import 'package:ofertas/app/app_module.dart';

void main() {
  initModule(AppModule());
  GradientAppbarController gradientappbar;

  setUp(() {
    gradientappbar = AppModule.to.get<GradientAppbarController>();
  });

  group('GradientAppbarController Test', () {
    test("First Test", () {
      expect(gradientappbar, isInstanceOf<GradientAppbarController>());
    });

    test("Set Value", () {
      expect(gradientappbar.value, equals(0));
      gradientappbar.increment();
      expect(gradientappbar.value, equals(1));
    });
  });
}
