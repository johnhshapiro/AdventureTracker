import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

//import 'package:FARTS/main.dart';
//import 'package:FARTS/selectmodepage.dart';
// import 'package:FARTS/homepage.dart';
import 'package:FARTS/createnewuserpage.dart';
import 'package:FARTS/loginpage.dart';
import 'package:FARTS/selectmodepage.dart';
import 'package:FARTS/viewcampaignpage.dart';



class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  // Test adapted from Iiro Krankka from page
  // https://stackoverflow.com/questions/50704647/how-to-test-navigation-via-navigator-in-flutter
  // From the flutter.dev docs: https://flutter.dev/docs/cookbook/testing/unit/mocking
  group('LOGIN PAGE widget tests', () {
    testWidgets('Sign in Elements are present and reject invalid input',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginPage(),
        ),
      );
      // We use finder to find the elements on the page.
      Finder email = find.byKey(new Key ('email'));
      Finder password  = find.byKey(new Key ('password'));
      Finder signIn = find.text('Sign In');
      Finder formWidgetFinder = find.byType(Form);
      Form formWidget = tester.widget(formWidgetFinder) as Form;
      GlobalKey<FormState> formKey = formWidget.key as GlobalKey<FormState>;
      // Invalid email and short password result in invalid form
      await tester.enterText (email, "invalidEmail");
      await tester.enterText(password, "short");
      await tester.pump();
      await tester.tap(signIn);
      await tester.pumpAndSettle();
      expect(formKey.currentState.validate(), isFalse);
      expect(find.text('Invalid email address'), findsOneWidget);
      expect(find.text('Password is blank or less than 6 characters'), findsOneWidget);
      // Test that valid email and password works
      await tester.enterText (email, "vailid@valid.com");
      await tester.enterText(password, "valid1");
      await tester.tap(signIn);
      await tester.pumpAndSettle();
      expect(formKey.currentState.validate(), isTrue);
      expect(find.text('Invalid email address'), findsNothing);
      expect(find.text('Password is blank or less than 6 characters'), findsNothing);
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
  
  group('SELECT MODE PAGE widget tests', () {
    testWidgets('game master mode button is present', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: SelectModePage(),
          navigatorObservers: [mockObserver],
        ),
      );

      expect(find.text('Game Master'), findsOneWidget);
      await tester.tap(find.text('Game Master'));
      verify(mockObserver.didPush(any, any));
      expect(find.byType(SelectModePage), findsOneWidget);
    });

    testWidgets('adventurer mode button is present', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: SelectModePage(),
          navigatorObservers: [mockObserver],
        ),
      );

      expect(find.text('Adventurer'), findsOneWidget);
      await tester.tap(find.text('Adventurer'));
      verify(mockObserver.didPush(any, any));
      expect(find.byType(SelectModePage), findsOneWidget);
    });
  });

  group("View Campaign Page Widget Tests", () {
    testWidgets('game master mode button is present', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: SelectModePage(),
          navigatorObservers: [mockObserver],
        ),
      );
     // TODO test for character stream not just for text 
      expect(find.text('Game Master'), findsOneWidget);
      await tester.tap(find.text('Game Master'));
      verify(mockObserver.didPush(any, any));
      expect(find.byType(SelectModePage), findsOneWidget);
    });
  });

  group('VIEW CAMPAIGN PAGE widget tests', () {
    testWidgets('Campaign widget is present', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: Campaign(),
          navigatorObservers: [mockObserver],
        ),
      );
      // TODO improve this test right now it only check to see if the widget exists.
      expect(find.byType(Campaign), findsOneWidget);
    });

    testWidgets('Campaign text widget is present', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Text("Campaign"),
          ),
          navigatorObservers: [mockObserver],
        ),
      );
      // TODO improve this test right now it only check to see if the widget exists.
      expect(find.text("Campaign"), findsOneWidget);
    });

    testWidgets('Date/Time text widget is present', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Text("Date/Time")
          ),
          navigatorObservers: [mockObserver],
        ),
      );
      // TODO improve this test
      expect(find.text("Date/Time"), findsOneWidget);
    });

    testWidgets('Session number text widget is present', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Text("Session Number")
          ),
          navigatorObservers: [mockObserver],
        ),
      );
      // TODO improve this test
      expect(find.text("Session Number"), findsOneWidget);
    });

    testWidgets('Map text widget is present', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Text("Map")
          ),
          navigatorObservers: [mockObserver],
        ),
      );
      // TODO improve this test
      expect(find.text("Map"), findsOneWidget);
    });

    testWidgets('Notes text widget is present', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Text("Notes")
          ),
          navigatorObservers: [mockObserver],
        ),
      );
      // TODO improve this test
      expect(find.text("Notes"), findsOneWidget);
    });

    testWidgets('NPCS text widget is present', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Text("NPCS")
          ),
          navigatorObservers: [mockObserver],
        ),
      );
      // TODO improve this test
      expect(find.text("NPCS"), findsOneWidget);
    });

  });
}