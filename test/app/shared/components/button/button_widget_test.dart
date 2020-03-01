import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:ofertas/app/shared/components/button/button_widget.dart';

main() {
  testWidgets('ButtonWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(ButtonWidget()));
    final textFinder = find.text('Button');
    expect(textFinder, findsOneWidget);
  });
}
