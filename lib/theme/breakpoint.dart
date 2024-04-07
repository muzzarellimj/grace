/// Breakpoint enumeration to support responsive scaffold building and
/// rendering, with breakpoint values based on Bootstrap.
enum Breakpoint {
  xs(minimum: 0, maximum: 576),
  sm(minimum: 576, maximum: 768),
  md(minimum: 768, maximum: 992),
  lg(minimum: 992, maximum: 1200),
  xl(minimum: 1200, maximum: double.infinity);

  final double minimum;
  final double maximum;

  const Breakpoint({
    required this.minimum,
    required this.maximum,
  });

  /// Return a [Breakpoint] that exists wherein the provided width exists in the
  /// range [minimum] inclusive and [maximum] exclusive.
  factory Breakpoint.inRange(double width) {
    for (var breakpoint in Breakpoint.values) {
      if (width >= breakpoint.minimum && width < breakpoint.maximum) {
        return breakpoint;
      }
    }

    throw UnsupportedError(
      'Unsupported width "$width" provided; a breakpoint could not be determined.',
    );
  }
}
