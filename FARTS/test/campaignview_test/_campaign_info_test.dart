import 'package:FARTS/characters/character_info.dart';
import 'package:FARTS/characters/character_model.dart';
import 'package:FARTS/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:FARTS/services/stream.dart';
import 'package:FARTS/campaignview/campaign_info.dart';

main() {
  testWidgets('Page widgets are present', (WidgetTester tester) async {
    MaterialApp app =
        MaterialApp(home: CampaignHeader('name', 'mapName', 'now'));
    await tester.pumpWidget(app);
  });
}
