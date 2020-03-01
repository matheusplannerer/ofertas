import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ofertas/app/modules/navigation_bar/components/feed/components/ofertas_view/ofertas_view_controller.dart';
import 'package:ofertas/app/modules/navigation_bar/navigation_bar_module.dart';

void main() {
  initModule(NavigationBarModule());
  OfertasViewController ofertasview;

  setUp(() {
    ofertasview = NavigationBarModule.to.get<OfertasViewController>();
  });

  group('OfertasViewController Test', () {
    test("First Test", () {
      expect(ofertasview, isInstanceOf<OfertasViewController>());
    });

    test("Set Value", () {
      expect(ofertasview.value, equals(0));
      ofertasview.increment();
      expect(ofertasview.value, equals(1));
    });
  });
}
