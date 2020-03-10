import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ofertas/app/modules/navigation_bar/components/zoom_image/zoom_image_controller.dart';
import 'package:ofertas/app/modules/navigation_bar/navigation_bar_module.dart';

void main() {
  initModule(NavigationBarModule());
  ZoomImageController zoomimage;

  setUp(() {
    zoomimage = NavigationBarModule.to.get<ZoomImageController>();
  });

  group('ZoomImageController Test', () {
    test("First Test", () {
      expect(zoomimage, isInstanceOf<ZoomImageController>());
    });

    test("Set Value", () {
      expect(zoomimage.value, equals(0));
      zoomimage.increment();
      expect(zoomimage.value, equals(1));
    });
  });
}
