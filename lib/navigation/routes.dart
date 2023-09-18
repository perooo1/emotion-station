class NavigationItem {
  const NavigationItem({required this.routeName, required this.path});

  final String routeName;
  final String path;
}

class EmotionStationRoutes {
  static const NavigationItem introScreen =
      NavigationItem(routeName: 'introScreen', path: '/intro_screen');
}
