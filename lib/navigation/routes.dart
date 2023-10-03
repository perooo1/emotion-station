class NavigationItem {
  const NavigationItem({required this.routeName, required this.path});

  final String routeName;
  final String path;
}

class EmotionStationRoutes {
  static const NavigationItem loginScreen =
      NavigationItem(routeName: 'loginScreen', path: '/login_screen');
  static const NavigationItem registerScreen =
      NavigationItem(routeName: 'registerScreen', path: '/register_screen');
/*
  static const NavigationItem homeScreen =
      NavigationItem(routeName: 'homeScreen', path: '/home_screen');
*/
  static const NavigationItem childrenScreen =
      NavigationItem(routeName: 'childrenScreen', path: '/children_screen');
  static const NavigationItem parentsOverviewScreen =
      NavigationItem(routeName: 'parentsOverviewScreen', path: '/parents_overview_screen');
  static const NavigationItem infoScreen =
      NavigationItem(routeName: 'infoScreen', path: '/info_screen');
  static const NavigationItem stationActivityScreen =
      NavigationItem(routeName: 'stationActivityScreen', path: '/station_activity_screen');
}
