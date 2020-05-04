import 'package:FARTS/characters/character_info.dart';
import 'package:flutter/material.dart';
import "package:flutter_test/flutter_test.dart";

// Relevant pages
import 'package:FARTS/campaignview/campaign_info.dart';

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
}
