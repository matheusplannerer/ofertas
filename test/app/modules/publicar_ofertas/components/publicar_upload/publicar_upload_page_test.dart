import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:ofertas/app/modules/publicar_ofertas/components/publicar_upload/publicar_upload_page.dart';

main() {
  testWidgets('PublicarUploadPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(PublicarUploadPage(title: 'PublicarUpload')));
    final titleFinder = find.text('PublicarUpload');
    expect(titleFinder, findsOneWidget);
  });
}
