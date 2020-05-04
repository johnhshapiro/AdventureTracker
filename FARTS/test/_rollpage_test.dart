import 'package:FARTS/models/user_model.dart';
import 'package:FARTS/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Relevant Pages
import 'package:FARTS/rollpage.dart';
import 'package:provider/provider.dart';

void main() {
  group('RollPage() Widget Tests', () {
    testWidgets('Can build RollPage() widget and call scaffold',
        (WidgetTester tester) async {
      MaterialApp app = MaterialApp(home: RollPage());

      await tester.pumpWidget(app);
      expect(find.byType(RollPage), findsOneWidget);
    });
  });

  testWidgets(
    'test for Drawer Settings',
    (WidgetTester tester) async {
      StreamProvider<User> app = StreamProvider<User>.value(
        value: AuthenticationService().user,
        child: MaterialApp(
          home: RollPage(),
        ),
      );

      await tester.pumpWidget(app);

      Finder signOutButton = find.byKey(Key('d6'));
      await tester.tap(signOutButton);
      await tester.longPress(signOutButton);

      await tester.pumpAndSettle(Duration(seconds: 4));
    },
  );
  testWidgets(
    'test for Drawer Settings',
    (WidgetTester tester) async {
      StreamProvider<User> app = StreamProvider<User>.value(
        value: AuthenticationService().user,
        child: MaterialApp(
          home: RollPage(),
        ),
      );

      await tester.pumpWidget(app);

      Finder signOutButton = find.byKey(Key('d10'));
      await tester.tap(signOutButton);
      await tester.longPress(signOutButton);

      await tester.pumpAndSettle(Duration(seconds: 4));
    },
  );
}
