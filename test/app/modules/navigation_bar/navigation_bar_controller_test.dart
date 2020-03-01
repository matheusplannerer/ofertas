import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ofertas/app/modules/navigation_bar/navigation_bar_controller.dart';
import 'package:ofertas/app/modules/navigation_bar/navigation_bar_module.dart';

void main() {
  initModule(NavigationBarModule());
  NavigationBarController navigationbar;

  setUp(() {
    navigationbar = NavigationBarModule.to.get<NavigationBarController>();
  });

  group('NavigationBarController Test', () {
    test("First Test", () {
      expect(navigationbar, isInstanceOf<NavigationBarController>());
    });

    test("Set Value", () {});
  });
}
