import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double iconSize = 16.0;
const Color backgroundColor = Color.fromRGBO(4, 64, 20, 0.15);
const Color activeForegroundColor = Color.fromRGBO(255, 255, 255, 1.0);
const Color inactiveForegroundColor = Color.fromRGBO(4, 64, 20, 1);
const Color overlayColor = Color.fromRGBO(4, 64, 20, 1.0);

const Set<MaterialState> activeStates = <MaterialState>{
  MaterialState.focused,
  MaterialState.hovered,
  MaterialState.pressed,
  MaterialState.selected,
};

class PrimaryIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final void Function() onPressed;

  const PrimaryIconButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: iconSize,
      ),
      label: Text(
        label,
        style: GoogleFonts.nunitoSans(
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
          (Set<MaterialState> states) => backgroundColor,
        ),
        foregroundColor: MaterialStateColor.resolveWith(
          (Set<MaterialState> states) {
            if (states.any(activeStates.contains)) {
              return activeForegroundColor;
            }

            return inactiveForegroundColor;
          },
        ),
        overlayColor: MaterialStateColor.resolveWith((states) => overlayColor),
        animationDuration: Duration.zero,
      ),
    );
  }
}
