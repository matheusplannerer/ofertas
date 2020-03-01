import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:ofertas/app/modules/navigation_bar/components/feed/components/ofertas_view/ofertas_view_widget.dart';

main() {
  testWidgets('OfertasViewWidget has message', (WidgetTester tester) async {
    // await tester.pumpWidget(buildTestableWidget(OfertasViewWidget()));
    final textFinder = find.text('OfertasView');
    expect(textFinder, findsOneWidget);
  });
}
