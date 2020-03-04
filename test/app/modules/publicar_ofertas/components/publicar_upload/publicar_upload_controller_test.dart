import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ofertas/app/modules/publicar_ofertas/components/publicar_upload/publicar_upload_controller.dart';
import 'package:ofertas/app/modules/publicar_ofertas/publicar_ofertas_module.dart';

void main() {
  initModule(PublicarOfertasModule());
  PublicarUploadController publicarupload;

  setUp(() {
    publicarupload = PublicarOfertasModule.to.get<PublicarUploadController>();
  });

  group('PublicarUploadController Test', () {
    test("First Test", () {
      expect(publicarupload, isInstanceOf<PublicarUploadController>());
    });

    test("Set Value", () {
      expect(publicarupload.value, equals(0));
      publicarupload.increment();
      expect(publicarupload.value, equals(1));
    });
  });
}
