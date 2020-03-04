import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ofertas/app/modules/publicar_ofertas/components/informacoes_upload/informacoes_upload_controller.dart';
import 'package:ofertas/app/modules/publicar_ofertas/publicar_ofertas_module.dart';

void main() {
  initModule(PublicarOfertasModule());
  InformacoesUploadController informacoesupload;

  setUp(() {
    informacoesupload =
        PublicarOfertasModule.to.get<InformacoesUploadController>();
  });

  group('InformacoesUploadController Test', () {
    test("First Test", () {
      expect(informacoesupload, isInstanceOf<InformacoesUploadController>());
    });

    test("Set Value", () {
      expect(informacoesupload.value, equals(0));
      informacoesupload.increment();
      expect(informacoesupload.value, equals(1));
    });
  });
}
