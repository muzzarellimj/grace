import 'package:flutter/material.dart';
import 'package:grace/theme/measurement.dart';

class PrimaryIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function() onPressed;

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
        size: Measurement.getSizing(1.35),
      ),
      label: Text(
        label,
      ),
      style: ButtonStyle(
        animationDuration: Duration.zero,
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => Theme.of(context).primaryColorLight,
        ),
        textStyle: MaterialStateProperty.resolveWith(
          (states) => Theme.of(context).textTheme.labelMedium,
        ),
        foregroundColor: getForegroundState(context),
        overlayColor: MaterialStateColor.resolveWith(
          (states) => Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  MaterialStateProperty<Color> getForegroundState(BuildContext context) {
    const activeStates = <MaterialState>{
      MaterialState.focused,
      MaterialState.hovered,
      MaterialState.pressed,
      MaterialState.selected,
    };

    return MaterialStateProperty.resolveWith((states) {
      return states.any(activeStates.contains)
          ? Colors.white
          : Theme.of(context).primaryColor;
    });
  }
}
