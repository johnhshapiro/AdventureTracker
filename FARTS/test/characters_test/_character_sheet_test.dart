import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:FARTS/characters/character_sheet.dart';

void main() {
  testWidgets('CharacterSheetPage instant test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CharacterSheetPage(character: null),
    ));
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
