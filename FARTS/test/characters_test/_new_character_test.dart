import 'package:FARTS/characters/new_character.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter/material.dart';

void main() {
  group('RollPage() Widget Tests', () {
    testWidgets('Can build CreateNewCharacter() widget and call scaffold',
        (WidgetTester tester) async {
      MaterialApp app = MaterialApp(home: CreateNewCharacter());

      await tester.pumpWidget(app);
      expect(find.byType(Scaffold), findsOneWidget);
    });
  });
}
