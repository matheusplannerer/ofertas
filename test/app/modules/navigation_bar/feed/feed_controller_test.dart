import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ofertas/app/modules/navigation_bar/components/feed/feed_controller.dart';
import 'package:ofertas/app/modules/navigation_bar/navigation_bar_module.dart';

void main() {
  initModule(NavigationBarModule());
  FeedController feed;

  setUp(() {
    feed = NavigationBarModule.to.get<FeedController>();
  });

  group('FeedController Test', () {
    test("First Test", () {
      expect(feed, isInstanceOf<FeedController>());
    });

    test("Set Value", () {
      // expect(feed.value, equals(0));
      // feed.increment();
      // expect(feed.value, equals(1));
    });
  });
}
