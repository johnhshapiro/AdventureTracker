import 'package:flutter/material.dart';
import "package:flutter_test/flutter_test.dart";

// Relevant pages.
import 'package:FARTS/campaignview/add_load_campaign_view.dart';

void main() {
  group('add_load_campaign_view page widget tests', () {

    testWidgets('Page widgets are present', (WidgetTester tester) async {
      MaterialApp app = MaterialApp(home: GameMaster());
      await tester.pumpWidget(app);
  
      expect(find.byType(GameMaster), findsOneWidget);
      expect(find.byType(Scaffold), findsWidgets);
      expect(find.byType(Container), findsWidgets);
    });

  });

}
