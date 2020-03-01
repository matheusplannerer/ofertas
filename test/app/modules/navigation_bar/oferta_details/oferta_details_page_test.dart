import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:ofertas/app/modules/navigation_bar/components/oferta_details/oferta_details_page.dart';

main() {
  testWidgets('OfertaDetailsPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(OfertaDetailsPage(title: 'OfertaDetails')));
    final titleFinder = find.text('OfertaDetails');
    expect(titleFinder, findsOneWidget);
  });
}
