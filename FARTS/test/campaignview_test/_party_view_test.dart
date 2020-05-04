import 'package:FARTS/campaignview/party_view.dart';
import 'package:FARTS/models/campaign_model.dart';
import 'package:FARTS/services/stream.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

main() {
  group('showCorrectWidgetFunctions correctly', () {
    CampaignModel campaign = CampaignModel(party: ['fu', 'bar']);
    testWidgets('showCorrectWidget functions correctly when given a CampaignModel', (WidgetTester tester) async {
      MaterialApp app = MaterialApp(home: showCorrectWidget(campaign, partyViewWidget(campaign)));
      await tester.pumpWidget(app);
      expect(find.byType(Scaffold), findsOneWidget);
    });
    testWidgets('showCorrectWidget functions correctly when given null', (WidgetTester tester) async {
      MaterialApp app = MaterialApp(home: showCorrectWidget(null, partyViewWidget(campaign)));
      await tester.pumpWidget(app);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}