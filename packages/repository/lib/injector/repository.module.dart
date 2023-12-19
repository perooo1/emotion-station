//@GeneratedMicroModule;RepositoryPackageModule;package:repository/injector/repository.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:injectable/injectable.dart' as _i1;
import 'package:repository/repository.dart' as _i8;
import 'package:repository/src/authentication/authentication_manager.dart'
    as _i7;
import 'package:repository/src/authentication/authentication_repository.dart'
    as _i3;
import 'package:repository/src/database/database_repository.dart' as _i4;
import 'package:repository/src/secure_storage/secure_storage_repository.dart'
    as _i6;
import 'package:repository/src/users/parent_repository.dart' as _i5;

class RepositoryPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.singleton<_i3.IAuthenticationRepository>(_i3.AuthenticationRepository());
    gh.singleton<_i4.IDatabaseRepository>(_i4.DatabaseRepository());
    gh.factory<_i5.IParentRepository>(() => _i5.ParentRepository(
        databaseRepository: gh<_i4.IDatabaseRepository>()));
    gh.factory<_i6.ISecureStorageRepository>(
        () => _i6.SecureStorageRepository());
    gh.singleton<_i7.IAuthenticationManager>(_i7.AuthenticationManager(
      authenticationRepository: gh<_i8.IAuthenticationRepository>(),
      databaseRepository: gh<_i8.IDatabaseRepository>(),
    ));
  }
}
