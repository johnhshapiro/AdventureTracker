import 'package:FARTS/authwrapper.dart';
import 'package:FARTS/homepage.dart';
import 'package:FARTS/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MockFirebaseUser extends Mock implements FirebaseUser {}

void main() {
  testWidgets(
      'FirebaseUser not null goes to homepage and null goes to loginpage',
      (WidgetTester tester) async {
    final mockUser = new MockFirebaseUser();
    await tester.pumpWidget(
      MaterialApp(
        home: AuthWrapper().showCorrectPage(null),
      ),
    );
    expect(find.byType(LoginPage), findsOneWidget);
    await tester.pumpWidget(
      MaterialApp(
        home: AuthWrapper().showCorrectPage(mockUser),
      ),
    );
    expect(find.byType(HomePage), findsOneWidget);
  });
}
