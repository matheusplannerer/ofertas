import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:ofertas/app/modules/cadastro_empresa/cadastro_empresa_page.dart';

main() {
  testWidgets('CadastroEmpresaPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(CadastroEmpresaPage(title: 'CadastroEmpresa')));
    final titleFinder = find.text('CadastroEmpresa');
    expect(titleFinder, findsOneWidget);
  });
}
