import 'package:FARTS/characters/character_model.dart';
import 'package:FARTS/models/campaign_model.dart';
import 'package:FARTS/models/user_model.dart';
import 'package:FARTS/services/database.dart';
import 'package:FARTS/services/stream.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import "package:flutter_test/flutter_test.dart";

// Relevant pages
import 'package:FARTS/characters/character_info.dart';

import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  final instance = MockFirestoreInstance();
  await instance.collection('users').add({
    'name': 'Bob',
  });
  final snapshot = await instance.collection('users').getDocuments();
  print(snapshot.documents.length); // 1
  print(snapshot.documents.first['username']); // 'Bob'
  print(instance.dump());

  testWidgets(
    'test for drawer Mode',
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: CharacterInfoPage(
          character: null,
        ),
      ));
      expect(find.byType(Scaffold), findsOneWidget);
    },
  );

  testWidgets(
    'test for drawer Mode',
    (WidgetTester tester) async {
      Character char = Character(
        alignment: 'test',
        attacksAndSpells: 'df',
        background: 'fas',
        classes: 'nadf',
        experiencePoints: '12',
        inventory: '12',
        languages: 'asd',
        name: 'Bob',
        notes: 'asfadf',
        race: 'dsdfgs',
        skills: 'afd',
        stats: '12',
        campaignId: '123',
        userId: 'user',
      );
      await tester.pumpWidget(MaterialApp(
        home: StreamProvider<UserData>.value(
          value: DatabaseService().userData,
          child: StreamProvider<CampaignModel>.value(
            value: CampaignModelStream()
                .streamCampaignData(snapshot.documents.first),
            child: CharacterInfoPage(
              character: char,
            ),
          ),
        ),
      ));
      expect(find.byType(Scaffold), findsOneWidget);
    },
  );
}
