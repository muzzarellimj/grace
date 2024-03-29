import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GraceTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(245, 243, 240, 0.1),
    canvasColor: const Color.fromRGBO(245, 243, 240, 1.0),
    primaryColor: const Color.fromRGBO(4, 64, 20, 1.0),
    primaryColorLight: const Color.fromRGBO(4, 64, 20, 0.15),
    textTheme: TextTheme(
      // display
      displayLarge: _withRoboto(
        fontSize: 94.0,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      ),
      displayMedium: _withRoboto(
        fontSize: 60.0,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
      ),
      displaySmall: _withRoboto(
        fontSize: 48.0,
        fontWeight: FontWeight.w300,
      ),

      // headline
      headlineLarge: _withRoboto(
        fontSize: 42.0,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: _withRoboto(
        fontSize: 32.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      headlineSmall: _withRoboto(
        fontSize: 24.0,
        fontWeight: FontWeight.w400,
      ),

      // title
      titleLarge: _withRoboto(
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.15,
      ),
      titleMedium: _withRoboto(
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        height: 1.15,
        letterSpacing: 0.1,
      ),
      titleSmall: _withRoboto(
        fontSize: 14.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.15,
      ),

      // label
      labelLarge: _withRoboto(
        fontSize: 14.0,
        fontWeight: FontWeight.w700,
        height: 1.15,
      ),
      labelSmall: _withRoboto(
        fontSize: 10.0,
        fontWeight: FontWeight.w700,
        height: 1.15,
      ),

      // body
      bodyLarge: _withRoboto(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      bodyMedium: _withRoboto(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        height: 1.15,
        letterSpacing: 0.25,
      ),
      bodySmall: _withRoboto(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
    ),
  );

  static const TextStyle Function({
    Paint? background,
    Color? backgroundColor,
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    List<FontFeature>? fontFeatures,
    double? fontSize,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    Paint? foreground,
    double? height,
    double? letterSpacing,
    Locale? locale,
    List<Shadow>? shadows,
    TextBaseline? textBaseline,
    TextStyle? textStyle,
    double? wordSpacing,
  }) _withRoboto = GoogleFonts.roboto;
}
