import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grace/layout/scaffold/desktop.dart';
import 'package:grace/layout/scaffold/mobile.dart';

class GraceBaseScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const GraceBaseScaffold({required this.navigationShell, Key? key})
      : super(key: key ?? const ValueKey<String>('GracefulScaffold'));

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 600) {
        return GraceMobileScaffold(
            body: navigationShell,
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: _goBranch);
      } else {
        return GraceDesktopScaffold(
            body: navigationShell,
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: _goBranch);
      }
    });
  }

  void _goBranch(int index) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }
}
