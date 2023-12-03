import 'package:flutter/material.dart';

class GraceMobileScaffold extends StatelessWidget {
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  static const Color _backgroundColor = Color.fromRGBO(245, 243, 240, 1.0);
  static const double _iconSize = 28.0;
  static const Color _iconColor = Color.fromRGBO(4, 64, 20, 1.0);
  static const Color _indicatorColor = Color.fromRGBO(4, 64, 20, 0.15);

  const GraceMobileScaffold(
      {super.key,
      required this.body,
      required this.selectedIndex,
      required this.onDestinationSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: body),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: const [
          NavigationDestination(
              label: 'Home',
              icon: Icon(Icons.home, color: _iconColor, size: _iconSize)),
          NavigationDestination(
              label: 'Collections',
              icon:
                  Icon(Icons.library_books, color: _iconColor, size: _iconSize))
        ],
        backgroundColor: _backgroundColor,
        indicatorColor: _indicatorColor,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      ),
    );
  }
}
