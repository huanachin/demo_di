import 'package:demo_di/data/database/database.dart';
import 'package:demo_di/data/network/http_network.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AppModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  HttpNetwork provideNetwork() {
    return HttpNetwork();
  }

  @lazySingleton
  Database provideDatabase() {
    return Database();
  }
}
