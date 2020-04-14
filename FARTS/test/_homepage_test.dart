import 'package:flutter/material.dart';
import "package:flutter_test/flutter_test.dart";
import 'package:mockito/mockito.dart';
import '_navigation_test.dart';

// Relevant pages
import 'package:FARTS/homepage.dart';

void main() {
  group('Homepage widget tests.', () {
    testWidgets('Contain root widget, indexed stack, bottom navbar.',
        (WidgetTester tester) async {
      // Create an instance of the HomePage widget and pump it.
      //MaterialApp app = MaterialApp(home: HomePage());
      //await tester.pumpWidget(app);

      // Make sure these widgets are present.
      //expect(find.byType(HomePage), findsOneWidget);
      //expect(find.byType(IndexedStack), findsOneWidget);
      //expect(find.byType(BottomNavigationBar), findsOneWidget);
    });

    //   testWidgets('NavBar text and icons are present', (WidgetTester tester) async {
    //     MaterialApp app = MaterialApp(home: HomePage());
    //     await tester.pumpWidget(app);

    //     // Make sure all the NavBar text is present and correct.
    //     expect(find.text('Map'), findsOneWidget);
    //     expect(find.text('Campaign'), findsOneWidget);

    //     // Make sure the Icons are on the NavBar
    //     expect(find.byType(Icon), findsWidgets);
    // });

    testWidgets('NavBar navigation tests', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      //MaterialApp app = MaterialApp(home: HomePage(), navigatorObservers: [mockObserver]);
      //await tester.pumpWidget(app);

      //await tester.tap(find.text("Map"));
      //await tester.tap(find.text("Campaign"));
      //await tester.tap(find.text("Party"));
      //verify(mockObserver.didPush(any, any));
    });
  });
}
