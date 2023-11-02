class NavigationItem {
  const NavigationItem({required this.routeName, required this.path});

  final String routeName;
  final String path;
}

class EmotionStationRoutes {
  static const NavigationItem activityScreen =
      NavigationItem(routeName: 'activityScreen', path: 'activity_screen');
  static const NavigationItem childrenScreen =
      NavigationItem(routeName: 'childrenScreen', path: '/children_screen');
  static const NavigationItem childDetailsScreen =
      NavigationItem(routeName: 'childDetailsScreen', path: 'child_details_screen');
  static const NavigationItem homeScreen =
      NavigationItem(routeName: 'homeScreen', path: '/home_screen');
  static const NavigationItem infoScreen =
      NavigationItem(routeName: 'infoScreen', path: '/info_screen');
  //authentication
  static const NavigationItem loginScreen =
      NavigationItem(routeName: 'loginScreen', path: '/login_screen');
  static const NavigationItem registerScreen =
      NavigationItem(routeName: 'registerScreen', path: '/register_screen');
}
