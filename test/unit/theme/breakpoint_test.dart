import 'package:grace/theme/breakpoint.dart';
import 'package:test/test.dart';

void main() {
  test('Breakpoint.inRange(360.0) should return Breakpoint.xs', () {
    Breakpoint breakpoint = Breakpoint.inRange(360.0);

    expect(breakpoint, equals(Breakpoint.xs));
  });

  test('Breakpoint.inRange(768.0) should return Breakpoint.md', () {
    Breakpoint breakpoint = Breakpoint.inRange(768.0);

    expect(breakpoint, equals(Breakpoint.md));
  });

  test('Breakpoint.inRange(1920.0) should return Breakpoint.xl', () {
    Breakpoint breakpoint = Breakpoint.inRange(1920.0);

    expect(breakpoint, equals(Breakpoint.xl));
  });

  test('Breakpoint.inRange(-1.0) should throw UnsupportedError', () {
    expect(
      () => Breakpoint.inRange(-1.0),
      throwsA(
        isA<UnsupportedError>().having(
          (error) => error.message,
          'message',
          'Unsupported width "-1.0" provided; a breakpoint could not be determined.',
        ),
      ),
    );
  });
}
