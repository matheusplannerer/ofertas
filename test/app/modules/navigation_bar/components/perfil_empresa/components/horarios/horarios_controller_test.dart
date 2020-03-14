import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ofertas/app/modules/navigation_bar/components/perfil_empresa/components/horarios/horarios_controller.dart';
import 'package:ofertas/app/modules/navigation_bar/navigation_bar_module.dart';

void main() {
  initModule(NavigationBarModule());
  HorariosController horarios;

  setUp(() {
    horarios = NavigationBarModule.to.get<HorariosController>();
  });

  group('HorariosController Test', () {
    test("First Test", () {
      expect(horarios, isInstanceOf<HorariosController>());
    });

    test("Set Value", () {
      expect(horarios.value, equals(0));
      horarios.increment();
      expect(horarios.value, equals(1));
    });
  });
}
