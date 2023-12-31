import 'package:flutter/material.dart';

class GraceDesktopScaffold extends StatelessWidget {
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  static const Color _backgroundColor = Color.fromRGBO(245, 243, 240, 1.0);
  static const double _iconSize = 30.0;
  static const double _imageSize = 36.0;
  static const Color _iconColor = Color.fromRGBO(4, 64, 20, 1.0);
  static const Color _indicatorColor = Color.fromRGBO(4, 64, 20, 0.15);
  static const double _yPadding = 28.0;

  const GraceDesktopScaffold({
    super.key,
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
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            destinations: const [
              NavigationRailDestination(
                label: Text('Home'),
                icon: Icon(Icons.home),
                padding: EdgeInsets.only(top: _yPadding, bottom: _yPadding / 2),
              ),
              NavigationRailDestination(
                label: Text('Collection'),
                icon: Icon(Icons.library_books),
                padding: EdgeInsets.only(top: _yPadding, bottom: _yPadding / 2),
                disabled: true,
              ),
            ],
            backgroundColor: _backgroundColor,
            indicatorColor: _indicatorColor,
            selectedIconTheme: const IconThemeData(
              size: _iconSize,
              color: _iconColor,
            ),
            unselectedIconTheme: const IconThemeData(
              size: _iconSize,
              color: _iconColor,
            ),
            leading: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: _yPadding, bottom: _yPadding),
              child: Image.asset(
                'assets/images/brand-fill.png',
                height: _imageSize,
              ),
            ),
          ),
          Expanded(child: body)
        ],
      ),
    );
  }
}
