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
  group('Dice onTap', () {
    testWidgets(
      'test for ontap Vibrate',
      (WidgetTester tester) async {
        StreamProvider<User> app = StreamProvider<User>.value(
          value: AuthenticationService().user,
          child: MaterialApp(
            home: RollPage(),
          ),
        );

        await tester.pumpWidget(app);

        Finder signOutButton = find.byKey(Key('Vibrate'));

        await tester.longPress(signOutButton);

        await tester.pumpAndSettle(Duration(seconds: 2));
      },
    );

    testWidgets(
      'test for ontap ListCount',
      (WidgetTester tester) async {
        StreamProvider<User> app = StreamProvider<User>.value(
          value: AuthenticationService().user,
          child: MaterialApp(
            home: RollPage(),
          ),
        );

        await tester.pumpWidget(app);

        Finder signOutButton = find.byKey(Key('ListCount'));

        await tester.tap(signOutButton);

        await tester.pumpAndSettle(Duration(seconds: 2));
      },
    );

    testWidgets(
      'test for ontap RollDiceIcon',
      (WidgetTester tester) async {
        StreamProvider<User> app = StreamProvider<User>.value(
          value: AuthenticationService().user,
          child: MaterialApp(
            home: RollPage(),
          ),
        );

        await tester.pumpWidget(app);

        Finder signOutButton = find.byKey(Key('RollDiceIcon'));

        await tester.tap(signOutButton);

        await tester.pumpAndSettle(Duration(seconds: 2));
      },
    );

    testWidgets(
      'test for ontap d6',
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
        await tester.tap(signOutButton);
        await tester.tap(signOutButton);
        await tester.longPress(signOutButton);

        await tester.pumpAndSettle(Duration(seconds: 4));
      },
    );
    testWidgets(
      'test for ontap d10',
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
        await tester.tap(signOutButton);
        await tester.tap(signOutButton);

        await tester.longPress(signOutButton);

        await tester.pumpAndSettle(Duration(seconds: 2));
      },
    );

    testWidgets(
      'test for ontap d4',
      (WidgetTester tester) async {
        StreamProvider<User> app = StreamProvider<User>.value(
          value: AuthenticationService().user,
          child: MaterialApp(
            home: RollPage(),
          ),
        );

        await tester.pumpWidget(app);

        Finder signOutButton = find.byKey(Key('d4'));
        await tester.tap(signOutButton);
        await tester.tap(signOutButton);
        await tester.tap(signOutButton);
        await tester.longPress(signOutButton);

        await tester.pumpAndSettle(Duration(seconds: 2));
      },
    );

    testWidgets(
      'test for ontap d12',
      (WidgetTester tester) async {
        StreamProvider<User> app = StreamProvider<User>.value(
          value: AuthenticationService().user,
          child: MaterialApp(
            home: RollPage(),
          ),
        );

        await tester.pumpWidget(app);

        Finder d12 = find.byKey(Key('d12'));
        await tester.tap(d12);
        await tester.tap(d12);
        await tester.tap(d12);
        await tester.longPress(d12);

        await tester.pumpAndSettle(Duration(seconds: 2));
      },
    );

    testWidgets(
      'test for ontap d20',
      (WidgetTester tester) async {
        StreamProvider<User> app = StreamProvider<User>.value(
          value: AuthenticationService().user,
          child: MaterialApp(
            home: RollPage(),
          ),
        );

        await tester.pumpWidget(app);

        Finder d20 = find.byKey(Key('d20'));
        await tester.tap(d20);
        await tester.tap(d20);
        await tester.tap(d20);
        await tester.longPress(d20);

        const Offset firstLocation = Offset(40.0, 20.0);
        final TestGesture gesture =
            await tester.startGesture(firstLocation, pointer: 7);
        const Offset secondLocation = Offset(10.0, 20.0);
        await gesture.moveTo(secondLocation);

        Finder d100 = find.byKey(Key('d100'));
        await tester.tap(d100);
        await tester.tap(d100);
        await tester.tap(d100);
        await tester.longPress(d100);

        await tester.pumpAndSettle(Duration(seconds: 2));
      },
    );
  });

  testWidgets(
    'test for ontap d100',
    (WidgetTester tester) async {
      StreamProvider<User> app = StreamProvider<User>.value(
        value: AuthenticationService().user,
        child: MaterialApp(
          home: RollPage(),
        ),
      );

      await tester.pumpWidget(app);

      Finder d100 = find.byKey(Key('d100'));
      await tester.tap(d100);
      const Offset firstLocation = Offset(40.0, 20.0);
      final TestGesture gesture =
          await tester.startGesture(firstLocation, pointer: 7);
      const Offset secondLocation = Offset(10.0, 20.0);
      await gesture.moveTo(secondLocation);
      await tester.tap(d100);
      await tester.tap(d100);
      await tester.longPress(d100);

      await tester.pumpAndSettle(Duration(seconds: 2));
    },
  );
}
