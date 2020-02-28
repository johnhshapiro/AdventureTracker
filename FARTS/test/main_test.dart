import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Relevant page imports
import 'package:FARTS/main.dart';


void main() {
  group('main.dart root page tests', () {
    testWidgets('root widget content test', (WidgetTester tester) async{
      await tester.pumpWidget(BoardsEdge());

      // This is the only widget contained in the main.dart root widget.
      expect(BoardsEdge().unitTestVar, 0);
      expect(find.byType(MaterialApp), findsOneWidget);
    });

  });
}
