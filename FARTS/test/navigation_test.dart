import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';

//import 'package:FARTS/main.dart';
//import 'package:FARTS/selectmodepage.dart';
import 'package:FARTS/homepage.dart';
import 'package:FARTS/createnewuserpage.dart';
import 'package:FARTS/loginpage.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  // Test adapted from Iiro Krankka from page
  // https://stackoverflow.com/questions/50704647/how-to-test-navigation-via-navigator-in-flutter
  // From the flutter.dev docs: https://flutter.dev/docs/cookbook/testing/unit/mocking
  group('LOGIN PAGE widget tests', () {
    testWidgets('Login button is present and triggers navigation after tapped',
        (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: LoginPage(),
          navigatorObservers: [mockObserver],
        ),
      );

      expect(find.text('Login'), findsOneWidget);
      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      /// Verify that a push event happened
      verify(mockObserver.didPush(any, any));

      /// You'd also want to be sure that your page is now
      /// present in the screen.
      expect(find.byType(HomePage), findsOneWidget);
    });
    testWidgets(
        'New user button is present and triggers navigation after tapped',
        (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: LoginPage(),
          navigatorObservers: [mockObserver],
        ),
      );

      expect(find.text('New User'), findsOneWidget);
      await tester.tap(find.text('New User'));
      await tester.pumpAndSettle();

      verify(mockObserver.didPush(any, any));
      expect(find.byType(CreateNewUser), findsOneWidget);
    });
  });

  group('CREATE NEW USER PAGE widget tests', () {
    testWidgets(
        'Create new user button is present and triggers navigation after tapped',
        (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: CreateNewUser(),
          navigatorObservers: [mockObserver],
        ),
      );

      expect(find.text('Create'), findsOneWidget);
      await tester.tap(find.text('Create'));
      await tester.pumpAndSettle();

      verify(mockObserver.didPush(any, any));
      expect(find.byType(CreateNewUser), findsOneWidget);
    });
  });

  group('HOMEPAGE NAVBAR widget tests', () {
    testWidgets('NavBar login Button test', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(),
          navigatorObservers: [mockObserver],
        ),
      );

      expect(find.text('login'), findsOneWidget);
      await tester.tap(find.text('login'));
      await tester.pumpAndSettle();

      verify(mockObserver.didPush(any, any));
      expect(find.byType(HomePage), findsOneWidget);
    });
    testWidgets('NavBar mode Button test', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(),
          navigatorObservers: [mockObserver],
        ),
      );

      expect(find.text('mode'), findsOneWidget);
      await tester.tap(find.text('mode'));
      await tester.pumpAndSettle();

      verify(mockObserver.didPush(any, any));
      expect(find.byType(HomePage), findsOneWidget);
    });
  });

  group('Homepage non-navbar button tests', () {
    testWidgets('Game Master button widget test', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(),
          navigatorObservers: [mockObserver],
        ),
      );

      expect(find.text('Game Master'), findsOneWidget);
      await tester.tap(find.text('Game Master'));
      await tester.pumpAndSettle();

      verify(mockObserver.didPush(any, any));
      expect(find.byType(HomePage), findsOneWidget);
    });
    testWidgets('Adventurer button widget test', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(),
          navigatorObservers: [mockObserver],
        ),
      );

      expect(find.text('Adventurer'), findsOneWidget);
      await tester.tap(find.text('Adventurer'));
      await tester.pumpAndSettle();

      verify(mockObserver.didPush(any, any));
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
