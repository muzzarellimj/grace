import 'package:flutter/material.dart';
import 'package:grace/theme/measurement.dart';

class DesktopLayout extends StatelessWidget {
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const DesktopLayout({
    required super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: Theme.of(context).canvasColor,
            indicatorColor: Theme.of(context).primaryColorLight,
            selectedIconTheme: buildIconThemeData(context),
            unselectedIconTheme: buildIconThemeData(context),
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            leading: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(
                top: Measurement.getSpacing(3.5),
                bottom: Measurement.getSpacing(7.5),
              ),
              child: Image.asset(
                'assets/images/brand-fill.png',
                height: Measurement.getSizing(3.0),
              ),
            ),
            destinations: [
              buildDestination(Icons.home_outlined, 'Home'),
              buildDestination(Icons.library_books_outlined, 'Collections'),
              buildDestination(Icons.settings_outlined, 'Settings'),
            ],
          ),
          Expanded(child: body),
        ],
      ),
    );
  }

  NavigationRailDestination buildDestination(IconData icon, String label) {
    return NavigationRailDestination(
      icon: Icon(icon),
      label: Text(label),
      padding: EdgeInsets.only(
        bottom: Measurement.getSpacing(2.0),
      ),
    );
  }

  IconThemeData buildIconThemeData(BuildContext context) {
    return IconThemeData(
      size: Measurement.getSizing(2.5),
      color: Theme.of(context).primaryColor,
    );
  }
}
