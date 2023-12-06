import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grace/firebase_options.dart';
import 'package:grace/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Grace());
}

class Grace extends StatelessWidget {
  const Grace({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GraceRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
