import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:ofertas/app/modules/publicar_ofertas/components/publicar_cartaz/publicar_cartaz_page.dart';

main() {
  testWidgets('PublicarCartazPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(PublicarCartazPage(title: 'PublicarCartaz')));
    final titleFinder = find.text('PublicarCartaz');
    expect(titleFinder, findsOneWidget);
  });
}
