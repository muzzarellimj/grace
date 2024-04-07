import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grace/theme/breakpoint.dart';
import 'package:grace/widget/layout/desktop.dart';
import 'package:grace/widget/layout/mobile.dart';

class ResponsiveLayout extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ResponsiveLayout({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey<String>('GraceResponsiveScaffold'));

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (
        BuildContext context,
        BoxConstraints constraints,
      ) {
        Breakpoint breakpoint = Breakpoint.inRange(constraints.maxWidth);

        switch (breakpoint) {
          case Breakpoint.xs:
          case Breakpoint.sm:
            return MobileLayout(
              key: key,
              body: navigationShell,
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: navigate,
            );
          case Breakpoint.md:
          case Breakpoint.lg:
          case Breakpoint.xl:
            return DesktopLayout(
              key: key,
              body: navigationShell,
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: navigate,
            );
          default:
            throw UnsupportedError(
              'Unsupported breakpoint provided; unable to build responsive scaffold.',
            );
        }
      },
    );
  }

  void navigate(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
