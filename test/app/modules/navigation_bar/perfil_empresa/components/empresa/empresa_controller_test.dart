import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ofertas/app/modules/navigation_bar/components/perfil_empresa/components/empresa/empresa_controller.dart';
import 'package:ofertas/app/modules/navigation_bar/navigation_bar_module.dart';

void main() {
  initModule(NavigationBarModule());
  EmpresaController empresa;

  setUp(() {
    empresa = NavigationBarModule.to.get<EmpresaController>();
  });

  group('EmpresaController Test', () {
    test("First Test", () {
      expect(empresa, isInstanceOf<EmpresaController>());
    });

    test("Set Value", () {
      expect(empresa.value, equals(0));
      empresa.increment();
      expect(empresa.value, equals(1));
    });
  });
}
