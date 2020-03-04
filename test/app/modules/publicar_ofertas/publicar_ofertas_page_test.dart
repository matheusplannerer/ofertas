import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:ofertas/app/modules/publicar_ofertas/publicar_ofertas_page.dart';

main() {
  testWidgets('PublicarOfertasPage has title', (WidgetTester tester) async {
    // await tester.pumpWidget(
    //     buildTestableWidget(PublicarOfertasPage(title: 'PublicarOfertas')));
    final titleFinder = find.text('PublicarOfertas');
    expect(titleFinder, findsOneWidget);
  });
}
