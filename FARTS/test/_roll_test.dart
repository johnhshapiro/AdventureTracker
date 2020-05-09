import 'package:FARTS/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

// Relevant pages
import 'package:FARTS/services/roll.dart';

void main() {
  test('Roll class ', () {
    final app = Roll();

    var x = app.rollInRange(0, 1);
    expect(x, 0);
    var y = app.rollMultipleInRange(0, 1, 1, 0);
    expect(y, 0);
    var z = app.rollMultipleInRange(0, 1, 1, 999);
    expect(z, 999);
  });

  test('User instance test ', () {
    final app = User(uid: 'fwef');

    expect(app.uid, 'fwef');
  });
}
