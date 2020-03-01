import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:ofertas/app/modules/navigation_bar/navigation_bar_page.dart';

main() {
  testWidgets('NavigationBarPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(NavigationBarPage(title: 'NavigationBar')));
    final titleFinder = find.text('NavigationBar');
    expect(titleFinder, findsOneWidget);
  });
}
