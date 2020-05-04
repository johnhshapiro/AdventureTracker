import 'package:FARTS/characters/character_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:FARTS/characters/ability_scores_and_skills.dart';

void main() {
  testWidgets('ability score cell instance test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: abilityScoreCell('name', 0),
      ),
    );
    expect(find.byType(StaggeredGridView), findsOneWidget);
  });
  testWidgets('skill cell instance test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: skillCell(0, 'name'),
      ),
    );
    expect(find.byType(StaggeredGridView), findsOneWidget);
  });

  testWidgets('AbilityScoresPage instance test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: AbilityScoresPage(
          character: null,
        ),
      ),
    );
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
