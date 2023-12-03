import 'package:flutter/material.dart';
import 'package:grace/router.dart';

void main() {
  runApp(const Grace());
}

class Grace extends StatelessWidget {
  const Grace({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: GraceRouter.router);
  }
}
