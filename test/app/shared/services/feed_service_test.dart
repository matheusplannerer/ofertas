import 'package:flutter_test/flutter_test.dart';

import 'package:ofertas/app/shared/services/feed_service.dart';

void main() {
  FeedService service;

  setUp(() {
    service = FeedService();
  });

  group('FeedService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<FeedService>());
    });
  });
}
