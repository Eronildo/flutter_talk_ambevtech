import 'package:flutter/material.dart';
import 'package:flutter_talk/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter Controller Tests', () {
    testWidgets('Change widget title', (WidgetTester tester) async {
      await tester.pumpWidget(const MainApp());

      final addButton = find.byIcon(Icons.add);

      expect(addButton, findsOneWidget);

      expect(find.text('TESTE'), findsOneWidget);

      final title = find.text('Flutter Talk');

      expect(title, findsOneWidget);

      await tester.tap(addButton);
      await tester.pump();

      expect(title, findsNothing);
    });
  });
}
