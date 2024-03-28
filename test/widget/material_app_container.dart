import 'package:flutter/material.dart';

class MaterialAppContainer extends StatelessWidget {
  final Widget child;

  const MaterialAppContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp Widget Test Container',
      home: Material(
        child: child,
      ),
    );
  }
}
