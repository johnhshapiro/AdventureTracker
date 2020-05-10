import 'package:flutter/material.dart';
import "package:flutter_test/flutter_test.dart";
import 'package:FARTS/characters/character_model.dart';
import 'package:FARTS/custom_scaffold.dart';


// Relevant pages
import 'package:FARTS/characters/character_view.dart';
import '_mock_character.dart';

void main() {
  group('character_view builds correctly', () {
    Character mockChar = MockCharacter().mockCharacter;
    testWidgets('character_view builds with character', (WidgetTester tester ) async {
          MaterialApp app = MaterialApp(
            home: CharacterView(character: mockChar)
          );

          await tester.pumpWidget(app);
          expect(find.byType(CustomScaffold), findsOneWidget);
    });
  });
}
