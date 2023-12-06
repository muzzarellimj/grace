import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double xMarginMultipler = 0.25;
const double yMarginMultipler = 0.015;
const double borderRadius = 12.0;
const double breakpoint = 450.0;

class GraceNotification {
  static SnackBar success({
    required BuildContext context,
    required String content,
  }) {
    const Color backgroundColor = Color.fromRGBO(218, 224, 219, 1.0);
    const Color foregroundColor = Color.fromRGBO(4, 64, 20, 1.0);

    return SnackBar(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: const BorderSide(color: foregroundColor),
      ),
      elevation: 0,
      margin: EdgeInsets.only(
        // left: MediaQuery.of(context).size.width * xMarginMultipler,
        left: MediaQuery.of(context).size.width <= breakpoint
            ? MediaQuery.of(context).size.width * xMarginMultipler / 2
            : MediaQuery.of(context).size.width * xMarginMultipler,
        right: MediaQuery.of(context).size.width <= breakpoint
            ? MediaQuery.of(context).size.width * xMarginMultipler / 2
            : MediaQuery.of(context).size.width * xMarginMultipler,
        bottom: MediaQuery.of(context).size.height * yMarginMultipler,
      ),
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      content: Text(
        content,
        style: GoogleFonts.nunitoSans(
          color: foregroundColor,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  static SnackBar failure({
    required BuildContext context,
    required String content,
  }) {
    const backgroundColor = Color.fromRGBO(255, 159, 159, 1);
    const foregroundColor = Color.fromRGBO(134, 22, 22, 1);

    return SnackBar(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: const BorderSide(color: foregroundColor),
      ),
      elevation: 0,
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * xMarginMultipler,
        right: MediaQuery.of(context).size.width * xMarginMultipler,
        bottom: MediaQuery.of(context).size.height * yMarginMultipler,
      ),
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      content: Text(
        content,
        style: GoogleFonts.nunitoSans(
          color: foregroundColor,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
