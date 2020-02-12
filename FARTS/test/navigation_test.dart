import 'package:flutter_test/flutter_test.dart';
import 'package:FARTS/main.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  // Test adapted from Iiro Krankka from page
  // https://stackoverflow.com/questions/50704647/how-to-test-navigation-via-navigator-in-flutter
  // From the flutter.dev docs: https://flutter.dev/docs/cookbook/testing/widget/introduction
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
      expect(find.byType(MainMenuPage), findsOneWidget);
    });
    testWidgets('New user button is present and triggers navigation after tapped',
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
    testWidgets('Create new user button is present and triggers navigation after tapped',
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

  group('SELECT MODE PAGE NAVBAR widget tests', () {
    testWidgets('NavBar Home Button test',
      (WidgetTester tester) async {
        final mockObserver = MockNavigatorObserver();
        await tester.pumpWidget(
          MaterialApp(
            home: MainMenuPage(),
            navigatorObservers: [mockObserver],
          ),
        );

        expect(find.text('Home'), findsOneWidget);
        await tester.tap(find.text('Home'));
        await tester.pumpAndSettle();

        verify(mockObserver.didPush(any, any));
        expect(find.byType(MainMenuPage), findsOneWidget);
    });
    testWidgets('NavBar Sheets Button test',
      (WidgetTester tester) async {
        final mockObserver = MockNavigatorObserver();
        await tester.pumpWidget(
          MaterialApp(
            home: MainMenuPage(),
            navigatorObservers: [mockObserver],
          ),
        );

        expect(find.text('Sheets'), findsOneWidget);
        await tester.tap(find.text('Sheets'));
        await tester.pumpAndSettle();

        verify(mockObserver.didPush(any, any));
        expect(find.byType(MainMenuPage), findsOneWidget);
    });
    testWidgets('NavBar Rules Button test',
      (WidgetTester tester) async {
        final mockObserver = MockNavigatorObserver();
        await tester.pumpWidget(
          MaterialApp(
            home: MainMenuPage(),
            navigatorObservers: [mockObserver],
          ),
        );

        expect(find.text('Rules'), findsOneWidget);
        await tester.tap(find.text('Rules'));
        await tester.pumpAndSettle();

        verify(mockObserver.didPush(any, any));
        expect(find.byType(MainMenuPage), findsOneWidget);
    });
    testWidgets('NavBar Spells Button test',
      (WidgetTester tester) async {
        final mockObserver = MockNavigatorObserver();
        await tester.pumpWidget(
          MaterialApp(
            home: MainMenuPage(),
            navigatorObservers: [mockObserver],
          ),
        );

        expect(find.text('Spells'), findsOneWidget);
        await tester.tap(find.text('Spells'));
        await tester.pumpAndSettle();

        verify(mockObserver.didPush(any, any));
        expect(find.byType(MainMenuPage), findsOneWidget);
    });
  });
  testWidgets('NavBar Profile Button test',
      (WidgetTester tester) async {
        final mockObserver = MockNavigatorObserver();
        await tester.pumpWidget(
          MaterialApp(
            home: MainMenuPage(),
            navigatorObservers: [mockObserver],
          ),
        );

        expect(find.text('Profile'), findsOneWidget);
        await tester.tap(find.text('Profile'));
        await tester.pumpAndSettle();

        verify(mockObserver.didPush(any, any));
        expect(find.byType(MainMenuPage), findsOneWidget);
    });
}
