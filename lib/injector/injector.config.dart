// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:common/injector/common.module.dart' as _i3;
import 'package:domain_models/domain_models.dart' as _i7;
import 'package:emotion_station_api/injector/emotion_station_api.module.dart'
    as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:repository/injector/repository.module.dart' as _i5;
import 'package:repository/repository.dart' as _i8;

import '../authentication_flow/bloc/register_cubit.dart' as _i13;
import '../authentication_flow/bloc/sign_in_cubit.dart' as _i14;
import '../features/children/bloc/children_screen_cubit.dart' as _i9;
import '../features/home/bloc/activity_cubit.dart' as _i6;
import '../features/home/bloc/home_cubit.dart' as _i10;
import '../features/info/bloc/info_screen_cubit.dart' as _i12;
import '../navigation/router.dart' as _i11;

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
  gh.factoryParam<_i6.ActivityCubit, _i7.EmotionStation, dynamic>((
    emotionStation,
    _,
  ) =>
      _i6.ActivityCubit(
        emotionStation: emotionStation,
        databaseRepository: gh<_i8.IDatabaseRepository>(),
      ));
  gh.factory<_i9.ChildrenScreenCubit>(() => _i9.ChildrenScreenCubit(
        authenticationManager: gh<_i8.IAuthenticationManager>(),
        databaseRepository: gh<_i8.IDatabaseRepository>(),
      ));
  gh.factory<_i10.HomeCubit>(() => _i10.HomeCubit(
        authenticationManager: gh<_i8.IAuthenticationManager>(),
        databaseRepository: gh<_i8.IDatabaseRepository>(),
      ));
  gh.singleton<_i11.IRouter>(_i11.EmotionStationRouter(
      authenticationManager: gh<_i8.IAuthenticationManager>()));
  gh.factory<_i12.InfoScreenCubit>(() => _i12.InfoScreenCubit(
      authenticationManager: gh<_i8.IAuthenticationManager>()));
  gh.factory<_i13.RegisterCubit>(() => _i13.RegisterCubit(
      authenticationManager: gh<_i8.IAuthenticationManager>()));
  gh.factory<_i14.SignInCubit>(() => _i14.SignInCubit(
      authenticationManager: gh<_i8.IAuthenticationManager>()));
  return getIt;
}
