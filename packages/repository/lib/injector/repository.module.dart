//@GeneratedMicroModule;RepositoryPackageModule;package:repository/injector/repository.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

// Dart imports:
import 'dart:async' as _i2;

// Package imports:
import 'package:injectable/injectable.dart' as _i1;

// Project imports:
import 'package:repository/repository.dart' as _i7;
import 'package:repository/src/database/database_repository.dart' as _i3;
import 'package:repository/src/users/parent_repository.dart' as _i4;

import 'package:repository/src/authentication/authentication_manager.dart'
    as _i6;
import 'package:repository/src/authentication/authentication_repository.dart'
    as _i5;

class RepositoryPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.singleton<_i3.IDatabaseRepository>(_i3.DatabaseRepository());
    gh.factory<_i4.IParentRepository>(() => _i4.ParentRepository(
        databaseRepository: gh<_i3.IDatabaseRepository>()));
    gh.singleton<_i5.IAuthenticationRepository>(_i5.AuthenticationRepository(
        databaseRepository: gh<_i3.IDatabaseRepository>()));
    gh.singleton<_i6.IAuthenticationManager>(_i6.AuthenticationManager(
        authenticationRepository: gh<_i7.IAuthenticationRepository>()));
  }
}
