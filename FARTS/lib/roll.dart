import 'dart:math';

class Roll {
  final _random = Random();

  // You can call this Shorthand function by calling Roll().rollInRange(int minRange, int maxRange)
  // Returns a positive random integer uniformly distributed on the range from min inclusive to max exclusive.
  // *** NOTE *** if u want to roll a d6 you would pass 1 and 7 as the values NOT 1 and 6.
  int rollInRange(int min, int max) => min + _random.nextInt(max - min);

}