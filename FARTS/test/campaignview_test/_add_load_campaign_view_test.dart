import 'package:FARTS/campaignview/add_load_campaign_view.dart';
import 'package:FARTS/models/user_model.dart';
import 'package:FARTS/services/stream.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

main() {
  group('showCorrectWidgetFunctions correctly', () {
    UserData user = UserData(uid: 'M8OTV0XlKcW6l4YhGyUCNY74Sfj1');
    testWidgets(
        'showCorrectWidget functions correctly when given a CampaignModel',
        (WidgetTester tester) async {
      MaterialApp app = MaterialApp(
          home: showCorrectWidget(user, addLoadCampaignWidget(user.uid)));
      await tester.pumpWidget(app);
      expect(find.byType(Scaffold), findsOneWidget);
    });
    testWidgets('showCorrectWidget functions correctly when given null',
        (WidgetTester tester) async {
      MaterialApp app = MaterialApp(
          home: showCorrectWidget(null, addLoadCampaignWidget(user.uid)));
      await tester.pumpWidget(app);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
