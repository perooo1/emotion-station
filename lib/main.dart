// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:repository/repository.dart';

// Project imports:
import 'package:emotion_station/firebase_options.dart';
import 'package:emotion_station/injector/injector.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:emotion_station/navigation/router.dart';
import 'package:emotion_station/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await configureDependencies();

  final authRepository = Injector.locateService<IAuthenticationRepository>();
  final router = Injector.locateService<IRouter>();

  runApp(EmotionStationApp(
      authenticationRepository: authRepository, router: router));
}

class EmotionStationApp extends StatelessWidget {
  const EmotionStationApp({
    required this.authenticationRepository,
    required this.router,
    super.key,
  });

  final IAuthenticationRepository authenticationRepository;
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

      title: 'Emotion Station',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system, //_themeManager.themeMode,
    );
  }
}
