import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:ofertas/app/modules/navigation_bar/components/feed/components/empresas_view/empresas_view_widget.dart';

main() {
  testWidgets('EmpresasViewWidget has message', (WidgetTester tester) async {
    // await tester.pumpWidget(buildTestableWidget(EmpresasViewWidget()));
    final textFinder = find.text('EmpresasView');
    expect(textFinder, findsOneWidget);
  });
}
