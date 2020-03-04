import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:FARTS/createnewuserpage.dart';
import 'package:FARTS/selectmodepage.dart';
import 'package:FARTS/viewcampaignpage.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {

  group('CREATE NEW USER PAGE widget tests', () {
    testWidgets('Create new user button is present and triggers navigation', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: CreateNewUser(),
          navigatorObservers: [mockObserver],
        ),
      );
      Finder username = find.text("Username");
      Finder email = find.text("Email Address");
      Finder password = find.text("Password");
      Finder confpwd = find.text("Confirm Password");

      // await tester.enterText(username, "name");
      await tester.pump();

      expect(find.text('Create'), findsOneWidget);
      await tester.tap(find.text('Create'));
      await tester.pumpAndSettle();

      verify(mockObserver.didPush(any, any));
      expect(find.byType(CreateNewUser), findsOneWidget);

    });
  });
}