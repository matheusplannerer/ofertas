import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ofertas/app/modules/navigation_bar/components/perfil_empresa/perfil_empresa_controller.dart';
import 'package:ofertas/app/modules/navigation_bar/navigation_bar_module.dart';

void main() {
  initModule(NavigationBarModule());
  PerfilEmpresaController perfilempresa;

  setUp(() {
    perfilempresa = NavigationBarModule.to.get<PerfilEmpresaController>();
  });

  group('PerfilEmpresaController Test', () {
    test("First Test", () {
      expect(perfilempresa, isInstanceOf<PerfilEmpresaController>());
    });

    test("Set Value", () {
      expect(perfilempresa.value, equals(0));
      perfilempresa.increment();
      expect(perfilempresa.value, equals(1));
    });
  });
}
