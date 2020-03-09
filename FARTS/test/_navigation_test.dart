import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:FARTS/createnewuserpage.dart';
import 'package:FARTS/selectmodepage.dart';
import 'package:FARTS/screens/campaigns/viewcampaignpage.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  
  group('SELECT MODE PAGE widget tests', () {
    // testWidgets('game master mode button is present', (WidgetTester tester) async {
    //   final mockObserver = MockNavigatorObserver();
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: SelectModePage(),
    //       navigatorObservers: [mockObserver],
    //     ),
    //   );

    //   expect(find.text('Game Master'), findsOneWidget);
    //   await tester.tap(find.text('Game Master'));
    //   verify(mockObserver.didPush(any, any));
    //   expect(find.byType(SelectModePage), findsOneWidget);
    // });

    // testWidgets('adventurer mode button is present', (WidgetTester tester) async {
    //   final mockObserver = MockNavigatorObserver();
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: SelectModePage(),
    //       navigatorObservers: [mockObserver],
    //     ),
    //   );

    //   expect(find.text('Adventurer'), findsOneWidget);
    //   await tester.tap(find.text('Adventurer'));
    //   verify(mockObserver.didPush(any, any));
    //   expect(find.byType(SelectModePage), findsOneWidget);
    // });
  });

  group("View Campaign Page Widget Tests", () {
    // testWidgets('game master mode button is present', (WidgetTester tester) async {
    //   final mockObserver = MockNavigatorObserver();
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: SelectModePage(),
    //       navigatorObservers: [mockObserver],
    //     ),
    //   );
    //  // TODO test for character stream not just for text 
    //   expect(find.text('Game Master'), findsOneWidget);
    //   await tester.tap(find.text('Game Master'));
    //   verify(mockObserver.didPush(any, any));
    //   expect(find.byType(SelectModePage), findsOneWidget);
    // });
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
