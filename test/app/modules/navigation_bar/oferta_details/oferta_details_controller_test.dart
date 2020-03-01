import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ofertas/app/modules/navigation_bar/components/oferta_details/oferta_details_controller.dart';
import 'package:ofertas/app/modules/navigation_bar/navigation_bar_module.dart';

void main() {
  initModule(NavigationBarModule());
  OfertaDetailsController ofertadetails;

  setUp(() {
    ofertadetails = NavigationBarModule.to.get<OfertaDetailsController>();
  });

  group('OfertaDetailsController Test', () {
    test("First Test", () {
      expect(ofertadetails, isInstanceOf<OfertaDetailsController>());
    });

    test("Set Value", () {
      expect(ofertadetails.value, equals(0));
      ofertadetails.increment();
      expect(ofertadetails.value, equals(1));
    });
  });
}
