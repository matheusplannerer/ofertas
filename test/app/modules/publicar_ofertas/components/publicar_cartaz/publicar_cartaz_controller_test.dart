import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ofertas/app/modules/publicar_ofertas/components/publicar_cartaz/publicar_cartaz_controller.dart';
import 'package:ofertas/app/modules/publicar_ofertas/publicar_ofertas_module.dart';

void main() {
  initModule(PublicarOfertasModule());
  PublicarCartazController publicarcartaz;

  setUp(() {
    publicarcartaz = PublicarOfertasModule.to.get<PublicarCartazController>();
  });

  group('PublicarCartazController Test', () {
    test("First Test", () {
      expect(publicarcartaz, isInstanceOf<PublicarCartazController>());
    });

    test("Set Value", () {});
  });
}
