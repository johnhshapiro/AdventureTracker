// Packages required for testing
import "package:flutter_test/flutter_test.dart";

// Packages being tested
import 'package:FARTS/screens/characters/ability_scores_and_skills.dart';

void main() {
    test('calculateModifier returns correct ability mods', (){
    expect(calculateModifier(18), 4);
    expect(calculateModifier(17), 3);
    expect(calculateModifier(16), 3);
    expect(calculateModifier(15), 2);
    expect(calculateModifier(14), 2);
    expect(calculateModifier(13), 1);
    expect(calculateModifier(12), 1);
    expect(calculateModifier(11), 0);
    expect(calculateModifier(10), 0);
    expect(calculateModifier(9), -1);
    expect(calculateModifier(8), -1);
    expect(calculateModifier(7), -2);
    expect(calculateModifier(6), -2);
    expect(calculateModifier(5), -3);
    expect(calculateModifier(4), -3);
    expect(calculateModifier(3), -4);
    
  });
}