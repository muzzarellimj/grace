import 'package:flutter/material.dart';
import 'package:grace/widget/link/embedded_link.dart';

class EmbeddedLinkPhrase extends StatelessWidget {
  final String? prefix;
  final String label;
  final void Function() onTap;
  final String? suffix;
  final MainAxisAlignment? mainAxisAlignment;

  const EmbeddedLinkPhrase({
    super.key,
    this.prefix,
    required this.label,
    required this.onTap,
    this.suffix,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        Text(
          prefix ?? '',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        EmbeddedLink(
          label: label,
          onTap: onTap,
        ),
        Text(
          suffix ?? '',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}
