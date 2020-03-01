import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ofertas/app/modules/cadastro_usuario/cadastro_usuario_controller.dart';
import 'package:ofertas/app/modules/cadastro_usuario/cadastro_usuario_module.dart';

void main() {
  initModule(CadastroUsuarioModule());
  CadastroUsuarioController cadastrousuario;

  setUp(() {
    cadastrousuario = CadastroUsuarioModule.to.get<CadastroUsuarioController>();
  });

  group('CadastroUsuarioController Test', () {
    test("First Test", () {
      expect(cadastrousuario, isInstanceOf<CadastroUsuarioController>());
    });

    test("Set Value", () {
      // expect(cadastrousuario.value, equals(0));
      // cadastrousuario.increment();
      // expect(cadastrousuario.value, equals(1));
    });
  });
}
