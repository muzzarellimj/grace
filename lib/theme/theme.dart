import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GraceTheme {
  static ThemeData theme = ThemeData(
    canvasColor: const Color.fromRGBO(245, 243, 240, 1.0),
    primaryColor: const Color.fromRGBO(4, 64, 20, 1.0),
    primaryColorLight: const Color.fromRGBO(4, 64, 20, 0.15),
    scaffoldBackgroundColor: const Color.fromRGBO(245, 243, 240, 0.1),
    textTheme: TextTheme(
      // display
      displayLarge: roboto(
        fontSize: 94.0,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      ),
      displayMedium: roboto(
        fontSize: 60.0,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
      ),
      displaySmall: roboto(
        fontSize: 48.0,
        fontWeight: FontWeight.w300,
      ),

      // headline
      headlineLarge: roboto(
        fontSize: 42.0,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: roboto(
        fontSize: 32.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      headlineSmall: roboto(
        fontSize: 24.0,
        fontWeight: FontWeight.w400,
      ),

      // title
      titleLarge: roboto(
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.15,
      ),
      titleMedium: roboto(
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        height: 1.15,
        letterSpacing: 0.1,
      ),
      titleSmall: roboto(
        fontSize: 14.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.15,
      ),

      // label
      labelLarge: roboto(
        fontSize: 14.0,
        fontWeight: FontWeight.w700,
        height: 1.15,
      ),
      labelMedium: roboto(
        fontSize: 12.0,
        fontWeight: FontWeight.w700,
        height: 1.15,
      ),
      labelSmall: roboto(
        fontSize: 10.0,
        fontWeight: FontWeight.w700,
        height: 1.15,
      ),

      // body
      bodyLarge: roboto(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      bodyMedium: roboto(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        height: 1.15,
        letterSpacing: 0.25,
      ),
      bodySmall: roboto(
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
  }) roboto = GoogleFonts.roboto;
}
