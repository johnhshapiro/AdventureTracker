import 'package:FARTS/characters/inventory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'test for custom scaffold Drawer',
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: InventoryPage(),
      ));
      expect(find.byType(Text), findsOneWidget);
    },
  );
}
