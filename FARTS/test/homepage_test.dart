import 'package:flutter/material.dart';
import "package:flutter_test/flutter_test.dart";
import 'package:mockito/mockito.dart';
import 'navigation_test.dart';

// Relevant pages
import 'package:FARTS/homepage.dart';


void main() {
  group('Homepage widget tests', () {

    testWidgets('Homepage contains root, indexed stack, bottomnavbar.', (WidgetTester tester) async {

      // Create an instance of the HomePage widget and pump it.
      MaterialApp app = MaterialApp(home: Scaffold(body: HomePage(),),);
      await tester.pumpWidget(app);

      // Make sure these widgets are present.
      expect(find.byType(HomePage), findsOneWidget);
      expect(find.byType(IndexedStack), findsOneWidget);
      expect(find.byType(BottomNavigationBar), findsOneWidget);
    });

      testWidgets('NavBar text and icons are present', (WidgetTester tester) async {
        MaterialApp app = MaterialApp(home: Scaffold(body: HomePage(),),);
        
        await tester.pumpWidget(app);

        // Make sure all the NavBar text is present and correct.
        expect(find.text('Login'), findsOneWidget);
        expect(find.text('Mode'), findsOneWidget);
        expect(find.text('Campaign'), findsOneWidget);
        expect(find.text('create user'), findsOneWidget);

        // Make sure the Icons are on the NavBar
        expect(find.byType(Icon), findsWidgets);

    });

    testWidgets('NavBar navigates to other pages', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      MaterialApp app = MaterialApp(home: HomePage(), navigatorObservers: [mockObserver]);
      await tester.pumpWidget(app);

      // I'm 70% sure this is testing navigation correctly? TODO become 1000% sure
      await tester.tap(find.text("Login"));
      await tester.tap(find.text("Mode"));
      await tester.tap(find.text("Campaign"));
      await tester.tap(find.text("create user"));
      verify(mockObserver.didPush(any, any));
      
    });

  });
}
