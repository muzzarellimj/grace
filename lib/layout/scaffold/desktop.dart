import 'package:flutter/material.dart';

class GraceDesktopScaffold extends StatelessWidget {
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  static const Color _backgroundColor = Color.fromRGBO(245, 243, 240, 1.0);
  static const double _iconSize = 28.0;
  static const Color _iconColor = Color.fromRGBO(4, 64, 20, 1.0);
  static const Color _indicatorColor = Color.fromRGBO(4, 64, 20, 0.15);

  const GraceDesktopScaffold(
      {super.key,
      required this.body,
      required this.selectedIndex,
      required this.onDestinationSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        NavigationRail(
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          destinations: const [
            NavigationRailDestination(
                label: Text('Home'), icon: Icon(Icons.home)),
            NavigationRailDestination(
                label: Text('Collections'), icon: Icon(Icons.library_books))
          ],
          backgroundColor: _backgroundColor,
          indicatorColor: _indicatorColor,
          selectedIconTheme:
              const IconThemeData(size: _iconSize, color: _iconColor),
          unselectedIconTheme:
              const IconThemeData(size: _iconSize, color: _iconColor),
        ),
        Expanded(child: body)
      ],
    ));
  }
}
