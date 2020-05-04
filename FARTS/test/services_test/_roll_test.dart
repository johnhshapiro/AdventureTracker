import 'package:FARTS/services/roll.dart';
import 'package:test/test.dart';

void main() {
  test('trows exception', () {
    final roll = Roll();
    expect(() => roll.rollMultipleInRange(0, 0, -1, 0), throwsException);
  });
}
