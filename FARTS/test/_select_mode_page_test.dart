import 'package:FARTS/campaignview/add_load_campaign_view.dart';
import 'package:FARTS/characters/character_select.dart';
import 'package:FARTS/models/user_model.dart';
import 'package:FARTS/services/database.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:FARTS/selectmodepage.dart';
import 'package:provider/provider.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

Widget selectModeWrappedWithProvider = StreamProvider<UserData>.value(
    value: DatabaseService(uid: 'M8OTV0XlKcW6l4YhGyUCNY74Sfj1').userData,
    child: SelectModePage());
main() {
  group('SELECT MODE PAGE widget tests', () {
    testWidgets('game master mode button is present + navigates correctly',
        (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: selectModeWrappedWithProvider,
          navigatorObservers: [mockObserver],
        ),
      );
      expect(find.text('Game Master'), findsOneWidget);
      await tester.tap(find.text('Game Master'));
      // I pumped twice because pumpAndSettle times out waiting for future
      await tester.pump();
      await tester.pump();
      verify(mockObserver.didPush(any, any));
      expect(find.byType(GameMaster), findsOneWidget);
    });
    testWidgets('game master image is present + navigates correctly',
        (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: selectModeWrappedWithProvider,
          navigatorObservers: [mockObserver],
        ),
      );
      expect(find.byKey(Key("gmImage")), findsOneWidget);
      await tester.tap(find.byKey(Key("gmImage")));
      await tester.pump();
      await tester.pump();
      verify(mockObserver.didPush(any, any));
      expect(find.byType(GameMaster), findsOneWidget);
    });
    testWidgets('adventurer mode button is present',
        (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: selectModeWrappedWithProvider,
          navigatorObservers: [mockObserver],
        ),
      );

      expect(find.text('Adventurer'), findsOneWidget);
      await tester.tap(find.text('Adventurer'));
      await tester.pump();
      await tester.pump();
      verify(mockObserver.didPush(any, any));
      expect(find.byType(CharacterSelect), findsOneWidget);
    });
    testWidgets('adventurer mode image is present',
        (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: selectModeWrappedWithProvider,
          navigatorObservers: [mockObserver],
        ),
      );

      expect(find.byKey(Key("advImage")), findsOneWidget);
      await tester.tap(find.byKey(Key("advImage")));
      await tester.pump();
      await tester.pump();
      verify(mockObserver.didPush(any, any));
      expect(find.byType(CharacterSelect), findsOneWidget);
    });
  });
}
