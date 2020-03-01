import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:ofertas/app/modules/navigation_bar/components/perfil_empresa/perfil_empresa_page.dart';

main() {
  testWidgets('PerfilEmpresaPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(PerfilEmpresaPage(title: 'PerfilEmpresa')));
    final titleFinder = find.text('PerfilEmpresa');
    expect(titleFinder, findsOneWidget);
  });
}
