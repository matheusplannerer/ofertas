import 'package:flutter_test/flutter_test.dart';

import 'package:ofertas/app/modules/cadastro_empresa/services/cadastro_empresa_service.dart';

void main() {
  CadastroEmpresaService service;

  setUp(() {
    service = CadastroEmpresaService();
  });

  group('CadastroEmpresaService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<CadastroEmpresaService>());
    });
  });
}
