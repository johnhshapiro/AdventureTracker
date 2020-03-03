import 'package:flutter/material.dart';
import "package:flutter_test/flutter_test.dart";

// Relevant pages
import 'package:FARTS/viewcampaignpage.dart';

void main() {
  group('View Campaign page widget tests', () {

    testWidgets('View campaign page widgets are present', (WidgetTester tester) async {
      MaterialApp app = MaterialApp(home: Scaffold(body: Campaign(),),);
      await tester.pumpWidget(app);

      // Make sure these widgets are on the view campaign page.
      expect(find.byType(Campaign), findsOneWidget);
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('View Campaign Text is present', (WidgetTester tester) async {
      MaterialApp app = MaterialApp(home: Scaffold(body: Campaign(),),);
      await tester.pumpWidget(app);

      // Make sure all the text is showing correctly.
    });

  });

//   test('Album Class tests',  () {
//     final tester = Album();

//     // Make sure the local variables are initially null.
//     expect(tester.userId, null);
//     expect(tester.id, null);
//     expect(tester.title, null);
//   });
}