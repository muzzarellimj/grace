import 'package:flutter/material.dart';
import 'package:grace/theme/measurement.dart';

class EmbeddedLink extends StatelessWidget {
  final String label;
  final void Function() onTap;

  const EmbeddedLink({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.0),
      hoverColor: Theme.of(context).primaryColorLight,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(Measurement.getSpacing(0.5)),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
      ),
    );
  }
}
