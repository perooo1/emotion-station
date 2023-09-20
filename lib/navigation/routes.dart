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
  static const NavigationItem homeScreen =
      NavigationItem(routeName: 'homeScreen', path: '/home_screen');
}
