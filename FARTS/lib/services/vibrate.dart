import 'package:flutter/services.dart';
import 'dart:io';

class Vibrate {
  void smallRoll() {
    HapticFeedback.lightImpact();
    sleep(Duration(milliseconds: 90));
    HapticFeedback.mediumImpact();
    sleep(Duration(milliseconds: 30));
    HapticFeedback.heavyImpact();
    sleep(Duration(milliseconds: 60));
    HapticFeedback.heavyImpact();
    sleep(Duration(milliseconds: 80));
    HapticFeedback.lightImpact();
    sleep(Duration(milliseconds: 20));
    HapticFeedback.heavyImpact();
  }

  void bigRoll() {
    HapticFeedback.lightImpact();
    sleep(Duration(milliseconds: 20));
    HapticFeedback.mediumImpact();
    sleep(Duration(milliseconds: 30));
    HapticFeedback.heavyImpact();
    sleep(Duration(milliseconds: 60));
    HapticFeedback.heavyImpact();
    HapticFeedback.lightImpact();
    sleep(Duration(milliseconds: 20));
    HapticFeedback.mediumImpact();
    sleep(Duration(milliseconds: 30));
    HapticFeedback.lightImpact();
    sleep(Duration(milliseconds: 60));
    HapticFeedback.mediumImpact();
    HapticFeedback.lightImpact();
    sleep(Duration(milliseconds: 90));
    HapticFeedback.mediumImpact();
    sleep(Duration(milliseconds: 100));
    HapticFeedback.lightImpact();
    sleep(Duration(milliseconds: 60));
    HapticFeedback.heavyImpact();
  }

  void epicRoll() {
    HapticFeedback.lightImpact();
    sleep(Duration(milliseconds: 1));
    HapticFeedback.lightImpact();
    sleep(Duration(milliseconds: 1));
    HapticFeedback.mediumImpact();
    sleep(Duration(milliseconds: 1));
    HapticFeedback.heavyImpact();
    sleep(Duration(milliseconds: 7));
    HapticFeedback.lightImpact();
    sleep(Duration(milliseconds: 5));
    HapticFeedback.heavyImpact();
    sleep(Duration(milliseconds: 3));
    HapticFeedback.lightImpact();
    sleep(Duration(milliseconds: 8));
    HapticFeedback.mediumImpact();
    sleep(Duration(milliseconds: 12));
    HapticFeedback.mediumImpact();
    sleep(Duration(milliseconds: 12));
    HapticFeedback.mediumImpact();
    sleep(Duration(milliseconds: 12));
    HapticFeedback.lightImpact();
    sleep(Duration(milliseconds: 20));
    HapticFeedback.lightImpact();
    sleep(Duration(milliseconds: 20));
    HapticFeedback.lightImpact();
    sleep(Duration(milliseconds: 20));
    HapticFeedback.lightImpact();
    sleep(Duration(milliseconds: 10));
    HapticFeedback.heavyImpact();
    sleep(Duration(milliseconds: 30));
    HapticFeedback.heavyImpact();
    sleep(Duration(milliseconds: 50));
    HapticFeedback.lightImpact();
    sleep(Duration(milliseconds: 30));
    HapticFeedback.heavyImpact();
    sleep(Duration(milliseconds: 100));
    HapticFeedback.lightImpact();
    sleep(Duration(milliseconds: 30));
    HapticFeedback.heavyImpact();
    sleep(Duration(milliseconds: 100));
    HapticFeedback.lightImpact();
    sleep(Duration(milliseconds: 30));
    HapticFeedback.heavyImpact();
    sleep(Duration(milliseconds: 50));
    HapticFeedback.lightImpact();
    sleep(Duration(milliseconds: 30));
    HapticFeedback.heavyImpact();
    sleep(Duration(milliseconds: 40));
    HapticFeedback.lightImpact();
    sleep(Duration(milliseconds: 100));
    HapticFeedback.heavyImpact();
    sleep(Duration(milliseconds: 100));
    HapticFeedback.lightImpact();
    sleep(Duration(milliseconds: 100));
    HapticFeedback.heavyImpact();
    sleep(Duration(milliseconds: 100));
    HapticFeedback.lightImpact();
  }
}
