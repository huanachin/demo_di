import 'package:demo_di/data/data_source/preferences/abstract/local_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferencesImpl implements LocalPreferences {
  final SharedPreferences _sharedPreferences;

  LocalPreferencesImpl(this._sharedPreferences);

  static const nameKey = "name_key";

  @override
  String? getName() {
    return _sharedPreferences.getString(nameKey);
  }

  @override
  Future<bool> setName(String name) {
    return _sharedPreferences.setString(nameKey, name);
  }
}
