import 'package:flutter_test/flutter_test.dart';
import 'package:FARTS/main.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() { 

  /// Test adapted from Iiro Krankka from page
  /// https://stackoverflow.com/questions/50704647/how-to-test-navigation-via-navigator-in-flutter
  testWidgets('Button is present and triggers navigation after tapped',
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
}
