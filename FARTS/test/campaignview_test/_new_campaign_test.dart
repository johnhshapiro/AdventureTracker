import 'package:FARTS/campaignview/new_campaign.dart';
import 'package:FARTS/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final Firestore db = Firestore.instance;
Stream<User> get fakeUser {
  return db
      .collection('users')
      .document('FTEWHzJeXEOUyrtzGlZ3ciBVrrF2')
      .snapshots()
      .map((doc) => User.fromMap(doc));
}

main() {
   group('showWidgetFunctions correctly', () {
     UserData user = UserData(uid: 'M8OTV0XlKcW6l4YhGyUCNY74Sfj1');
         testWidgets('Can build newCampaign widget and call scaffold',
        (WidgetTester tester) async {
          MaterialApp app = MaterialApp(home: CreateNewCampaign(user.uid));
    
      await tester.pumpWidget(app);
      expect(find.byType(Scaffold), findsWidgets);

      Finder createCampaignButton = find.byKey(Key('Checking Input'));
      await tester.tap(createCampaignButton);
      
      
        });
   });
   
}