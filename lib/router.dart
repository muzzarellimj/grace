import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grace/screen/collections.dart';
import 'package:grace/screen/home.dart';
import 'package:grace/screen/settings.dart';
import 'package:grace/widget/layout/responsive.dart';

class GraceRouter {
  static final rootNavigationKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  static final homeNavigationKey =
      GlobalKey<NavigatorState>(debugLabel: 'home');
  static final collectionsNavigationKey =
      GlobalKey<NavigatorState>(debugLabel: 'collections');
  static final settingsNavigationKey =
      GlobalKey<NavigatorState>(debugLabel: 'settings');

  static GoRouter router = GoRouter(
    navigatorKey: rootNavigationKey,
    initialLocation: '/',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return ResponsiveLayout(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: homeNavigationKey,
            routes: [
              GoRoute(
                name: 'home',
                path: '/',
                pageBuilder: (
                  BuildContext context,
                  GoRouterState state,
                ) =>
                    const NoTransitionPage(
                  child: HomeScreen(),
                ),
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: collectionsNavigationKey,
            routes: [
              GoRoute(
                name: 'collections',
                path: '/collections',
                pageBuilder: (
                  BuildContext context,
                  GoRouterState state,
                ) =>
                    const NoTransitionPage(
                  child: CollectionsScreen(),
                ),
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: settingsNavigationKey,
            routes: [
              GoRoute(
                name: 'settings',
                path: '/settings',
                pageBuilder: (
                  BuildContext context,
                  GoRouterState state,
                ) =>
                    const NoTransitionPage(
                  child: SettingsScreen(),
                ),
              )
            ],
          ),
        ],
      )
    ],
  );
}
