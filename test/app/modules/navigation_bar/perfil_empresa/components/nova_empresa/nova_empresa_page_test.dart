import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:ofertas/app/modules/navigation_bar/components/perfil_empresa/components/nova_empresa/nova_empresa_page.dart';

main() {
  testWidgets('NovaEmpresaPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(NovaEmpresaPage(title: 'NovaEmpresa')));
    final titleFinder = find.text('NovaEmpresa');
    expect(titleFinder, findsOneWidget);
  });
}
