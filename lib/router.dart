import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grace/screen/administration_screen.dart';
import 'package:grace/screen/authentication/signin_screen.dart';
import 'package:grace/screen/authentication/signup_screen.dart';
import 'package:grace/screen/home_screen.dart';
import 'package:grace/screen/library/library_screen.dart';
import 'package:grace/screen/settings.dart';
import 'package:grace/service/authentication_service.dart';
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
  static final administrationNavigationKey =
      GlobalKey<NavigatorState>(debugLabel: 'administration');

  static final authenticationService = AuthenticationService();

  static GoRouter router = GoRouter(
    navigatorKey: rootNavigationKey,
    initialLocation: '/',
    redirect: (BuildContext context, GoRouterState state) {
      if (!authenticationService.isAuthenticated) {
        if (state.fullPath != null && state.fullPath!.contains('signup')) {
          return null;
        } else {
          return '/signin';
        }
      }

      return null;
    },
    routes: [
      GoRoute(
        name: 'signup',
        path: '/signup',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            NoTransitionPage(
          child: SignupScreen(
            authenticationService: authenticationService,
          ),
        ),
      ),
      GoRoute(
        name: 'signin',
        path: '/signin',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            NoTransitionPage(
          child: SigninScreen(
            authenticationService: authenticationService,
          ),
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return ResponsiveLayout(
            navigationShell: navigationShell,
            authenticationService: authenticationService,
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
                    NoTransitionPage(
                  child: HomeScreen(
                    authenticationService: authenticationService,
                  ),
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
                    NoTransitionPage(
                  key: UniqueKey(),
                  child: LibraryScreen(
                    authenticationService: authenticationService,
                  ),
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
                    NoTransitionPage(
                  child: SettingsScreen(
                    authenticationService: authenticationService,
                  ),
                ),
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: administrationNavigationKey,
            routes: [
              GoRoute(
                name: 'administration',
                path: '/administration',
                pageBuilder: (
                  BuildContext context,
                  GoRouterState state,
                ) =>
                    NoTransitionPage(
                  child: AdministrationScreen(
                    authenticationService: authenticationService,
                  ),
                ),
              )
            ],
          ),
        ],
      )
    ],
  );
}
