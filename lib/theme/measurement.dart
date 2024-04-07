class Measurement {
  static const double defaultSpacing = 8.0;

  static double getSpacing(double factor) {
    double calculatedSpacing = defaultSpacing * factor;

    return calculatedSpacing > 0 ? calculatedSpacing : defaultSpacing;
  }
}
