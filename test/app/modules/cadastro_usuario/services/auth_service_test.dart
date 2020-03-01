import 'package:flutter_test/flutter_test.dart';

import 'package:ofertas/app/modules/cadastro_usuario/services/auth_service.dart';

void main() {
  AuthService service;

  setUp(() {
    service = AuthService();
  });

  group('AuthService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<AuthService>());
    });
  });
}
