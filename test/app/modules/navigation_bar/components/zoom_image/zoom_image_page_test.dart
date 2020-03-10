import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:ofertas/app/modules/navigation_bar/components/zoom_image/zoom_image_page.dart';

main() {
  testWidgets('ZoomImagePage has title', (WidgetTester tester) async {
    // await tester
    //     .pumpWidget(buildTestableWidget(ZoomImagePage(title: 'ZoomImage')));
    final titleFinder = find.text('ZoomImage');
    expect(titleFinder, findsOneWidget);
  });
}
