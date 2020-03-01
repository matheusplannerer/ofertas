import 'package:flutter_test/flutter_test.dart';

import 'package:ofertas/app/modules/login/services/login_service.dart';

void main() {
  LoginService service;

  setUp(() {
    service = LoginService();
  });

  group('LoginService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<LoginService>());
    });
  });
}
