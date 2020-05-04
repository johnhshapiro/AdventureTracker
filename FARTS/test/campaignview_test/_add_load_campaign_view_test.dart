import 'package:FARTS/campaignview/add_load_campaign_view.dart';
import 'package:FARTS/campaignview/campaign_view.dart';
import 'package:FARTS/models/user_model.dart';
import 'package:FARTS/services/stream.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

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
      
    final instance = MockFirestoreInstance();
    testWidgets('addLoadCampaignStack builds correctly',
        (WidgetTester tester) async {

      // Building mock data with which to test
      await instance.collection('campaigns').document('M8OTV0XlKcW6l4YhGyUCNY74Sfj1').setData({
        'name': 'Shrek it up'
        ''
      });
      final mockObserver = MockNavigatorObserver();
      final snapshotData = await instance.collection('campaigns').getDocuments();
      MaterialApp app = MaterialApp(
        navigatorObservers: [mockObserver],
        home: Builder(
            builder:
                (BuildContext context) {        
              return addLoadCampaignStack(context, snapshotData);
            }),
      );
      await tester.pumpWidget(app);
      await tester.tap(find.text("Shrek it up"));
      // Two pumps because pump and settle times out...
      await tester.pump();
      await tester.pump();
      verify(mockObserver.didPush(any, any));
      expect(find.byType(CampaignView), findsOneWidget);
    });
  });
}
