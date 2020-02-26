import 'dart:math';

import 'package:FARTS/vibrate.dart';

class Roll {
  final _random = Random();

  // TODO check for bad parameter passing, throw meaningful errors. TRY USING ASSERTIONS

  // TODO take more paramters for number of dice (put shorthand function in a loop to achieve this)

  // You can call this Shorthand function by calling Roll().rollInRange(int minRange, int maxRange)
  // Returns a positive random integer uniformly distributed on the range from min inclusive to max exclusive.
  // *** NOTE *** if u want to roll a d6 you would pass 1 and 7 as the values NOT 1 and 6.
  int rollInRange(int minInclusive, int maxExclusive) => minInclusive + _random.nextInt(maxExclusive - minInclusive);


  int rollMultipleInRange(int minInclusive, int maxExclusive, int numDice, int addToTotal) {
      int _rollTotal = 0;

      if (numDice < 0 || maxExclusive < minInclusive || addToTotal == null) {
        throw Exception('Error: called rollMultipleInRange with incorrect paramters');
      }

      for (int i = 0; i < numDice; i ++) {
        _rollTotal += minInclusive + _random.nextInt(maxExclusive - minInclusive) ;
      }

      return _rollTotal + addToTotal;
  }

}
