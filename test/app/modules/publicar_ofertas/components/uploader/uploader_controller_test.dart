import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ofertas/app/modules/publicar_ofertas/components/uploader/uploader_controller.dart';
import 'package:ofertas/app/modules/publicar_ofertas/publicar_ofertas_module.dart';

void main() {
  initModule(PublicarOfertasModule());
  UploaderController uploader;

  setUp(() {
    uploader = PublicarOfertasModule.to.get<UploaderController>();
  });

  group('UploaderController Test', () {
    test("First Test", () {
      expect(uploader, isInstanceOf<UploaderController>());
    });

    test("Set Value", () {
      expect(uploader.value, equals(0));
      uploader.increment();
      expect(uploader.value, equals(1));
    });
  });
}
