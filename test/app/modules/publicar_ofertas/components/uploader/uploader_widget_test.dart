import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:ofertas/app/modules/publicar_ofertas/components/uploader/uploader_widget.dart';

main() {
  testWidgets('UploaderWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(UploaderWidget()));
    final textFinder = find.text('Uploader');
    expect(textFinder, findsOneWidget);
  });
}
