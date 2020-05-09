import 'package:FARTS/campaignview/encounter_view.dart';
import 'package:FARTS/models/campaign_model.dart';
import 'package:FARTS/services/stream.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

main() {
  group('showCorrectWidgetFunctions correctly', () {
    CampaignModel campaign = CampaignModel(encounters: ['fu', 'bar']);
    testWidgets(
        'showCorrectWidget functions correctly when given a CampaignModel',
        (WidgetTester tester) async {
      MaterialApp app = MaterialApp(
          home: showCorrectWidget(campaign, encounterViewWidget(campaign)));
      await tester.pumpWidget(app);
      expect(find.byType(Scaffold), findsOneWidget);
    });
    testWidgets('showCorrectWidget functions correctly when given null',
        (WidgetTester tester) async {
      MaterialApp app = MaterialApp(
          home: showCorrectWidget(null, encounterViewWidget(campaign)));
      await tester.pumpWidget(app);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
