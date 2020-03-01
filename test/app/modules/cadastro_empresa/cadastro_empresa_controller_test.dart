import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ofertas/app/modules/cadastro_empresa/cadastro_empresa_controller.dart';
import 'package:ofertas/app/modules/cadastro_empresa/cadastro_empresa_module.dart';

void main() {
  initModule(CadastroEmpresaModule());
  CadastroEmpresaController cadastroempresa;

  setUp(() {
    cadastroempresa = CadastroEmpresaModule.to.get<CadastroEmpresaController>();
  });

  group('CadastroEmpresaController Test', () {
    test("First Test", () {
      expect(cadastroempresa, isInstanceOf<CadastroEmpresaController>());
    });

    test("Set Value", () {
      expect(cadastroempresa.value, equals(0));
      cadastroempresa.increment();
      expect(cadastroempresa.value, equals(1));
    });
  });
}
