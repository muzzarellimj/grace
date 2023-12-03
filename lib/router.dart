import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grace/layout/scaffold/base.dart';
import 'package:grace/screens/collection.dart';
import 'package:grace/screens/home.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _collectionNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'collection');

class GraceRouter {
  static GoRouter router =
      GoRouter(navigatorKey: _rootNavigatorKey, initialLocation: '/', routes: [
    StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return GraceBaseScaffold(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(navigatorKey: _homeNavigatorKey, routes: [
            GoRoute(
                path: '/',
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    const NoTransitionPage(child: HomeScreen()))
          ]),
          StatefulShellBranch(navigatorKey: _collectionNavigatorKey, routes: [
            GoRoute(
                path: '/collection',
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    const NoTransitionPage(child: CollectionScreen()))
          ])
        ])
  ]);
}
