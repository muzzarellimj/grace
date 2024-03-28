class ThemeUtility {
  static const double _defaultSpacing = 8.0;

  static double calculateSpacing(double factor) {
    double spacing = _defaultSpacing * factor;

    return spacing > 0 ? spacing : _defaultSpacing;
  }

  static int valueOrOne(int value) {
    return value > 0 ? value.toInt() : 1;
  }
}
