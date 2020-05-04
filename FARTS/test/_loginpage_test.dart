import 'package:FARTS/createnewuserpage.dart';
import 'package:FARTS/loginpage.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('LOGIN PAGE widget tests', () {
    testWidgets('Sign in Elements are present and reject invalid input',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginPage(),
        ),
      );
      // We use finder to find the elements on the page.
      Finder email = find.byKey(new Key('email'));
      Finder password = find.byKey(new Key('password'));
      Finder signIn = find.text('Sign In');
      Finder formWidgetFinder = find.byType(Form);
      Form formWidget = tester.widget(formWidgetFinder) as Form;
      GlobalKey<FormState> formKey = formWidget.key as GlobalKey<FormState>;
      // Invalid email and short password result in invalid form
      await tester.enterText(email, "invalidEmail");
      await tester.enterText(password, "short");
      await tester.pump();
      await tester.tap(signIn);
      await tester.pumpAndSettle();
      expect(formKey.currentState.validate(), isFalse);
      expect(find.text('Invalid email address'), findsOneWidget);
      expect(find.text('Password is blank or less than 6 characters'),
          findsOneWidget);
      // Test that valid email and password works
      await tester.enterText(email, "vailid@valid.com");
      await tester.enterText(password, "valid1");
      await tester.tap(signIn);
      await tester.pumpAndSettle();
      expect(formKey.currentState.validate(), isTrue);
      expect(find.text('Invalid email address'), findsNothing);
      expect(find.text('Password is blank or less than 6 characters'),
          findsNothing);
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
}
