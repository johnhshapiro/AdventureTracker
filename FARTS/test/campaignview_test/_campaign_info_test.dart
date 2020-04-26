import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:FARTS/services/stream.dart';
import 'package:FARTS/campaignview/campaign_info.dart';

main() {
  testWidgets('Page widgets are present', (WidgetTester tester) async {
    MaterialApp app = MaterialApp(
      home: StreamProvider.value(
        value: CampaignModelStream().streamCampaignData('CcQAZ4zjpWYozjVs8lPD'),
        child: Campaign(),
      ),
    );
    await tester.pumpWidget(app);
  });
}
