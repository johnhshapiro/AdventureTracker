import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Relevant pages
import 'package:FARTS/services/vibrate.dart';

void main() {
  
  group('Vibrate class and fucntions tests', () {

    test('Test roll methods', () {
      WidgetsFlutterBinding.ensureInitialized();
      final app = new Vibrate();

      app.smallRoll();
      app.bigRoll();
      app.epicRoll();

    });

  });

}

