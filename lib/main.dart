// Flutter imports:
import 'package:emotion_station/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_localizations/flutter_localizations.dart';

// Project imports:
import 'package:emotion_station/injector/injector.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:emotion_station/navigation/router.dart';
import 'package:emotion_station/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
      themeMode: ThemeMode.system, //_themeManager.themeMode,
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
