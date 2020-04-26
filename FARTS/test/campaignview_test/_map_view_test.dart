import 'package:FARTS/campaignview/map_view.dart';
import 'package:FARTS/models/campaign_model.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

main() {
  group('showCorrectWidgetFunctions correctly', () {
    testWidgets('showCorrectWidget functions correctly when given a CampaignModel', (WidgetTester tester) async {
      CampaignModel campaign = CampaignModel(mapName: 'The Fart Zone');
      MaterialApp app = MaterialApp(home: showCorrectWidget(campaign));
      await tester.pumpWidget(app);
      expect(find.byType(Scaffold), findsOneWidget);
    });
    testWidgets('showCorrectWidget functions correctly when given null', (WidgetTester tester) async {
      MaterialApp app = MaterialApp(home: showCorrectWidget(null));
      await tester.pumpWidget(app);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}