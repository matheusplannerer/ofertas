import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:ofertas/app/modules/publicar_ofertas/components/concluir_publicacao/concluir_publicacao_page.dart';

main() {
  testWidgets('ConcluirPublicacaoPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(
        ConcluirPublicacaoPage(title: 'ConcluirPublicacao')));
    final titleFinder = find.text('ConcluirPublicacao');
    expect(titleFinder, findsOneWidget);
  });
}
