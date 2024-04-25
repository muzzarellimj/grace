import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grace/model/authentication/role.dart';
import 'package:grace/service/authentication_service.dart';
import 'package:grace/theme/measurement.dart';

class DesktopLayout extends StatelessWidget {
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final AuthenticationService authenticationService;

  const DesktopLayout({
    required super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.authenticationService,
  });

  @override
  Widget build(BuildContext context) {
    List<NavigationRailDestination> destinationSet = buildDestinationSet();

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
            destinations: destinationSet,
            trailing: Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(
                  bottom: Measurement.getSpacing(3.5),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12.0),
                  hoverColor: Theme.of(context).primaryColorLight,
                  onTap: () => handleLogoutButtonTap(context),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: Measurement.getSpacing(0.5),
                      bottom: Measurement.getSpacing(0.5),
                      left: Measurement.getSpacing(1.0),
                      right: Measurement.getSpacing(1.0),
                    ),
                    child: Icon(
                      Icons.logout_outlined,
                      size: Measurement.getSizing(2.5),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(child: body),
        ],
      ),
    );
  }

  List<NavigationRailDestination> buildDestinationSet() {
    List<NavigationRailDestination> destinationSet = [];

    destinationSet.addAll([
      buildDestination(Icons.home_outlined, 'Home'),
      buildDestination(Icons.library_books_outlined, 'Collections'),
      buildDestination(Icons.settings_outlined, 'Settings'),
    ]);

    if (authenticationService.role == Role.administrator) {
      destinationSet.add(
        buildDestination(Icons.rule_outlined, 'Administrative Dashboard'),
      );
    }

    return destinationSet;
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

  void handleLogoutButtonTap(context) {
    authenticationService.deauthenticate().then(
          (_) => GoRouter.of(context).goNamed(
            'signin',
          ),
        );
  }
}
