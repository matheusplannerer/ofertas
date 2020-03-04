import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ofertas/app/modules/publicar_ofertas/components/informacoes_cartaz/informacoes_cartaz_controller.dart';
import 'package:ofertas/app/modules/publicar_ofertas/publicar_ofertas_module.dart';

void main() {
  initModule(PublicarOfertasModule());
  InformacoesCartazController informacoescartaz;

  setUp(() {
    informacoescartaz =
        PublicarOfertasModule.to.get<InformacoesCartazController>();
  });

  group('InformacoesCartazController Test', () {
    test("First Test", () {
      expect(informacoescartaz, isInstanceOf<InformacoesCartazController>());
    });

    test("Set Value", () {
      expect(informacoescartaz.value, equals(0));
      informacoescartaz.increment();
      expect(informacoescartaz.value, equals(1));
    });
  });
}
