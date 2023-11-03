// Flutter imports:
import 'package:emotion_station/navigation/navigation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:repository/repository.dart';

class EmotionStationMainLayout extends StatelessWidget {
  const EmotionStationMainLayout({
    super.key,
    required this.authenticationManager,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;
  final IAuthenticationManager authenticationManager;

  @override
  Widget build(BuildContext context) {
    var currentRoutePath = GoRouterState.of(context).uri.toString();

    return Scaffold(
      body: navigationShell, // potentially wrap body in SafeArea
      bottomNavigationBar: !currentRoutePath.contains(EmotionStationRoutes.activityScreen.path)
          ? NavigationBar(
              destinations: [
                authenticationManager.getCurrentUser().isSpecialist
                    ? const NavigationDestination(
                        icon: Icon(Icons.home_outlined),
                        selectedIcon: Icon(Icons.home),
                        label: 'Home',
                      )
                    : const NavigationDestination(
                        icon: Icon(Icons.train_outlined),
                        selectedIcon: Icon(Icons.train),
                        label: 'Stations',
                      ),
                const NavigationDestination(
                  icon: Icon(Icons.child_care_outlined),
                  selectedIcon: Icon(Icons.child_care),
                  label: 'Children',
                ),
                const NavigationDestination(
                  icon: Icon(Icons.info_outline),
                  selectedIcon: Icon(Icons.info),
                  label: 'Info',
                ),
              ],
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: (index) => _onTap(context, index),
            )
          : null,
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
