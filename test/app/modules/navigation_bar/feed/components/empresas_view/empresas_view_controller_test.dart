import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ofertas/app/modules/navigation_bar/components/feed/components/empresas_view/empresas_view_controller.dart';
import 'package:ofertas/app/modules/navigation_bar/navigation_bar_module.dart';

void main() {
  initModule(NavigationBarModule());
  EmpresasViewController empresasview;

  setUp(() {
    empresasview = NavigationBarModule.to.get<EmpresasViewController>();
  });

  group('EmpresasViewController Test', () {
    test("First Test", () {
      expect(empresasview, isInstanceOf<EmpresasViewController>());
    });

    test("Set Value", () {
      expect(empresasview.value, equals(0));
      empresasview.increment();
      expect(empresasview.value, equals(1));
    });
  });
}
