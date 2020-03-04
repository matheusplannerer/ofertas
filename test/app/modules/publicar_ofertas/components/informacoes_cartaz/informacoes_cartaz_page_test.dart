import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:ofertas/app/modules/publicar_ofertas/components/informacoes_cartaz/informacoes_cartaz_page.dart';

main() {
  testWidgets('InformacoesCartazPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(InformacoesCartazPage(title: 'InformacoesCartaz')));
    final titleFinder = find.text('InformacoesCartaz');
    expect(titleFinder, findsOneWidget);
  });
}
