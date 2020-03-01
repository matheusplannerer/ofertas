import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ofertas/app/modules/publicar_ofertas/publicar_ofertas_controller.dart';
import 'package:ofertas/app/modules/publicar_ofertas/publicar_ofertas_module.dart';

void main() {
  initModule(PublicarOfertasModule());
  PublicarOfertasController publicarofertas;

  setUp(() {
    publicarofertas = PublicarOfertasModule.to.get<PublicarOfertasController>();
  });

  group('PublicarOfertasController Test', () {
    test("First Test", () {
      expect(publicarofertas, isInstanceOf<PublicarOfertasController>());
    });

    test("Set Value", () {
      // expect(publicarofertas.value, equals(0));
      // publicarofertas.increment();
      // expect(publicarofertas.value, equals(1));
    });
  });
}
