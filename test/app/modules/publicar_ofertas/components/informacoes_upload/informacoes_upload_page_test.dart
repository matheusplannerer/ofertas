import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:ofertas/app/modules/publicar_ofertas/components/informacoes_upload/informacoes_upload_page.dart';

main() {
  testWidgets('InformacoesUploadPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(InformacoesUploadPage(title: 'InformacoesUpload')));
    final titleFinder = find.text('InformacoesUpload');
    expect(titleFinder, findsOneWidget);
  });
}
