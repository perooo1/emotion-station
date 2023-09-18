// Flutter imports:
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:emotion_station/navigation/router.dart';
import 'package:emotion_station/theme/theme.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:emotion_station/injector/injector.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  await configureDependencies();

  final router = Injector.locateService<IRouter>();

  runApp(EmotionStationApp(router: router));
}

ThemeManager _themeManager = ThemeManager();

class EmotionStationApp extends StatelessWidget {
  const EmotionStationApp({super.key, required this.router});

  final IRouter router;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router.router,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('hr'),
      ],

      //locale: Locale('en'),
      title: 'Emotion Station',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
