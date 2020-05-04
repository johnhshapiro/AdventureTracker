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

  testWidgets('test Ability Scores and Skills onTap',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CharacterSheetPage(character: null),
    ));
    expect(find.byType(Scaffold), findsOneWidget);

    Finder signOutButton = find.byKey(Key('Ability Scores'));

    await tester.tap(signOutButton);

    await tester.pumpAndSettle(Duration(seconds: 2));
  });

  testWidgets('test Combat and inventory onTap', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CharacterSheetPage(character: null),
    ));
    expect(find.byType(Scaffold), findsOneWidget);

    Finder signOutButton = find.byKey(Key('Combat'));

    await tester.tap(signOutButton);

    await tester.pumpAndSettle(Duration(seconds: 2));
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
