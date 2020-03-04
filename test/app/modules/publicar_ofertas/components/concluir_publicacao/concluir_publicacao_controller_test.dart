import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ofertas/app/modules/publicar_ofertas/components/concluir_publicacao/concluir_publicacao_controller.dart';
import 'package:ofertas/app/modules/publicar_ofertas/publicar_ofertas_module.dart';

void main() {
  initModule(PublicarOfertasModule());
  ConcluirPublicacaoController concluirpublicacao;

  setUp(() {
    concluirpublicacao =
        PublicarOfertasModule.to.get<ConcluirPublicacaoController>();
  });

  group('ConcluirPublicacaoController Test', () {
    test("First Test", () {
      expect(concluirpublicacao, isInstanceOf<ConcluirPublicacaoController>());
    });

    test("Set Value", () {
      expect(concluirpublicacao.value, equals(0));
      concluirpublicacao.increment();
      expect(concluirpublicacao.value, equals(1));
    });
  });
}
