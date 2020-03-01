import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ofertas/app/modules/navigation_bar/components/perfil_empresa/components/nova_empresa/nova_empresa_controller.dart';
import 'package:ofertas/app/modules/navigation_bar/navigation_bar_module.dart';

void main() {
  initModule(NavigationBarModule());
  NovaEmpresaController novaempresa;

  setUp(() {
    novaempresa = NavigationBarModule.to.get<NovaEmpresaController>();
  });

  group('NovaEmpresaController Test', () {
    test("First Test", () {
      expect(novaempresa, isInstanceOf<NovaEmpresaController>());
    });

    test("Set Value", () {
      expect(novaempresa.value, equals(0));
      novaempresa.increment();
      expect(novaempresa.value, equals(1));
    });
  });
}
