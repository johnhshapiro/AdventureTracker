import 'package:FARTS/selectmodepage.dart';
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

      expect(find.text('Sign In'), findsOneWidget);
      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle();

      /// Verify that a push event happened
      verify(mockObserver.didPush(any, any));

      /// You'd also want to be sure that your page is now
      /// present in the screen.
      // TODO: write a correct test here JOHN!
      //expect(find.byType(SelectModePage), findsOneWidget);
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
    testWidgets('Create new user button is present and triggers navigation', (WidgetTester tester) async {
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

  group('HOMEPAGE NavBar widget tests', () {
    testWidgets('Login button is present', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(),
          navigatorObservers: [mockObserver],
        ),
      );

      expect(find.text('Login'), findsOneWidget);
      await tester.tap(find.text('Login'));
      verify(mockObserver.didPush(any, any));
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('Mode button is present', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(),
          navigatorObservers: [mockObserver],
        ),
      );

      expect(find.text('Mode'), findsOneWidget);
      await tester.tap(find.text('Mode'));
      verify(mockObserver.didPush(any, any));
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('Campaign button is present', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(),
          navigatorObservers: [mockObserver],
        ),
      );

      expect(find.text('Campaign'), findsOneWidget);
      await tester.tap(find.text('Campaign'));
      verify(mockObserver.didPush(any, any));
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('create user button is present', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(),
          navigatorObservers: [mockObserver],
        ),
      );

      expect(find.text('create user'), findsOneWidget);
      await tester.tap(find.text('create user'));
      verify(mockObserver.didPush(any, any));
      expect(find.byType(HomePage), findsOneWidget);
    });

  });

}
