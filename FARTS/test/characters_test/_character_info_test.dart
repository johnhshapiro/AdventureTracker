import 'package:FARTS/campaignview/campaign_info.dart';
import 'package:FARTS/characters/character_model.dart';
import 'package:FARTS/models/campaign_model.dart';
import 'package:FARTS/models/user_model.dart';
import 'package:FARTS/services/database.dart';
import 'package:FARTS/services/stream.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import "package:flutter_test/flutter_test.dart";
import '_mock_character.dart';

// Relevant pages
import 'package:FARTS/characters/character_info.dart';

import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:provider/provider.dart';

final Firestore db = Firestore.instance;
Stream<CampaignModel> get fakeModel {
  return db
      .collection('users')
      .document('FTEWHzJeXEOUyrtzGlZ3ciBVrrF2')
      .snapshots()
      .map((doc) => CampaignModel.fromMap(doc));
}

Future<void> main() async {
  final instance = MockFirestoreInstance();
  await instance.collection('users').add({
    'name': 'Bob',
  });
  final snapshot = instance
      .collection('users')
      .document('FTEWHzJeXEOUyrtzGlZ3ciBVrrF2')
      .snapshots()
      .map((doc) => CampaignModel.fromMap(doc));
  // print(snapshot.documents.length); // 1
  // print(snapshot.documents.first['username']); // 'Bob'
  // print(instance.dump());

  testWidgets(
    'test for drawer Mode',
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: CharacterInfoPage(
          character: null,
        ),
      ));
      expect(find.byType(Center), findsOneWidget);
    },
  );

  testWidgets(
    'test for _campaignModelStream not null',
    (WidgetTester tester) async {
      print(fakeModel);
      await tester.pumpWidget(MaterialApp(
        home: StreamProvider<CampaignModel>.value(
          initialData: MockModel().mockModel,
          value: snapshot,
          child: Campaign(),
        ),
      ));
      // expect(find.byType(Scaffold), findsOneWidget);
    },
  );
}
