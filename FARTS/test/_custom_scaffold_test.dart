import 'package:FARTS/models/user_model.dart';
import 'package:FARTS/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:FARTS/custom_scaffold.dart';
import 'package:FARTS/campaignview/campaign_view.dart';
import 'package:provider/provider.dart';
// class MockNavigatorObserver extends Mock implements RouteSettings {}

void main() {
  testWidgets(
    'test for custom scaffold with no nabVar',
    (WidgetTester tester) async {
      MaterialApp app = MaterialApp(home: CustomScaffold());

      await tester.pumpWidget(app);
      expect(find.byType(Scaffold), findsOneWidget);
    },
  );
  testWidgets(
    'test for custom scaffold Drawer',
    (WidgetTester tester) async {
      StreamProvider<User> app = StreamProvider<User>.value(
        value: AuthenticationService().user,
        child: MaterialApp(
          home: CustomScaffold(
            appBarVis: false,
            nabVar: true,
            routeList: <Widget>[],
            navBarItems: campaignNavBarItems,
          ),
        ),
      );

      await tester.pumpWidget(app);
      expect(find.byType(BottomNavigationBar), findsOneWidget);
    },
  );
  testWidgets(
    'test for custom scaffold Drawer',
    (WidgetTester tester) async {
      StreamProvider<User> app = StreamProvider<User>.value(
        value: AuthenticationService().user,
        child: MaterialApp(
          home: BuildDrawer(null),
        ),
      );

      await tester.pumpWidget(app);
      expect(find.byType(Drawer), findsOneWidget);

      Finder diceBagButton = find.byKey(Key('DiceBag'));
      await tester.tap(diceBagButton);
      await tester.pumpAndSettle(Duration(seconds: 2));
    },
  );

  testWidgets(
    'test for drawer Signout',
    (WidgetTester tester) async {
      StreamProvider<User> app = StreamProvider<User>.value(
        value: AuthenticationService().user,
        child: MaterialApp(
          home: BuildDrawer(null),
        ),
      );

      await tester.pumpWidget(app);
      expect(find.byType(Drawer), findsOneWidget);

      Finder signOutButton = find.byKey(Key('SignOut'));
      await tester.tap(signOutButton);
      await tester.pumpAndSettle(Duration(seconds: 2));
    },
  );

  // testWidgets(
  //   'test for drawer Mode',
  //   (WidgetTester tester) async {
  //     StreamProvider<User> app = StreamProvider<User>.value(
  //       value: AuthenticationService().user,
  //       child: MaterialApp(
  //         home: BuildDrawer(null),
  //       ),
  //     );

  //     await tester.pumpWidget(app);
  //     expect(find.byType(Drawer), findsOneWidget);

  //     Finder signOutButton = find.byKey(Key('Mode'));
  //     await tester.tap(signOutButton);
  //     await tester.pumpAndSettle(Duration(seconds: 2));
  //   },
  // );

  testWidgets(
    'test for Drawer Settings',
    (WidgetTester tester) async {
      StreamProvider<User> app = StreamProvider<User>.value(
        value: AuthenticationService().user,
        child: MaterialApp(
          home: BuildDrawer(null),
        ),
      );

      await tester.pumpWidget(app);

      Finder signOutButton = find.byKey(Key('Settings'));
      await tester.tap(signOutButton);
      await tester.pumpAndSettle(Duration(seconds: 2));
    },
  );
}
