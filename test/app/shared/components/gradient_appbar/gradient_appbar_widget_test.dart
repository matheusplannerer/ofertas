import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:ofertas/app/shared/components/gradient_appbar/gradient_appbar_widget.dart';

main() {
  testWidgets('GradientAppbarWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(GradientAppbarWidget()));
    final textFinder = find.text('GradientAppbar');
    expect(textFinder, findsOneWidget);
  });
}
