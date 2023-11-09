import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ super.key });

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Grace'))
      ),
      body: const Center(
        child: Text('Hello world!')
      )
    );
  }
}