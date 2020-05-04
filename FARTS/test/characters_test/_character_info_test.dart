import 'package:FARTS/characters/character_model.dart';
import 'package:flutter/material.dart';
import "package:flutter_test/flutter_test.dart";

// Relevant pages
import 'package:FARTS/characters/character_info.dart';

void main() {
  testWidgets(
    'test for drawer Mode',
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: CharacterInfoPage(
          character: null,
        ),
      ));
      expect(find.byType(Scaffold), findsOneWidget);
    },
  );

  testWidgets(
    'test for drawer Mode',
    (WidgetTester tester) async {
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
        home: CharacterInfoPage(
          character: char,
        ),
      ));
      expect(find.byType(Scaffold), findsOneWidget);
    },
  );
}
