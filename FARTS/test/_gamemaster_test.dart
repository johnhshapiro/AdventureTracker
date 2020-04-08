import 'package:flutter/material.dart';
import "package:flutter_test/flutter_test.dart";

// Relevant pages.
import 'package:FARTS/campaignview/gamemaster_view.dart';

void main() {
  group('View Gamemaster page widget tests', () {

    testWidgets('View gamemaster page widgets are present', (WidgetTester tester) async {
      MaterialApp app = MaterialApp(home: GameMaster());
      await tester.pumpWidget(app);
  
      expect(find.byType(GameMaster), findsOneWidget);
      expect(find.byType(Scaffold), findsWidgets);
      expect(find.byType(Container), findsWidgets);
    });

  });

}
