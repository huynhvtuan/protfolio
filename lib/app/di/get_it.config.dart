// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i3;
import 'package:protfolio/app/di/get_it.dart' as _i6;
import 'package:protfolio/core/config/resources/routes_manager.dart' as _i5;
import 'package:protfolio/data/network/network_info.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final utilInjectableModule = _$UtilInjectableModule();
    gh.lazySingleton<_i3.InternetConnectionChecker>(
        () => utilInjectableModule.internetConnectionChecker);
    gh.lazySingleton<_i4.NetworkInfo>(
        () => _i4.NetworkInfoImpl(gh<_i3.InternetConnectionChecker>()));
    gh.singleton<_i5.RoutesManager>(utilInjectableModule.appRouter);
    return this;
  }
}

class _$UtilInjectableModule extends _i6.UtilInjectableModule {}
