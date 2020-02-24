import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:FARTS/main.dart';

// Cookbook for Widget testing https://flutter.dev/docs/cookbook/testing/widget/introduction

void main() {
  testWidgets('Test BoardsEdgde root widget', (WidgetTester tester) async {
    // the tester.pumpWidget() method builds the widget(s) you aim it at to enable testing on it. You can trigger rebuild the widget (for instance if you want
    // to modify the state of a widget and test again with the updated state) by using the tester.pump() method.
    await tester.pumpWidget(BoardsEdge());

    // Now that the widget(s) have been created in the testing environment with pumpWidget(), search through the widget tree with a Finder to verify
    // they are being displayed correctly
  });
  testWidgets('Tests text widgets', (WidgetTester tester) async {
    // Build a text widget with the text.....
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Text('test text'),
      ),
    ));
    expect(find.text('test text'), findsWidgets);
  });

  testWidgets('finds a specific instance of a widget',
      (WidgetTester tester) async {
    final childWidget = Padding(padding: EdgeInsets.zero);

    // Provide the childWidget to the Container.
    await tester.pumpWidget(Container(child: childWidget));

    // Search for the childWidget in the tree and verify it exists.
    expect(find.byWidget(childWidget), findsOneWidget);
  });
}
