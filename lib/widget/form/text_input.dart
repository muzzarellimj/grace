import 'package:flutter/material.dart';
import 'package:grace/theme/measurement.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscure;
  final String? Function(String?)? validator;

  const TextInput({
    super.key,
    required this.controller,
    required this.label,
    this.obscure = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorHeight: Measurement.getSizing(1.0),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Theme.of(context).canvasColor,
        labelText: label,
        labelStyle: Theme.of(context).textTheme.labelMedium,
      ),
      obscureText: obscure,
      style: Theme.of(context).textTheme.bodyMedium,
      textAlignVertical:
          obscure ? TextAlignVertical.bottom : TextAlignVertical.center,
      validator: validator,
    );
  }
}
