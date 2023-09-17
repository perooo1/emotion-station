// Package imports:
import 'package:common/injector/common.module.dart';
import 'package:emotion_station_api/injector/emotion_station_api.module.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:repository/injector/repository.module.dart';

// Project imports:
import 'package:emotion_station/injector/injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
    initializerName: 'init', // default
    preferRelativeImports: true, // default
    asExtension: false, // default
    includeMicroPackages: true,
    externalPackageModules: [
      CommonPackageModule,
      EmotionStationApiPackageModule,
      RepositoryPackageModule,
    ])
Future<void> configureDependencies() => init(getIt);

class Injector {
  static T locateService<T extends Object>({dynamic param1, dynamic param2}) =>
      GetIt.I.get<T>(param1: param1, param2: param2);
}
