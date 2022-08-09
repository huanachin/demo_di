import 'package:demo_di/data/data_source/local/abstract/product_local_datasource.dart';
import 'package:demo_di/data/data_source/local/abstract/user_local_datasource.dart';
import 'package:demo_di/data/data_source/local/concrete/product_local_datasource_impl.dart';
import 'package:demo_di/data/data_source/local/concrete/user_local_datasource_impl.dart';
import 'package:demo_di/data/data_source/preferences/abstract/local_preferences.dart';
import 'package:demo_di/data/data_source/preferences/concrete/preferences_impl.dart';
import 'package:demo_di/data/data_source/remote/abstract/product_cloud_datasource.dart';
import 'package:demo_di/data/data_source/remote/abstract/user_cloud_datasource.dart';
import 'package:demo_di/data/data_source/remote/concrete/product_cloud_datasource_impl.dart';
import 'package:demo_di/data/data_source/remote/concrete/user_cloud_datasource_impl.dart';
import 'package:demo_di/data/database/database.dart';
import 'package:demo_di/data/network/http_network.dart';
import 'package:demo_di/data/repositories/product_repository_impl.dart';
import 'package:demo_di/data/repositories/user_repository_impl.dart';
import 'package:demo_di/domain/repositories/product_repository.dart';
import 'package:demo_di/domain/repositories/user_repository.dart';
import 'package:demo_di/domain/use_cases/get_product_name_usecase.dart';
import 'package:demo_di/domain/use_cases/get_user_name_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerFactory(() => prefs);
  getIt.registerLazySingleton(() => Database());
  getIt.registerLazySingleton(() => HttpNetwork());
  getIt.registerSingleton<LocalPreferences>(LocalPreferencesImpl(getIt()));
  getIt.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataDataSourceImpl(getIt()));
  getIt.registerLazySingleton<UserCloudDataSource>(() => UserCloudDataDataSourceImpl(getIt()));
  getIt.registerLazySingleton<ProductLocalDataSource>(() => ProductLocalDataSourceImpl(getIt()));
  getIt.registerLazySingleton<ProductCloudDataSource>(() => ProductCloudDataSourceImpl(getIt()));
  getIt.registerFactory<UserRepository>(() => UserRepositoryImpl(getIt(), getIt()));
  getIt.registerFactory<ProductRepository>(() => ProductRepositoryImpl(getIt(), getIt(), getIt()));
  getIt.registerFactory(() => GetUserNameUseCase(getIt()));
  getIt.registerFactory(() => GetProductNameUseCase(getIt()));
}
