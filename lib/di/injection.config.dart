// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../data/data_source/local/abstract/product_local_datasource.dart'
    as _i7;
import '../data/data_source/local/abstract/user_local_datasource.dart' as _i12;
import '../data/data_source/local/concrete/product_local_datasource_impl.dart'
    as _i8;
import '../data/data_source/local/concrete/user_local_datasource_impl.dart'
    as _i13;
import '../data/data_source/preferences/abstract/local_preferences.dart'
    as _i17;
import '../data/data_source/preferences/concrete/preferences_impl.dart' as _i18;
import '../data/data_source/remote/abstract/product_cloud_datasource.dart'
    as _i5;
import '../data/data_source/remote/abstract/user_cloud_datasource.dart' as _i10;
import '../data/data_source/remote/concrete/product_cloud_datasource_impl.dart'
    as _i6;
import '../data/data_source/remote/concrete/user_cloud_datasource_impl.dart'
    as _i11;
import '../data/database/database.dart' as _i3;
import '../data/network/http_network.dart' as _i4;
import '../data/repositories/product_repository_impl.dart' as _i20;
import '../data/repositories/user_repository_impl.dart' as _i15;
import '../domain/repositories/product_repository.dart' as _i19;
import '../domain/repositories/user_repository.dart' as _i14;
import '../domain/use_cases/get_product_name_usecase.dart' as _i21;
import '../domain/use_cases/get_user_name_usecase.dart' as _i16;
import 'app_module.dart' as _i22; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.lazySingleton<_i3.Database>(() => appModule.provideDatabase());
  gh.lazySingleton<_i4.HttpNetwork>(() => appModule.provideNetwork());
  gh.lazySingleton<_i5.ProductCloudDataSource>(
      () => _i6.ProductCloudDataSourceImpl(get<_i4.HttpNetwork>()));
  gh.lazySingleton<_i7.ProductLocalDataSource>(
      () => _i8.ProductLocalDataSourceImpl(get<_i3.Database>()));
  await gh.factoryAsync<_i9.SharedPreferences>(() => appModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i10.UserCloudDataSource>(
      () => _i11.UserCloudDataDataSourceImpl(get<_i4.HttpNetwork>()));
  gh.lazySingleton<_i12.UserLocalDataSource>(
      () => _i13.UserLocalDataDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i14.UserRepository>(() => _i15.UserRepositoryImpl(
      get<_i12.UserLocalDataSource>(), get<_i10.UserCloudDataSource>()));
  gh.factory<_i16.GetUserNameUseCase>(
      () => _i16.GetUserNameUseCase(get<_i14.UserRepository>()));
  gh.lazySingleton<_i17.LocalPreferences>(
      () => _i18.LocalPreferencesImpl(get<_i9.SharedPreferences>()));
  gh.factory<_i19.ProductRepository>(() => _i20.ProductRepositoryImpl(
      get<_i7.ProductLocalDataSource>(),
      get<_i5.ProductCloudDataSource>(),
      get<_i17.LocalPreferences>()));
  gh.factory<_i21.GetProductNameUseCase>(
      () => _i21.GetProductNameUseCase(get<_i19.ProductRepository>()));
  return get;
}

class _$AppModule extends _i22.AppModule {}
