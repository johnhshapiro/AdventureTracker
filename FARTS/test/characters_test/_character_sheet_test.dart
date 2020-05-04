import 'package:FARTS/characters/character_model.dart';
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

  testWidgets('CharacterSheetPage instant test', (WidgetTester tester) async {
    Character char = Character(
      alignment: 'test',
      attacksAndSpells: 'df',
      background: 'fas',
      classes: 'nadf',
      experiencePoints: '12',
      inventory: '12',
      languages: 'asd',
      name: 'name',
      notes: 'asfadf',
      race: 'dsdfgs',
      skills: 'afd',
      stats: '12',
      campaignId: '123',
      userId: 'user',
    );
    await tester.pumpWidget(MaterialApp(
      home: CharacterSheetPage(character: char),
    ));
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
