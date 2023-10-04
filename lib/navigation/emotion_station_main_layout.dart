// Flutter imports:
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
    return Scaffold(
      body: navigationShell, // potentially wrap body in SafeArea
      bottomNavigationBar: NavigationBar(
        destinations: [
          authenticationManager.getCurrentUser().isSpecialist
              ? const NavigationDestination(
                  icon: Icon(Icons.supervisor_account_outlined),
                  selectedIcon: Icon(Icons.supervisor_account),
                  label: 'Home',
                )
              : const NavigationDestination(
                  icon: Icon(Icons.train_outlined),
                  selectedIcon: Icon(Icons.train),
                  label: 'Home',
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
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
