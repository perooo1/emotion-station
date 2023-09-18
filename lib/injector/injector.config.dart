// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:common/injector/common.module.dart' as _i3;
import 'package:emotion_station_api/injector/emotion_station_api.module.dart'
    as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:repository/injector/repository.module.dart' as _i5;

import '../navigation/router.dart' as _i6;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  await _i3.CommonPackageModule().init(gh);
  await _i4.EmotionStationApiPackageModule().init(gh);
  await _i5.RepositoryPackageModule().init(gh);
  gh.singleton<_i6.IRouter>(_i6.EmotionStationRouter());
  return getIt;
}
