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
    testWidgets('game master mode button is present',
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
      verify(mockObserver.didPush(any, any));
      expect(find.byType(SelectModePage), findsOneWidget);
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
      verify(mockObserver.didPush(any, any));
      expect(find.byType(SelectModePage), findsOneWidget);
    });
    testWidgets('game master mode button is present',
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
      verify(mockObserver.didPush(any, any));
      expect(find.byType(SelectModePage), findsOneWidget);
    });
  });
}
