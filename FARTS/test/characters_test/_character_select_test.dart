import 'package:FARTS/characters/character_model.dart';
import 'package:FARTS/characters/character_service.dart';
import 'package:FARTS/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:FARTS/characters/character_select.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets(
    'test for drawer Mode',
    (WidgetTester tester) async {
      var x = CharacterService(userId: 'jj');
      MaterialApp app = MaterialApp(
        home: Builder(builder: (BuildContext context) {
          return StreamProvider<List<Character>>.value(
            value: x.chars,
            child: CharacterList(),
          );
        }),
      );

      await tester.pumpWidget(app);
    },
  );
}
