import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:ofertas/app/modules/navigation_bar/components/perfil_empresa/components/horarios/horarios_page.dart';

main() {
  testWidgets('HorariosPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(HorariosPage(title: 'Horarios')));
    final titleFinder = find.text('Horarios');
    expect(titleFinder, findsOneWidget);
  });
}
