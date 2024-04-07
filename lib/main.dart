import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grace/firebase_options.dart';
import 'package:grace/router.dart';
import 'package:grace/theme/theme.dart';

void main() async {
  await dotenv.load();

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
      theme: GraceTheme.theme,
    );
  }
}
