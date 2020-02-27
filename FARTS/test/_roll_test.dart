import 'package:flutter_test/flutter_test.dart';

// Relevant pages
import 'package:FARTS/roll.dart';

void main() {

  group('Roll class ', () {
    final app = Roll();

    app.rollInRange(0, 1);
    app.rollMultipleInRange(0, 1, 1, 1);
  });

}