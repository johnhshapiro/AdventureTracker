import 'package:flutter_test/flutter_test.dart';
import 'package:FARTS/main.dart';

/*

This file is where any unit tests will go. *NOTE* the private elements of the app ( _underscore prefix) cannot be accesed by unit tests so 
generally we will use widget testing instead of unit testing. Any PUBLIC declarations, classes, functions etc... can be accessed 
from this file (and should be) for testing. Below I created one unit test just to show how this works and it is testing that the public variable
testVar in the root BoardsEdgewidget is set to 0.

 */
void main() {
  group('BoardsEdgde root tests', () {
    test('unitTestVar should be set to 0', () {
      expect(BoardsEdge().unitTestVar, 0);
    });
    test('', () {
      // Other related unit test(s) can go in the same group, otherwise create a new group or test.
    });
  });
}
