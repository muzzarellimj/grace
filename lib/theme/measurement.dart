class Measurement {
  static const double defaultSpacing = 8.0;
  static const double defaultSizing = 12.0;

  static double getSizing(double factor) {
    double calculatedSizing = defaultSizing * factor;

    return calculatedSizing > 0 ? calculatedSizing : defaultSizing;
  }

  static double getSpacing(double factor) {
    double calculatedSpacing = defaultSpacing * factor;

    return calculatedSpacing > 0 ? calculatedSpacing : defaultSpacing;
  }
}
