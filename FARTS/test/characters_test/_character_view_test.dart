import 'package:FARTS/characters/character_model.dart';
import 'package:FARTS/characters/character_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('character view test', (WidgetTester tester) async {
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
      home: CharacterView(
        character: char,
      ),
    ));
  });
}
