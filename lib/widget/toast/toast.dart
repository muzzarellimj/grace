import 'package:flutter/material.dart';

class Toast {
  final BuildContext context;
  final Color background;
  final Color foreground;
  final String message;

  const Toast({
    required this.context,
    required this.background,
    required this.foreground,
    required this.message,
  });

  factory Toast.success(BuildContext context, String message) {
    return Toast(
      context: context,
      background: Theme.of(context).primaryColorLight,
      foreground: Theme.of(context).primaryColor,
      message: message,
    );
  }

  factory Toast.failure(BuildContext context, String message) {
    return Toast(
      context: context,
      background: Colors.red.withOpacity(0.15),
      foreground: Colors.red,
      message: message,
    );
  }

  SnackBar asSnackbar() {
    const borderRadius = 12.0;
    const xMarginFactor = 0.25;
    const yMarginFactor = 0.015;

    return SnackBar(
      backgroundColor: background,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      dismissDirection: DismissDirection.up,
      duration: Durations.extralong4,
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * xMarginFactor,
        right: MediaQuery.of(context).size.width * xMarginFactor,
        bottom: MediaQuery.of(context).size.height * yMarginFactor,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(color: foreground),
      ),
      content: Text(
        message,
        style:
            Theme.of(context).textTheme.labelLarge?.copyWith(color: foreground),
        textAlign: TextAlign.center,
      ),
    );
  }
}
