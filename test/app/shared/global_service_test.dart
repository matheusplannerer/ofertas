import 'package:flutter_test/flutter_test.dart';

import 'package:ofertas/app/shared/global_service.dart';

void main() {
  GlobalService service;

  setUp(() {
    service = GlobalService();
  });

  group('GlobalService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<GlobalService>());
    });
  });
}
