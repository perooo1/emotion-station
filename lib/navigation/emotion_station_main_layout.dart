// Flutter imports:
import 'package:emotion_station/l10n/generated/l10n.dart';
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
    final l10n = AppLocalizations.of(context);
    var currentRoutePath = GoRouterState.of(context).uri.toString();

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar:
          !currentRoutePath.contains(EmotionStationRoutes.activityScreen.path)
              ? NavigationBar(
                  destinations: [
                    authenticationManager.getCurrentUser().isSpecialist
                        ? NavigationDestination(
                            icon: const Icon(Icons.home_outlined),
                            selectedIcon: const Icon(Icons.home),
                            label: l10n.homeString,
                          )
                        : NavigationDestination(
                            icon: const Icon(Icons.train_outlined),
                            selectedIcon: const Icon(Icons.train),
                            label: l10n.stationsString,
                          ),
                    NavigationDestination(
                      icon: const Icon(Icons.child_care_outlined),
                      selectedIcon: const Icon(Icons.child_care),
                      label: l10n.childrenString,
                    ),
                    NavigationDestination(
                      icon: const Icon(Icons.info_outline),
                      selectedIcon: const Icon(Icons.info),
                      label: l10n.infoString,
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
