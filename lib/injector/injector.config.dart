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
import 'package:repository/repository.dart' as _i8;

import '../authentication_flow/bloc/register_cubit.dart' as _i12;
import '../authentication_flow/bloc/sign_in_cubit.dart' as _i13;
import '../features/children/bloc/children_screen_cubit.dart' as _i7;
import '../features/home/bloc/activity_cubit.dart' as _i6;
import '../features/home/bloc/home_cubit.dart' as _i9;
import '../features/info/bloc/info_screen_cubit.dart' as _i11;
import '../navigation/router.dart' as _i10;

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
  gh.factory<_i6.ActivityCubit>(() => _i6.ActivityCubit());
  gh.factory<_i7.ChildrenScreenCubit>(() => _i7.ChildrenScreenCubit(
        authenticationManager: gh<_i8.IAuthenticationManager>(),
        databaseRepository: gh<_i8.IDatabaseRepository>(),
      ));
  gh.factory<_i9.HomeCubit>(() => _i9.HomeCubit(
        authenticationManager: gh<_i8.IAuthenticationManager>(),
        databaseRepository: gh<_i8.IDatabaseRepository>(),
      ));
  gh.singleton<_i10.IRouter>(_i10.EmotionStationRouter(
      authenticationManager: gh<_i8.IAuthenticationManager>()));
  gh.factory<_i11.InfoScreenCubit>(() => _i11.InfoScreenCubit(
      authenticationManager: gh<_i8.IAuthenticationManager>()));
  gh.factory<_i12.RegisterCubit>(() => _i12.RegisterCubit(
      authenticationManager: gh<_i8.IAuthenticationManager>()));
  gh.factory<_i13.SignInCubit>(() => _i13.SignInCubit(
      authenticationManager: gh<_i8.IAuthenticationManager>()));
  return getIt;
}
