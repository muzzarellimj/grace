class Format {
  static double doubleOrOne(double value) {
    return value > 0.0 ? value : 1.0;
  }

  static int intOrOne(int value) {
    return value > 0 ? value : 1;
  }
}
