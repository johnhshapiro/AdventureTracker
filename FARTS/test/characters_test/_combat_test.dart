import 'package:FARTS/characters/combat.dart';
import 'package:FARTS/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets(
    'test for custom scaffold Drawer',
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: CombatPage(),
      ));
      expect(find.byType(Text), findsOneWidget);
    },
  );
}
