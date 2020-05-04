import 'package:FARTS/characters/character_info.dart';
import 'package:FARTS/characters/character_model.dart';
import 'package:FARTS/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:FARTS/services/stream.dart';
import 'package:FARTS/campaignview/campaign_info.dart';

final Firestore db = Firestore.instance;
Stream<User> get fakeUser {
  return db
      .collection('user')
      .document('FTEWHzJeXEOUyrtzGlZ3ciBVrrF2')
      .snapshots()
      .map((doc) => User.fromMap(doc));
}

main() {
  testWidgets('Page widgets are present', (WidgetTester tester) async {
    MaterialApp app =
        MaterialApp(home: CampaignHeader('name', 'mapName', 'now'));
    await tester.pumpWidget(app);
  });

  testWidgets(
    'test for drawer Mode',
    (WidgetTester tester) async {
      MaterialApp app = MaterialApp(
        home: Builder(builder: (BuildContext context) {
          return StreamProvider<User>.value(
              value: fakeUser,
              child: CharacterInfoPage(
                character: null,
              ));
        }),
      );

      await tester.pumpWidget(app);
      expect(find.byType(Scaffold), findsOneWidget);
    },
  );
}
