import 'package:flutter/material.dart';
import 'package:grace/theme/measurement.dart';

class MobileLayout extends StatelessWidget {
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const MobileLayout({
    required super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: body),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).canvasColor,
        animationDuration: Duration.zero,
        indicatorColor: Theme.of(context).primaryColorLight,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: [
          buildDestination(
            context,
            Icons.home_outlined,
            'Home',
          ),
          buildDestination(
            context,
            Icons.library_books_outlined,
            'Collections',
          ),
          buildDestination(
            context,
            Icons.settings_outlined,
            'Settings',
          ),
        ],
      ),
    );
  }

  NavigationDestination buildDestination(
    BuildContext context,
    IconData icon,
    String label,
  ) {
    return NavigationDestination(
      icon: Icon(
        icon,
        color: Theme.of(context).primaryColor,
        size: Measurement.getSizing(2.25),
      ),
      label: label,
    );
  }
}
