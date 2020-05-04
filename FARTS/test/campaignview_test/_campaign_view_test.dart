import 'package:FARTS/models/user_model.dart';
import 'package:FARTS/services/authentication.dart';
import 'package:flutter/material.dart';
import "package:flutter_test/flutter_test.dart";

// Relevant pages
import 'package:FARTS/campaignview/campaign_view.dart';
import 'package:provider/provider.dart';

void main() {
  group('View Campaign page widget tests', () {
    testWidgets('View campaign page widgets are present',
        (WidgetTester tester) async {
      StreamProvider<User> app = StreamProvider<User>.value(
        value: AuthenticationService().user,
        child: MaterialApp(
          home: CampaignView(route: false),
        ),
      );
      await tester.pumpWidget(app);
    });
  });
}
