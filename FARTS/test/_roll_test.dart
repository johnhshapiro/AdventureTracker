import 'package:FARTS/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

// Relevant pages
import 'package:FARTS/services/roll.dart';

void main() {
  test('Roll class ', () {
    final app = Roll();

    var k = app.rollInRange(0, 1);
    expect(k, 1);
    app.rollMultipleInRange(0, 1, 1, 1);
  });

  test('User instance test ', () {
    final app = User(uid: 'fwef');

    expect(app.uid, 'fwef');
  });
}
