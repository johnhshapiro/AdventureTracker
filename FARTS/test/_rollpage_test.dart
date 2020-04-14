import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Relevant Pages
import 'package:FARTS/rollpage.dart';

void main() {
  group('RollPage() Widget Tests', () {
    testWidgets('Can build RollPage() widget and call scaffold',
        (WidgetTester tester) async {
      MaterialApp app = MaterialApp(home: RollPage());

      await tester.pumpWidget(app);
      expect(find.byType(RollPage), findsOneWidget);
    });
  });

  group('DiceBag() Widget tests', () {
    testWidgets('Can build DiceBag() widget', (WidgetTester tester) async {
      MaterialApp app = MaterialApp(home: DiceBag());

      //await tester.pumpWidget(app);
    });
  });
}
