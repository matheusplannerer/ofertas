import 'package:flutter_test/flutter_test.dart';

import 'package:ofertas/app/modules/cadastro_empresa/services/via_cep_service.dart';

void main() {
  ViaCepService service;

  setUp(() {
    service = ViaCepService();
  });

  group('ViaCepService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<ViaCepService>());
    });
  });
}
